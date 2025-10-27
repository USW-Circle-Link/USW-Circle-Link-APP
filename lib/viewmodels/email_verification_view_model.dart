import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/models/response/global_exception.dart';
import 'package:usw_circle_link/repositories/auth_repository.dart';
import 'package:usw_circle_link/utils/error_util.dart';
import 'package:usw_circle_link/utils/regex/Regex.dart';
import 'package:usw_circle_link/utils/result.dart';
import 'package:usw_circle_link/viewmodels/state/email_verification_state.dart';

final emailVerificationViewModelProvider = AutoDisposeNotifierProvider<
    EmailVerificationViewModel,
    EmailVerificationState>(EmailVerificationViewModel.new);

class EmailVerificationViewModel
    extends AutoDisposeNotifier<EmailVerificationState> {
  @override
  EmailVerificationState build() {
    return EmailVerificationState();
  }

  Future<void> sendMail() async {
    state = state.copyWith(
      isLoading: true,
      error: null,
      isSendMailSuccess: false,
      isVerifySuccess: false,
      emailTokenUUID: '',
      signupUUID: '',
    );

    final email = state.email;

    if (email.isEmpty || !emailVerificationUrlRegExp.hasMatch(email)) {
      state = state.copyWith(
        isLoading: false,
        error: '올바른 이메일을 입력해주세요.',
      );
      return;
    }

    final result =
        await ref.read(authRepositoryProvider).sendMail(email: email);

    switch (result) {
      case Ok():
        final sendMailResponse = result.value;
        state = state.copyWith(
          isLoading: false,
          isSendMailSuccess: true,
          emailTokenUUID: sendMailResponse.data.emailTokenUUID,
          email: sendMailResponse.data.email,
        );
      case Error():
        state = state.copyWith(
          isLoading: false,
          error: ErrorUtil.instance
                  .getErrorMessage((result.error as GlobalException).code) ??
              '인증 메일을 보내는 데 실패했습니다. 잠시 후 다시 시도해주세요.',
        );
    }
  }

  Future<void> verifyEmailVerification() async {
    state = state.copyWith(
      isLoading: true,
      error: null,
      isVerifySuccess: false,
    );

    final email = state.email;

    final result = await ref
        .read(authRepositoryProvider)
        .verifyEmailVerification(email: email); // true or error

    switch (result) {
      case Ok():
        final emailVerificationResponse = result.value;
        state = state.copyWith(
          isLoading: false,
          error: null,
          isVerifySuccess: true,
          signupUUID: emailVerificationResponse.data.signupUuid,
        );
      case Error():
        state = state.copyWith(
          isLoading: false,
          error: ErrorUtil.instance
                  .getErrorMessage((result.error as GlobalException).code) ??
              '인증에 실패하였습니다. 다시 시도해주세요.',
          isVerifySuccess: false,
        );
    }
  }

  void initState() {
    state = state.copyWith(
      isLoading: false,
      error: null,
      isSendMailSuccess: false,
      isVerifySuccess: false,
    );
  }

  void setEmail(String email) {
    state = state.copyWith(
      email: email,
      error: null,
      isSendMailSuccess: false,
      isVerifySuccess: false,
    );
  }
}
