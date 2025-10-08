import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:usw_circle_link/const/data.dart';
import 'package:usw_circle_link/models/find_pw_model.dart';
import 'package:usw_circle_link/repositories/auth_repository.dart';
import 'package:usw_circle_link/secure_storage/secure_storage.dart';
import 'package:usw_circle_link/utils/regex/Regex.dart';
import 'package:usw_circle_link/utils/result.dart';

final findPwViewModelProvider = StateNotifierProvider.autoDispose<
    FindPwViewModel, AsyncValue<FindPwModel?>>((ref) {
  final AuthRepository authRepository = ref.read(authRepositoryProvider);
  final FlutterSecureStorage storage = ref.read(secureStorageProvider);
  return FindPwViewModel(
    authRepository: authRepository,
    storage: storage,
  );
});

class FindPwViewModel extends StateNotifier<AsyncValue<FindPwModel?>> {
  final AuthRepository authRepository;
  final FlutterSecureStorage storage;
  FindPwViewModel({
    required this.authRepository,
    required this.storage,
  }) : super(AsyncData(null));

  Future<void> sendCode({
    required String account,
    required String email,
  }) async {
    try {
      state = AsyncLoading();

      if (account.isEmpty ||
          !idRegExp.hasMatch(account) ||
          email.isEmpty ||
          !emailVerificationUrlRegExp.hasMatch(email)) {
        throw FindPwModelError(
          message: '올바른 정보를 입력해 주세요.',
          code: 'EML-F100',
          type: FindPwModelType.sendCode,
        );
      }

      final result =
          await authRepository.sendCode(account: account, email: email);

      switch (result) {
        case Ok():
          final findPwModel = result.value;
          final accessToken = findPwModel.data;

          if (accessToken == null) {
            throw FindPwModelError(
              message: '액세스토큰이 존재하지 않습니다.',
              code: "EML-F300",
              type: FindPwModelType.sendCode,
            );
          }

          storage.write(key: accessTokenKey, value: accessToken);
          state = AsyncData(findPwModel);
        case Error():
          final error = FindPwModelError(
            message: result.error.toString(),
            type: FindPwModelType.sendCode,
          );
          state = AsyncError(error, error.stackTrace);
      }
    } on FindPwModelError catch (e, stackTrace) {
      state = AsyncError(e, stackTrace);
    } catch (e) {
      final error = FindPwModelError(
        message: '예외발생 - $e',
        type: FindPwModelType.sendCode,
      );
      state = AsyncError(error, error.stackTrace);
    }
  }

  void initState() {
    state = AsyncData(null);
  }

  Future<void> verifyCode({
    required String code,
    required String? uuid,
  }) async {
    try {
      state = AsyncLoading();
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
      final result = await authRepository.verifyCode(
        code: code,
        uuid: uuid,
      );

      switch (result) {
        case Ok():
          state = AsyncData(result.value);
        case Error():
          final error = FindPwModelError(
            message: result.error.toString(),
            type: FindPwModelType.verifyCode,
          );
          state = AsyncError(error, error.stackTrace);
      }
    } on FindPwModelError catch (e, stackTrace) {
      state = AsyncError(e, stackTrace);
    } catch (e) {
      final error = FindPwModelError(
        message: '예외발생 - $e',
        type: FindPwModelType.verifyCode,
      );
      state = AsyncError(error, error.stackTrace);
    }
  }
}
