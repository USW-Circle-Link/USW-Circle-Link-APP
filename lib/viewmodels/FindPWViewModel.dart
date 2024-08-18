import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:usw_circle_link/const/data.dart';
import 'package:usw_circle_link/models/FindPWModel.dart';
import 'package:usw_circle_link/repositories/AuthRepository.dart';
import 'package:usw_circle_link/secure_storage/SecureStorage.dart';

final findPWViewModelProvider =
    StateNotifierProvider.autoDispose<FindPWViewModel, FindPWModelBase?>((ref) {
  final AuthRepository authRepository = ref.read(authRepositoryProvider);
  final FlutterSecureStorage storage = ref.read(secureStorageProvider);
  return FindPWViewModel(
    authRepository: authRepository,
    storage: storage,
  );
});

class FindPWViewModel extends StateNotifier<FindPWModelBase?> {
  final AuthRepository authRepository;
  final FlutterSecureStorage storage;
  FindPWViewModel({
    required this.authRepository,
    required this.storage,
  }) : super(null);

  Future<FindPWModelBase> sendCode({
    required String account,
    required String email,
  }) async {
    try {
      if (account.isEmpty) {
        throw FindPWModelError(
          message: '아이디가 형식에 맞지 않습니다.',
          code: 'EML-F200',
          type: FindPWModelType.sendCode,
        );
      }
      if (email.isEmpty) {
        throw FindPWModelError(
          message: '이메일이 형식에 맞지 않습니다.',
          code: 'EML-F100',
          type: FindPWModelType.sendCode,
        );
      }
      state = FindPWModelLoading();
      final response =
          await authRepository.sendCode(account: account, email: email);
      final accessToken = response.data;

      if (accessToken == null) {
        throw FindPWModelError(
          message: '액세스토큰이 존재하지 않습니다.',
          code: "EML-F300",
          type: FindPWModelType.sendCode,
        );
      }

      await storage.write(key: accessTokenKey, value: accessToken);

      state = response;
    } on FindPWModelError catch (e) {
      state = e;
    } catch (e) {
      state = FindPWModelError(
          message: '예외발생 - $e', type: FindPWModelType.sendCode);
    }

    return Future.value(state);
  }

  void initState() {
    state = null;
  }

  Future<FindPWModelBase> verifyCode({
    required String code,
    required String? uuid,
  }) async {
    try {
      if (code.isEmpty) {
        throw FindPWModelError(
          message: '인증코드가 형식에 맞지 않습니다.',
          code: 'VC-F100',
          type: FindPWModelType.verifyCode,
        );
      }
      if (uuid == null) {
        throw FindPWModelError(
          message: 'uuid가 존재하지 않습니다.',
          code: 'VC-F200',
          type: FindPWModelType.verifyCode,
        );
      }
      state = FindPWModelLoading();
      final response = await authRepository.verifyCode(
        code: code,
        uuid: uuid,
      );
      state = response;
    } on FindPWModelError catch (e) {
      state = e;
    } catch (e) {
      state = FindPWModelError(
        message: '예외발생 - $e',
        type: FindPWModelType.verifyCode,
      );
    }

    return Future.value(state);
  }
}
