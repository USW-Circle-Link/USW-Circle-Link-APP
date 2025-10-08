import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../const/analytics_const.dart';
import '../../models/change_pw_model.dart';
import '../../models/profile_model.dart';
import '../../models/token_data.dart';
import '../../repositories/auth_repository.dart';
import '../../repositories/profile_repository.dart';
import '../../repositories/token_repository.dart';
import '../../../utils/command.dart';
import '../../../utils/result.dart';
import '../../../utils/decoder/jwt_decoder.dart';
import '../../../utils/logger/logger.dart';
import 'state/user_state.dart';

/// UserViewModel Provider
///
/// ChangeNotifierProvider를 사용하여 UserViewModel 인스턴스 제공
final userViewModelProvider = ChangeNotifierProvider<UserViewModel>((ref) {
  final authRepository = ref.read(authRepositoryProvider);
  final tokenRepository = ref.read(tokenRepositoryProvider);
  final profileRepository = ref.read(profileRepositoryProvider);

  return UserViewModel(
    authRepository: authRepository,
    tokenRepository: tokenRepository,
    profileRepository: profileRepository,
  );
});

/// 사용자 인증 및 프로필 관리를 담당하는 ViewModel
///
/// 가이드라인 2.1.2: ViewModel은 비즈니스 로직을 실행하고 View의 상태를 관리
/// 가이드라인 3.1: Command 패턴으로 비동기 작업 관리
class UserViewModel extends ChangeNotifier {
  UserViewModel({
    required AuthRepository authRepository,
    required TokenRepository tokenRepository,
    required ProfileRepository profileRepository,
  })  : _authRepository = authRepository,
        _tokenRepository = tokenRepository,
        _profileRepository = profileRepository {
    // Command 초기화 및 자동 로그인 시도
    getMe = Command0(_getMe)..execute();
    login = Command2(_login);
    logout = Command0(_logout);
    abnormalLogout = Command0(_abnormalLogout);
    changePW = Command3(_changePW);
    resetPW = Command3(_resetPW);
  }

  final AuthRepository _authRepository;
  final TokenRepository _tokenRepository;
  final ProfileRepository _profileRepository;

  // 상태 관리
  UserState _state = const UserState();
  UserState get state => _state;

  // Commands (가이드라인 3.1)
  late final Command0<void> getMe;
  late final Command2<void, String, String> login;
  late final Command0<void> logout;
  late final Command0<void> abnormalLogout;
  late final Command3<ChangePwModel, String, String, String> changePW;
  late final Command3<ChangePwModel, String, String, String> resetPW;

  /// 프로필 정보를 조회하여 자동 로그인 처리
  Future<Result<void>> _getMe() async {
    try {
      final result = await _profileRepository.getProfile();
      switch (result) {
        case Ok<ProfileData>():
          // FCM Token 전송 (필요시)
          // await _firebaseCloudMessagingViewModel.sendToken();
          logger.d('로그인 정보 확인 성공! : ${result.value}');

          // 토큰 확인
          final tokenResult = await _tokenRepository.getTokens();
          if (tokenResult is Ok<TokenData>) {
            logger.d(
                'accessToken : ${tokenResult.value.accessToken} / refreshToken : ${tokenResult.value.refreshToken}');
          }

          // UserState 업데이트
          _updateStateFromProfile(result.value);

          FirebaseAnalytics.instance.logLogin(
            loginMethod: LoginMethod.autoLogin.name,
            parameters: {
              AnalyticsParam.timestamp: DateTime.now().toIso8601String(),
              AnalyticsParam.major: result.value.major,
              AnalyticsParam.userName: result.value.userName,
              AnalyticsParam.studentNumber: result.value.studentNumber,
              AnalyticsParam.userHp: result.value.userHp,
            },
          );

          return Result.ok(null);

        case Error<ProfileData>():
          if (result.error is ProfileModelError &&
              (result.error as ProfileModelError).code == "NETWORK_ERROR") {
            // 네트워크 에러인 경우에는 로그아웃 처리 X
            logger.w('네트워크 에러');
            _state = _state.copyWith(error: result.error);
          } else {
            logger.w('로그인 정보 확인 실패! : ${result.error}');
            await _abnormalLogout();
          }
          return Result.error(result.error);
      }
    } finally {
      notifyListeners();
    }
  }

