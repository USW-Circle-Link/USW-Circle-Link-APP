import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/models/EmailVerificationModel.dart';
import 'package:usw_circle_link/repositories/AuthRepository.dart';

final emailVerificationViewModelProvider = StateNotifierProvider<
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
            message: '이메일이 형식에 맞지 않습니다.', code: 'EML-F100', type: EmailVerificationModelType.sendMail);
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
      state = EmailVerificationModelError(message: '예외발생 - $e');
    }
    return Future.value(state);
  }

  Future<EmailVerificationModelBase?> resendMail({
    required String emailTokenId,
  }) async {
    try {
      state = EmailVerificationModelLoading();
      final response =
          await authRepository.resendMail(emailTokenId: emailTokenId);
      state = response;
    } on EmailVerificationModelError catch (e) {
      state = e;
    } catch (e) {
      state = EmailVerificationModelError(message: '예외발생 - $e');
    }
    return Future.value(state);
  }

  Future<EmailVerificationModelBase?> signUp({
    required String emailTokenId,
  }) async {
    try {
      state = EmailVerificationModelLoading();
      final response =
          await authRepository.signUp(emailTokenId: emailTokenId);
      state = response;
    } on EmailVerificationModelError catch (e) {
      state = e;
    } catch (e) {
      state = EmailVerificationModelError(message: '예외발생 - $e');
    }
    return Future.value(state);
  }
}
