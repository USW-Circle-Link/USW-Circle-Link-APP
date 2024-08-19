import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/models/email_verification_model.dart';
import 'package:usw_circle_link/repositories/auth_repository.dart';

final emailVerificationViewModelProvider = StateNotifierProvider.autoDispose<
    EmailVerificationViewModel, EmailVerificationModelBase?>((ref) {
  final AuthRepository authRepository = ref.read(authRepositoryProvider);
  return EmailVerificationViewModel(authRepository: authRepository);
});

class EmailVerificationViewModel
    extends StateNotifier<EmailVerificationModelBase?> {
  final AuthRepository authRepository;
  EmailVerificationViewModel({required this.authRepository}) : super(null);

  Future<EmailVerificationModelBase?> sendMail({
    required String account,
    required String password,
    required String userName,
    required String telephone,
    required String studentNumber,
    required String major,
    required String email,
  }) async {
    try {
      if (email.isEmpty) {
        throw EmailVerificationModelError(
            message: '이메일이 형식에 맞지 않습니다.',
            code: 'EML-F100',
            type: EmailVerificationModelType.sendMail);
      }
      state = EmailVerificationModelLoading();
      final response = await authRepository.sendMail(
          account: account,
          password: password,
          userName: userName,
          telephone: telephone,
          studentNumber: studentNumber,
          major: major,
          email: email);
      state = response;
    } on EmailVerificationModelError catch (e) {
      state = e;
    } catch (e) {
      state = EmailVerificationModelError(
          message: '예외발생 - $e', type: EmailVerificationModelType.sendMail);
    }
    return Future.value(state);
  }

  Future<EmailVerificationModelBase?> resendMail({
    required String emailToken_uuid,
  }) async {
    try {
      state = EmailVerificationModelLoading();
      final response =
          await authRepository.resendMail(emailTokenId: emailToken_uuid);
      state = response;
    } on EmailVerificationModelError catch (e) {
      state = e;
    } catch (e) {
      state = EmailVerificationModelError(
          message: '예외발생 - $e', type: EmailVerificationModelType.resendMail);
    }
    return Future.value(state);
  }

  Future<EmailVerificationModelBase?> signUp({
    required String account,
  }) async {
    try {
      state = EmailVerificationModelLoading();
      final response = await authRepository.signUp(account: account);
      state = response;
    } on EmailVerificationModelError catch (e) {
      state = e;
    } catch (e) {
      state = EmailVerificationModelError(
          message: '예외발생 - $e',
          type: EmailVerificationModelType.completeSignUp);
    }
    return Future.value(state);
  }

  void initState() {
    state = null;
  }
}