  /// 로그인 처리
  Future<Result<void>> _login(String id, String password) async {
    try {
      // FCM Token 가져오기
      // final token = await _firebaseCloudMessagingViewModel.getToken();
      final token = "dummy_token";
      logger.d('FCM Token - $token');

      final result = await _authRepository.login(
        id: id,
        password: password,
        fcmToken: token,
      );

      switch (result) {
        case Ok():
          logger.d('UserViewModel - 로그인 완료! ${result.value}');

          // JWT 디코딩
          final payload = JwtDecoder.decode(result.value.accessToken);
          logger.d('payload - $payload');

          // 토큰 저장 (TokenRepository 사용)
          final clubUUIDs = (payload['clubUUIDs'] as List<dynamic>?)
                  ?.map((e) => e.toString())
                  .toList() ??
              [];

          final saveResult = await _tokenRepository.saveTokens(
            accessToken: result.value.accessToken,
            refreshToken: result.value.refreshToken,
            clubUUIDs: clubUUIDs,
          );

          if (saveResult is Error) {
            logger.e('토큰 저장 실패: ${saveResult.error}');
            return Result.error(saveResult.error);
          }

          // UserState 업데이트
          _state = _state.copyWith(
            isAuthorized: true,
            error: null,
          );

          FirebaseAnalytics.instance
              .logLogin(loginMethod: LoginMethod.login.name);

          return Result.ok(null);

        case Error():
          logger.d('UserViewModel - 로그인 실패! ${result.error}');
          _state = _state.copyWith(
            isAuthorized: false,
            error: result.error,
          );
          return Result.error(result.error);
      }
    } finally {
      notifyListeners();
    }
  }

  /// 로그아웃 처리
  Future<Result<void>> _logout() async {
    try {
      await _performLogout(false);
      return Result.ok(null);
    } catch (e) {
      logger.e('로그아웃 중 에러 발생: $e');
      return Result.error(Exception('로그아웃 실패: $e'));
    } finally {
      notifyListeners();
    }
  }

  /// 비정상 로그아웃 처리
  Future<Result<void>> _abnormalLogout() async {
    try {
      await _performLogout(true);
      return Result.ok(null);
    } catch (e) {
      logger.e('비정상 로그아웃 실패: $e');
      return Result.error(Exception('비정상 로그아웃 실패: $e'));
    } finally {
      notifyListeners();
    }
  }

  /// 실제 로그아웃 수행 (내부 메서드)
  Future<void> _performLogout(bool? isAbnormalLogout) async {
    // 토큰 조회
    final tokenResult = await _tokenRepository.getTokens();

    String? accessToken;
    String? refreshToken;

    if (tokenResult is Ok<TokenData>) {
      accessToken = tokenResult.value.accessToken;
      refreshToken = tokenResult.value.refreshToken;
    }

    // 토큰 삭제
    await _tokenRepository.clearTokens();

    // 확인 로그
    final verifyResult = await _tokenRepository.getTokens();
    if (verifyResult is Error) {
      logger.d('UserViewModel - 토큰 삭제 성공!');
    }

    // Firebase Analytics
    FirebaseAnalytics.instance.logEvent(
      name: isAbnormalLogout ?? false
          ? LogoutMethod.abnormalLogout.name
          : LogoutMethod.logout.name,
      parameters: {
        'timestamp': DateTime.now().toIso8601String(),
      },
    );

    // 서버에 로그아웃 요청
    if (accessToken != null && refreshToken != null) {
      final result = await _authRepository.logout(
        accessToken: accessToken,
        refreshToken: refreshToken,
      );

      switch (result) {
        case Ok<bool>():
          logger.d('서버 로그아웃 성공');
        case Error<bool>():
          logger.w('서버 로그아웃 실패: ${result.error}');
      }
    }

    // UserState 초기화
    _state = const UserState();
  }

  /// 비밀번호 변경
  Future<Result<ChangePwModel>> _changePW(
    String userPw,
    String newPw,
    String confirmNewPw,
  ) async {
    try {
      final result = await _authRepository.changePW(
        userPw: userPw,
        newPw: newPw,
        confirmNewPw: confirmNewPw,
      );

      switch (result) {
        case Ok<ChangePwModel>():
          logger.d('비밀번호 변경 성공');
          // 비밀번호 변경 후 재로그인 필요
          await _abnormalLogout();
          return result;

        case Error<ChangePwModel>():
          logger.e('비밀번호 변경 실패: ${result.error}');
          _state = _state.copyWith(error: result.error);
          return result;
      }
    } finally {
      notifyListeners();
    }
  }

  /// 비밀번호 재설정
  Future<Result<ChangePwModel>> _resetPW(
    String newPw,
    String confirmNewPw,
    String uuid,
  ) async {
    try {
      final result = await _authRepository.resetPW(
        password: newPw,
        confirmPassword: confirmNewPw,
        uuid: uuid,
      );

      switch (result) {
        case Ok<ChangePwModel>():
          logger.d('비밀번호 재설정 성공');
          return result;

        case Error<ChangePwModel>():
          logger.e('비밀번호 재설정 실패: ${result.error}');
          _state = _state.copyWith(error: result.error);
          return result;
      }
    } finally {
      notifyListeners();
    }
  }

  /// ProfileData를 UserState로 변환
  void _updateStateFromProfile(ProfileData profile) {
    _state = _state.copyWith(
      isAuthorized: true,
      userName: profile.userName,
      studentNumber: profile.studentNumber,
      userHp: profile.userHp,
      major: profile.major,
      error: null,
    );
  }

  @override
  void dispose() {
    // Command들은 자동으로 dispose됨
    super.dispose();
  }
}

/// 자동 로그인 예외
class AutoLoginException implements Exception {
  final String message;
  AutoLoginException({required this.message});

  @override
  String toString() {
    return 'AutoLoginException(message:$message)';
  }
}
