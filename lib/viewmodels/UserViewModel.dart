import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:usw_circle_link/const/data.dart';
import 'package:usw_circle_link/models/ChangePWModel.dart';
import 'package:usw_circle_link/models/UserModel.dart';
import 'package:usw_circle_link/repositories/AuthRepository.dart';
import 'package:usw_circle_link/repositories/UserMeRepository.dart';
import 'package:usw_circle_link/secure_storage/SecureStorage.dart';
import 'package:usw_circle_link/utils/logger/Logger.dart';

final userViewModelProvider =
    StateNotifierProvider<UserViewModel, AsyncValue<UserModelBase?>>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  final userMeRepository = ref.watch(userMeRepositoryProvider);
  final storage = ref.watch(secureStorageProvider);

  return UserViewModel(
    authRepository: authRepository,
    userMeRepository: userMeRepository,
    storage: storage,
  );
});

class UserViewModel extends StateNotifier<AsyncValue<UserModelBase?>> {
  final AuthRepository authRepository;
  final UserMeRepository userMeRepository;
  final FlutterSecureStorage storage;

  UserViewModel({
    required this.authRepository,
    required this.userMeRepository,
    required this.storage,
  }) : super(AsyncValue.loading()) {
    getMe();
  }

  Future<void> getMe() async {
    try {
      final user = await userMeRepository.getMe();
      state = AsyncValue.data(user);
    } catch (e) {
      state = AsyncValue.data(null);
    }
  }

  Future<UserModel> login({
    required String id,
    required String password,
  }) async {
    try {
      // 이 부분은 앞에서 본 부분과 동일
      final response = await authRepository.login(
        id: id,
        password: password,
      );
      logger.d('UserViewModel - 로그인 완료! $response');

      // secure storage에 Token 보관
      await storage.write(
          key: accessTokenKey, value: response.data.accessToken);
      await storage.write(
          key: clubIdsKey, value: jsonEncode(response.data.clubIds ?? []));

      // 디버깅용 확인 코드
      final accessToken = await storage.read(key: accessTokenKey);
      final clubIdsJsonString = await storage.read(key: clubIdsKey);
      final List<dynamic> clubIds = jsonDecode(clubIdsJsonString ?? "");
      logger.d(
          'UserViewModel - AccessToken : $accessToken / clubIdsJsonString : $clubIdsJsonString / clubIds : $clubIds 저장 성공!');
      state = AsyncValue.data(response); // UserModel

      return response;
    } on UserModelError catch (e) {
      // 단순로그인 실패 및 예상 범위 밖 에러(네트워크 에러 ...)
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
    // 로그아웃 시 User 상태를 null로 초기화
    state = AsyncValue.data(null);

    // Secure Storage에서 Access Token과 Refresh Token 삭제
    await Future.wait([
      storage.delete(key: accessTokenKey),
      storage.delete(key: clubIdsKey),
    ]);
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

  Future<ChangePWModel> resetPW(
      {required String newPw, required String confirmNewPw}) async {
    try {
      final response = await authRepository.resetPW(
        newPw: newPw,
        confirmNewPw: confirmNewPw,
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
