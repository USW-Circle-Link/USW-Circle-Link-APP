import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:usw_circle_link/const/data.dart';
import 'package:usw_circle_link/models/ChangePWModel.dart';
import 'package:usw_circle_link/models/UserModel.dart';
import 'package:usw_circle_link/repositories/AuthRepository.dart';
import 'package:usw_circle_link/repositories/FCMRepository.dart';
import 'package:usw_circle_link/repositories/UserMeRepository.dart';
import 'package:usw_circle_link/secure_storage/SecureStorage.dart';
import 'package:usw_circle_link/utils/decoder/JWTDecoder.dart';
import 'package:usw_circle_link/utils/logger/Logger.dart';

final userViewModelProvider =
    StateNotifierProvider<UserViewModel, AsyncValue<UserModelBase?>>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  final userMeRepository = ref.watch(userMeRepositoryProvider);
  final fcmRepository = ref.watch(fcmRepositoryProvider);
  final storage = ref.watch(secureStorageProvider);

  return UserViewModel(
    authRepository: authRepository,
    userMeRepository: userMeRepository,
    fcmRepository: fcmRepository,
    storage: storage,
  );
});

class UserViewModel extends StateNotifier<AsyncValue<UserModel?>> {
  final AuthRepository authRepository;
  final UserMeRepository userMeRepository;
  final FCMRepository fcmRepository;
  final FlutterSecureStorage storage;

  UserViewModel({
    required this.authRepository,
    required this.userMeRepository,
    required this.fcmRepository,
    required this.storage,
  }) : super(AsyncValue.loading()) {
    getMe();
  }

  Future<void> getMe() async {
    try {
      final user = await userMeRepository.getMe();
      logger.d('로그인 정보 확인 성공! : $user');
      state = AsyncValue.data(user);
    } catch (e) {
      logger.d('로그인 정보 확인 실패! : $e');
      state = AsyncValue.data(null);
    }
  }

  Future<UserModel> login({
    required String id,
    required String password,
  }) async {
    try {
      //fcm token 가져오기
      final token = await fcmRepository.getToken();
      logger.d('FCMToken - $token');

      final response = await authRepository.login(
        id: id,
        password: password,
        fcmToken: token,
      );
      logger.d('UserViewModel - 로그인 완료! $response');

      final payload = JwtDecoder.decode(response.data.accessToken);

      logger.d('payload - $payload');

      // secure storage에 Token 보관
      await storage.write(
          key: accessTokenKey, value: response.data.accessToken);
      await storage.write(key: refreshTokenKey, value: response.data.refreshToken);
      await storage.write(
          key: clubIdsKey, value: jsonEncode(payload['clubIds'] ?? []));

      // 디버깅용 확인 코드
      final accessToken = await storage.read(key: accessTokenKey);
      final refreshToken = await storage.read(key: refreshTokenKey);
      final clubIdsJsonString = await storage.read(key: clubIdsKey);
      final List<dynamic> clubIds = jsonDecode(clubIdsJsonString ?? "[]");
      logger.d(
          'UserViewModel - AccessToken : $accessToken / RefreshToken : $refreshToken / clubIdsJsonString : $clubIdsJsonString / clubIds : $clubIds 저장 성공!');
      state = AsyncValue.data(response); // UserModel

      return response;
    } on UserModelError catch (e) {
      // 단순로그인 실패 및 예상 범위 밖 에러(네트워크 에러 ...)
      logger.d(e);
      await logout();
      rethrow;
    } on FCMTokenNotFoundException catch (e) {
      logger.d(e);
      await logout();
      rethrow;
    } catch (e) {
      logger.e('예외발생 - $e');
      await logout();
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      // 로그아웃 시 User 상태를 null로 초기화
      state = AsyncValue.data(null);

      String? _accessToken = await storage.read(key: accessTokenKey);
      // Secure Storage에서 Access Token과 Refresh Token, clubIds 삭제
      await Future.wait([
        storage.delete(key: accessTokenKey),
        storage.delete(key: refreshTokenKey),
        storage.delete(key: clubIdsKey),
      ]);

      final accessToken = await storage.read(key: accessTokenKey);
      final refreshToken = await storage.read(key: refreshTokenKey);
      final clubIdsJsonString = await storage.read(key: clubIdsKey);
      final List<dynamic> clubIds = jsonDecode(clubIdsJsonString ?? "[]");
      logger.d(
          'UserViewModel - AccessToken : $accessToken / RefreshToken : $refreshToken / clubIdsJsonString : $clubIdsJsonString / clubIds : $clubIds 삭제 성공!');

      await authRepository.logout(accessToken: _accessToken??"");
    } on UserModelError catch (e) {
      logger.d(e);
      rethrow;
    } catch (e) {
      logger.e('예외발생 - $e');
      rethrow;
    }
  }

  Future<ChangePWModel> changePW({
    required String userPw,
    required String newPw,
    required String confirmNewPw,
  }) async {
    try {
      final response = await authRepository.changePW(
        userPw: userPw,
        newPw: newPw,
        confirmNewPw: confirmNewPw,
      );
      // 비밀번호 변경되는 경우
      // 1. 사용자가 직접 비밀번호 변경
      // 2. 비밀번호 찾기를 통한 비밀번호 변경
      // -->> 두 경우 모두 다시 로그인하는 과정 필요!
      await logout();
      return response;
    } on ChangePWModelError catch (e) {
      // 단순로그인 실패 및 예상 범위 밖 에러(네트워크 에러 ...)
      logger.d(e);
      rethrow;
    } catch (e) {
      logger.e('예외발생 - $e');
      rethrow;
    }
  }

  Future<ChangePWModel> resetPW({
    required String newPw,
    required String confirmNewPw,
    required String uuid,
  }) async {
    try {
      final response = await authRepository.resetPW(
        password: newPw,
        confirmPassword: confirmNewPw,
        uuid: uuid,
      );
      return response;
    } on ChangePWModelError catch (e) {
      // 예외처리 안 실패
      logger.d(e);
      rethrow;
    } catch (e) {
      // 예외처리 밖 에러(네트워크 에러 ...)
      logger.e('예외발생 - $e');
      rethrow;
    }
  }
}
