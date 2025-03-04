import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/models/email_verification_model.dart';
import 'package:usw_circle_link/repositories/auth_repository.dart';
import 'package:usw_circle_link/utils/error_util.dart';
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
    try {
      state = state.copyWith(
        isLoading: true,
        error: null,
        isSendMailSuccess: false,
        isVerifySuccess: false,
        emailTokenUUID: '',
        signupUUID: '',
      );

      final email = state.email;

      if (email.isEmpty) {
        state = state.copyWith(
          isLoading: false,
          error: '이메일을 입력해주세요.',
        );
        return;
      }

      final response =
          await ref.read(authRepositoryProvider).sendMail(email: email);
      state = state.copyWith(
        isLoading: false,
        isSendMailSuccess: true,
        emailTokenUUID: response.data.emailTokenUUID,
        email: response.data.email,
      );
    } on EmailVerificationModelError catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: ErrorUtil.instance.getErrorMessage(e.code) ??
            '인증 메일을 보내는 데 실패했습니다. 잠시 후 다시 시도해주세요.',
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: "인증 메일을 보내는 데 실패했습니다. 잠시 후 다시 시도해주세요.",
      );
    }
  }

  Future<void> verifyEmailVerification() async {
    try {
      state = state.copyWith(
        isLoading: true,
        error: null,
        isVerifySuccess: false,
      );

      final email = state.email;

      final response = await ref
          .read(authRepositoryProvider)
          .verifyEmailVerification(email: email); // true or error

      state = state.copyWith(
        isLoading: false,
        error: null,
        isVerifySuccess: true,
        signupUUID: response.data.signupUuid,
      );
    } on EmailVerificationModelError catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: ErrorUtil.instance.getErrorMessage(e.code) ??
            '인증에 실패하였습니다. 다시 시도해주세요.',
        isVerifySuccess: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: "인증에 실패하였습니다. 다시 시도해주세요.",
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
