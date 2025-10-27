import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../models/response/global_exception.dart';
import '../repositories/auth_repository.dart';
import '../secure_storage/secure_storage.dart';
import '../utils/error_util.dart';
import '../utils/regex/Regex.dart';
import '../utils/result.dart';
import '../repositories/token_repository.dart';
import 'state/find_pw_state.dart';

final findPwViewModelProvider =
    StateNotifierProvider.autoDispose<FindPwViewModel, FindPwState>((ref) {
  final AuthRepository authRepository = ref.read(authRepositoryProvider);
  final FlutterSecureStorage storage = ref.read(secureStorageProvider);
  final TokenRepository tokenRepository = ref.read(tokenRepositoryProvider);
  return FindPwViewModel(
    authRepository: authRepository,
    storage: storage,
    tokenRepository: tokenRepository,
  );
});

class FindPwViewModel extends StateNotifier<FindPwState> {
  final AuthRepository authRepository;
  final FlutterSecureStorage storage;
  final TokenRepository tokenRepository;
  FindPwViewModel({
    required this.authRepository,
    required this.storage,
    required this.tokenRepository,
  }) : super(FindPwState());

  Future<void> sendCode({
    required String account,
    required String email,
  }) async {
    state = state.copyWith(
      isLoading: true,
      isSendCodeSuccess: null,
      isVerifyCodeSuccess: null,
      error: null,
      isCodeError: null,
    );

    if (account.isEmpty ||
        !idRegExp.hasMatch(account) ||
        email.isEmpty ||
        !emailVerificationUrlRegExp.hasMatch(email)) {
      state = state.copyWith(
        isLoading: false,
        error: ErrorUtil.instance.getErrorMessage('EML-F100') ??
            '올바른 정보를 입력해 주세요.',
      );
      return;
    }

    final result =
        await authRepository.sendCode(account: account, email: email);

    switch (result) {
      case Ok():
        final findPwModel = result.value;
        final accessToken = findPwModel.data;

        if (accessToken == null) {
          state = state.copyWith(
            error: ErrorUtil.instance.getErrorMessage('EML-F300') ??
                '액세스토큰이 존재하지 않습니다.',
          );
          return;
        }

        final tokenResult = await tokenRepository.saveTokens(
            accessToken: accessToken, refreshToken: '');
        switch (tokenResult) {
          case Ok():
            state = state.copyWith(
              isLoading: false,
              isSendCodeSuccess: true,
              uuid: findPwModel.data,
            );
            break;
          case Error():
            var exception = tokenResult.error;
            print(exception);
            if (exception is GlobalException) {
              state = state.copyWith(
                isLoading: false,
                error: ErrorUtil.instance.getErrorMessage(exception.code) ??
                    '액세스토큰 저장 실패',
              );
              return;
            }
            exception = exception.toGlobalException();
            ErrorUtil.instance.logError(exception, screen: 'FindPw');
            state = state.copyWith(
              isLoading: false,
              error: exception.message,
            );
            return;
        }

      case Error():
        var exception = result.error;
        if (exception is GlobalException) {
          state = state.copyWith(
            isLoading: false,
            error: ErrorUtil.instance.getErrorMessage(exception.code) ??
                '인증 코드 전송 실패',
          );
          return;
        }
        exception = exception.toGlobalException();
        ErrorUtil.instance.logError(exception, screen: 'FindPw');
        state = state.copyWith(
          isLoading: false,
          error: exception.message,
        );
        return;
    }
  }

  void initState() {
    state = state.copyWith(
      isLoading: false,
      isSendCodeSuccess: null,
      isVerifyCodeSuccess: null,
      error: null,
      isCodeError: null,
    );
  }

  Future<void> verifyCode({
    required String code,
    required String? uuid,
  }) async {
    state = state.copyWith(
      isLoading: true,
      isVerifyCodeSuccess: null,
      error: null,
      isCodeError: null,
    );
    if (code.isEmpty) {
      state = state.copyWith(
        isLoading: false,
        error: ErrorUtil.instance.getErrorMessage('VC-F100') ??
            '인증코드가 형식에 맞지 않습니다.',
        isCodeError: true,
      );
      return;
    }
    if (uuid == null) {
      state = state.copyWith(
        isLoading: false,
        error:
            ErrorUtil.instance.getErrorMessage('VC-F200') ?? 'uuid가 존재하지 않습니다.',
        isCodeError: true,
      );
      return;
    }
    final result = await authRepository.verifyCode(
      code: code,
      uuid: uuid,
    );

    switch (result) {
      case Ok():
        state = state.copyWith(
          isLoading: false,
          isVerifyCodeSuccess: true,
        );
      case Error():
        var exception = result.error;
        if (exception is GlobalException) {
          state = state.copyWith(
            isLoading: false,
            error: ErrorUtil.instance.getErrorMessage(exception.code) ??
                '인증 코드 검증 실패',
            isCodeError: true,
          );
          return;
        }
        exception = exception.toGlobalException();
        ErrorUtil.instance.logError(exception, screen: 'FindPw');
        state = state.copyWith(
          isLoading: false,
          error: ErrorUtil.instance.getErrorMessage(exception.code) ??
              '인증 코드 검증 실패',
          isCodeError: true,
        );
        return;
    }
  }
}
