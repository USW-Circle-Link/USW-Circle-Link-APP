import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:usw_circle_link/const/data.dart';
import 'package:usw_circle_link/models/change_pw_model.dart';
import 'package:usw_circle_link/models/delete_user_model.dart';
import 'package:usw_circle_link/models/profile_model.dart';
import 'package:usw_circle_link/models/user_model.dart';
import 'package:usw_circle_link/repositories/auth_repository.dart';
import 'package:usw_circle_link/repositories/delete_user_repository.dart';
import 'package:usw_circle_link/repositories/fcm_repository.dart';
import 'package:usw_circle_link/repositories/user_me_repository.dart';
import 'package:usw_circle_link/secure_storage/secure_storage.dart';
import 'package:usw_circle_link/utils/decoder/jwt_decoder.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';
import 'package:usw_circle_link/viewmodels/fcm_view_model.dart';
import 'package:usw_circle_link/viewmodels/profile_view_model.dart';

final userViewModelProvider =
    StateNotifierProvider<UserViewModel, AsyncValue<UserModel?>>((ref) {
  final authRepository = ref.read(authRepositoryProvider);
  final userMeRepository = ref.read(userMeRepositoryProvider);
  final deleteUserRepository = ref.read(deleteUserRepositoryProvider);
  final profileViewModel = ref.read(profileViewModelProvider.notifier);
  final firebaseCloudMessagingViewModel =
      ref.read(firebaseCloudMessagingViewModelProvider.notifier);
  final storage = ref.read(secureStorageProvider);

  return UserViewModel(
    authRepository: authRepository,
    userMeRepository: userMeRepository,
    deleteUserRepository: deleteUserRepository,
    profileViewModel: profileViewModel,
    firebaseCloudMessagingViewModel: firebaseCloudMessagingViewModel,
    storage: storage,
  );
});

class UserViewModel extends StateNotifier<AsyncValue<UserModel?>> {
  final AuthRepository authRepository;
  final UserMeRepository userMeRepository;
  final DeleteUserRepository deleteUserRepository;
  final ProfileViewModel profileViewModel;
  final FirebaseCloudMessagingViewModel firebaseCloudMessagingViewModel;
  final FlutterSecureStorage storage;

  UserViewModel({
    required this.authRepository,
    required this.userMeRepository,
    required this.deleteUserRepository,
    required this.profileViewModel,
    required this.firebaseCloudMessagingViewModel,
    required this.storage,
  }) : super(AsyncValue.data(null)) {
    getMe();
  }

  Future<void> getMe() async {
    try {
      final profile = await profileViewModel.getProfile();
      if (profile is ProfileModel) {
        logger.d('로그인 정보 확인 성공! : $profile');
      } else {
        throw AutoLoginException(message: '로그인 정보 확인 실패! : $profile');
      }

      // FCM Token 전송
      await firebaseCloudMessagingViewModel.sendToken();

      final accessToken = await storage.read(key: accessTokenKey);
      final refreshToken = await storage.read(key: refreshTokenKey);
      state = AsyncValue.data(
        UserModel(
          data: LoginData(
            accessToken: accessToken!,
            refreshToken: refreshToken!,
          ),
          message: '자동 로그인됨',
        ),
      );
    } catch (e) {
      logger.e('로그인 정보 확인 실패! : $e');
      state = AsyncValue.data(null);
      await logout();
    }
  }

  Future<UserModel> login({
    required String id,
    required String password,
  }) async {
    try {
      final token = await firebaseCloudMessagingViewModel.getToken();
      logger.d('FCM Token - $token');

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
      await storage.write(
          key: refreshTokenKey, value: response.data.refreshToken);
      await storage.write(
          key: clubUUIDsKey, value: jsonEncode(payload['clubUUIDs'] ?? []));

      // 디버깅용 확인 코드
      final accessToken = await storage.read(key: accessTokenKey);
      final refreshToken = await storage.read(key: refreshTokenKey);
      final clubUUIDsJsonString = await storage.read(key: clubUUIDsKey);
      final List<dynamic> clubUUIDs = jsonDecode(clubUUIDsJsonString ?? "[]");
      logger.d(
          'UserViewModel - AccessToken : $accessToken / RefreshToken : $refreshToken / clubUUIDsJsonString : $clubUUIDsJsonString / clubUUIDs : $clubUUIDs 저장 성공!');

      state = AsyncValue.data(response); // UserModel
      return response;
    } on UserModelError catch (e) {
      // 단순로그인 실패 및 예상 범위 밖 에러(네트워크 에러 ...)
      logger.d(e);

      rethrow;
    } on FCMTokenNotFoundException catch (e) {
      logger.d(e);

      rethrow;
    } catch (e) {
      logger.e('예외발생 - $e');

      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      // 로그아웃 시 User 상태를 null로 초기화
      state = AsyncValue.data(null);

      String? accessToken0 = await storage.read(key: accessTokenKey);
      String? refreshToken0 = await storage.read(key: refreshTokenKey);
      // Secure Storage에서 Access Token과 Refresh Token, clubUUIDs 삭제
      await Future.wait([
        storage.delete(key: accessTokenKey),
        storage.delete(key: refreshTokenKey),
        storage.delete(key: clubUUIDsKey),
      ]);

      final accessToken = await storage.read(key: accessTokenKey);
      final refreshToken = await storage.read(key: refreshTokenKey);
      final clubUUIDsJsonString = await storage.read(key: clubUUIDsKey);
      final List<dynamic> clubUUIDs = jsonDecode(clubUUIDsJsonString ?? "[]");
      logger.d(
          'UserViewModel - AccessToken : $accessToken / RefreshToken : $refreshToken / clubUUIDsJsonString : $clubUUIDsJsonString / clubUUIDs : $clubUUIDs 삭제 성공!');

      await authRepository.logout(
          accessToken: accessToken0 ?? "", refreshToken: refreshToken0 ?? "");
    } on UserModelError catch (e) {
      logger.d(e);
      rethrow;
    } catch (e) {
      logger.e('예외발생 - $e');
      rethrow;
    }
  }

  Future<ChangePwModel> changePW({
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
    } on ChangePwModelError catch (e) {
      // 단순로그인 실패 및 예상 범위 밖 에러(네트워크 에러 ...)
      logger.d(e);
      rethrow;
    } catch (e) {
      logger.e('예외발생 - $e');
      rethrow;
    }
  }

  Future<ChangePwModel> resetPW({
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
    } on ChangePwModelError catch (e) {
      // 예외처리 안 실패
      logger.d(e);
      rethrow;
    } catch (e) {
      // 예외처리 밖 에러(네트워크 에러 ...)
      logger.e('예외발생 - $e');
      rethrow;
    }
  }

  Future<DeleteUserModel> verifyCode({
    required String code,
  }) async {
    try {
      final response = await deleteUserRepository.verifyCode(code: code);
      return response;
    } on DeleteUserModelError catch (e) {
      // 예외처리 안 실패
      logger.d(e);
      rethrow;
    } catch (e) {
      // 예외처리 밖 에러(네트워크 에러 ...)
      logger.e('예외발생 - $e');
      rethrow;
    }
  }

  Future<DeleteUserModel> sendCode() async {
    try {
      final response = await deleteUserRepository.sendCode();
      return response;
    } on DeleteUserModelError catch (e) {
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

class AutoLoginException implements Exception {
  final String message;
  AutoLoginException({required this.message});

  @override
  String toString() {
    return 'AutoLoginException(message:$message)';
  }
}
