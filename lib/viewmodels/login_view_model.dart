import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/response/global_exception.dart';
import '../utils/error_util.dart';
import '../utils/logger/logger.dart';
import '../utils/regex/Regex.dart';
import '../viewmodels/state/login_state.dart';
import '../viewmodels/user_view_model.dart';

import '../utils/result.dart';

final loginViewModelProvider =
    StateNotifierProvider.autoDispose<LoginViewModel, LoginState>((ref) {
  final userViewModel = ref.watch(userViewModelProvider.notifier);

  return LoginViewModel(
    userViewModel: userViewModel,
  );
});

class LoginViewModel extends StateNotifier<LoginState> {
  final UserViewModel userViewModel;
  LoginViewModel({
    required this.userViewModel,
  }) : super(LoginState()); // Login Page 에 들어왔다는 것은 User 정보가 없다는 얘기

  Future<void> login({
    required String id,
    required String password,
  }) async {
    // 첫 state는 Loading 상태
    state = state.copyWith(
      isLoading: true,
      isLoginSuccess: false,
      isLoginError: false,
      error: '',
    );

    if ((id.isEmpty || !idRegExp.hasMatch(id)) ||
        (password.isEmpty || !password.validate())) {
      final exception =
          GlobalException(message: '아이디 비밀번호가 입력되지 않았습니다', code: "USR-F800");
      state = state.copyWith(
        isLoading: false,
        isLoginError: true,
        error: ErrorUtil.instance.getErrorMessage(exception.code) ??
            '로그인 중 문제가 발생했습니다. 잠시 후 다시 시도해주세요.',
      );
      return;
    }

    await userViewModel.login.execute(id, password);

    final result = userViewModel.login.result;
    switch (result) {
      case Ok():
        logger.d('LoginViewModel - 로그인 완료');

        state = state.copyWith(
          isLoading: false,
          isLoginSuccess: true,
        );
        break;
      case Error():
        final exception = result.error.toGlobalException(screen: 'Login');
        state = state.copyWith(
          isLoading: false,
          isLoginError: true,
          error: ErrorUtil.instance.getErrorMessage(exception.code) ??
              '로그인에 실패했어요.',
        );
        break;
      default:
    }
  }
}
