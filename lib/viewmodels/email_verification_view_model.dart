import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/models/email_verification_model.dart';
import 'package:usw_circle_link/repositories/auth_repository.dart';

final emailVerificationViewModelProvider = StateNotifierProvider.autoDispose<
    EmailVerificationViewModel, AsyncValue<EmailVerificationModel?>>((ref) {
  final AuthRepository authRepository = ref.read(authRepositoryProvider);
  return EmailVerificationViewModel(authRepository: authRepository);
});

class EmailVerificationViewModel
    extends StateNotifier<AsyncValue<EmailVerificationModel?>> {
  final AuthRepository authRepository;
  EmailVerificationViewModel({required this.authRepository})
      : super(AsyncData(null));

  Future<void> sendMail({
    required String account,
    required String password,
    required String userName,
    required String telephone,
    required String studentNumber,
    required String major,
    required String email,
  }) async {
    try {
      state = AsyncLoading();
      if (email.isEmpty) {
        throw EmailVerificationModelError(
            message: '이메일이 형식에 맞지 않습니다.',
            code: 'EML-F100',
            type: EmailVerificationModelType.sendMail);
      }
      final response = await authRepository.sendMail(
          account: account,
          password: password,
          userName: userName,
          telephone: telephone,
          studentNumber: studentNumber,
          major: major,
          email: email);
      state = AsyncData(response);
    } on EmailVerificationModelError catch (e) {
      state = AsyncError(e, e.stackTrace);
    } catch (e) {
      final error = EmailVerificationModelError(
          message: '예외발생 - $e', type: EmailVerificationModelType.sendMail);
      state = AsyncError(error, error.stackTrace);
    }
  }

  Future<void> signUp({
    required String account,
  }) async {
    try {
      state = AsyncLoading();
      final response = await authRepository.signUp(account: account);
      state = AsyncData(response);
    } on EmailVerificationModelError catch (e) {
      state = AsyncError(e, e.stackTrace);
    } catch (e) {
      final error = EmailVerificationModelError(
          message: '예외발생 - $e',
          type: EmailVerificationModelType.completeSignUp);
      state = AsyncError(error, error.stackTrace);
    }
  }

  void initState() {
    state = AsyncData(null);
  }
}
