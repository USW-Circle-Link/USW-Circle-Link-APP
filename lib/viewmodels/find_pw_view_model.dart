import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:usw_circle_link/const/data.dart';
import 'package:usw_circle_link/models/find_pw_model.dart';
import 'package:usw_circle_link/repositories/auth_repository.dart';
import 'package:usw_circle_link/secure_storage/secure_storage.dart';

final findPwViewModelProvider =
    StateNotifierProvider.autoDispose<FindPwViewModel, FindPwModelBase?>((ref) {
  final AuthRepository authRepository = ref.read(authRepositoryProvider);
  final FlutterSecureStorage storage = ref.read(secureStorageProvider);
  return FindPwViewModel(
    authRepository: authRepository,
    storage: storage,
  );
});

class FindPwViewModel extends StateNotifier<FindPwModelBase?> {
  final AuthRepository authRepository;
  final FlutterSecureStorage storage;
  FindPwViewModel({
    required this.authRepository,
    required this.storage,
  }) : super(null);

  Future<FindPwModelBase> sendCode({
    required String account,
    required String email,
  }) async {
    try {
      if (account.isEmpty) {
        throw FindPwModelError(
          message: '아이디가 형식에 맞지 않습니다.',
          code: 'EML-F200',
          type: FindPwModelType.sendCode,
        );
      }
      if (email.isEmpty) {
        throw FindPwModelError(
          message: '이메일이 형식에 맞지 않습니다.',
          code: 'EML-F100',
          type: FindPwModelType.sendCode,
        );
      }
      state = FindPwModelLoading();
      final response =
          await authRepository.sendCode(account: account, email: email);
      final accessToken = response.data;

      if (accessToken == null) {
        throw FindPwModelError(
          message: '액세스토큰이 존재하지 않습니다.',
          code: "EML-F300",
          type: FindPwModelType.sendCode,
        );
      }

      await storage.write(key: accessTokenKey, value: accessToken);

      state = response;
    } on FindPwModelError catch (e) {
      state = e;
    } catch (e) {
      state = FindPwModelError(
          message: '예외발생 - $e', type: FindPwModelType.sendCode);
    }

    return Future.value(state);
  }

  void initState() {
    state = null;
  }

  Future<FindPwModelBase> verifyCode({
    required String code,
    required String? uuid,
  }) async {
    try {
      if (code.isEmpty) {
        throw FindPwModelError(
          message: '인증코드가 형식에 맞지 않습니다.',
          code: 'VC-F100',
          type: FindPwModelType.verifyCode,
        );
      }
      if (uuid == null) {
        throw FindPwModelError(
          message: 'uuid가 존재하지 않습니다.',
          code: 'VC-F200',
          type: FindPwModelType.verifyCode,
        );
      }
      state = FindPwModelLoading();
      final response = await authRepository.verifyCode(
        code: code,
        uuid: uuid,
      );
      state = response;
    } on FindPwModelError catch (e) {
      state = e;
    } catch (e) {
      state = FindPwModelError(
        message: '예외발생 - $e',
        type: FindPwModelType.verifyCode,
      );
    }

    return Future.value(state);
  }
}
