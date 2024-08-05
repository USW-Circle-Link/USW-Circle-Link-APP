import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:usw_circle_link/const/data.dart';
import 'package:usw_circle_link/models/UserModel.dart';
import 'package:usw_circle_link/repositories/AuthRepository.dart';
import 'package:usw_circle_link/repositories/UserMeRepository.dart';
import 'package:usw_circle_link/secure_storage/SecureStorage.dart';

final userViewModelProvider =
    StateNotifierProvider<UserViewModel, AsyncValue<UserModelBase?>>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  final userMeRepository = ref.watch(userMeRepositoryProvider);
  final storage = ref.watch(secureStorageProvider);

  userMeRepository.getMe();
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

  Future<UserModelBase> login({
    required String id,
    required String password,
  }) async {
    try {
      // 이 부분은 앞에서 본 부분과 동일
      final response = await authRepository.login(
        id: id,
        password: password,
      );

      // secure storage에 Token 보관
      await storage.write(key: accessTokenKey, value: response.accessToken);
      await storage.write(key: refreshTokenKey, value: response.refreshToken);

      final userResponse = await userMeRepository.getMe();

      // 현 state를 userReponse로 받음
      state = AsyncValue.data(userResponse);

      return userResponse;
    } catch (e) {
      await logout();
      throw Exception(e);
    }
  }

  Future<void> logout() async {
    // 로그아웃 시 User 상태를 null로 초기화
    state = AsyncValue.data(null);

    // Secure Storage에서 Access Token과 Refresh Token 삭제
    await Future.wait([
      storage.delete(key: accessTokenKey),
      storage.delete(key: refreshTokenKey),
    ]);
  }
}
