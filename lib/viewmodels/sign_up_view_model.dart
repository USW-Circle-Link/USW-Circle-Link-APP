import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/models/sign_up_model.dart';
import 'package:usw_circle_link/repositories/auth_repository.dart';
import 'package:usw_circle_link/utils/logger/Logger.dart';
import 'package:usw_circle_link/utils/regex/regex.dart';

final signUpViewModelProvider =
    StateNotifierProvider.autoDispose<SignUpViewModel, SignUpModelBase?>((ref) {
  final AuthRepository authRepository = ref.read(authRepositoryProvider);
  return SignUpViewModel(authRepository: authRepository);
});

class SignUpViewModel extends StateNotifier<SignUpModelBase?> {
  final AuthRepository authRepository;

  SignUpViewModel({
    required this.authRepository,
  }) : super(null);

  Future<SignUpModelBase> verifyId({required String id}) async {
    try {
      state = SignUpModelLoading();
      if (id.isEmpty || !idRegExp.hasMatch(id)) {
        state = SignUpModelError(
            code: "USR-F100",
            message: '아이디는 5~20자 이내 숫자,문자만 가능',
            type: SignUpModelType.verify);
        throw state as SignUpModelError;
      }
      final response = await authRepository.verifyId(id: id);
      state = response;
      return response;
    } catch (e) {
      if (e is SignUpModelError) {
        state = e;
      } else {
        state = SignUpModelError(
            message: '예외발생 - $e', type: SignUpModelType.verify);
      }

      return Future.value(state);
    }
  }

  Future<SignUpModelBase> signUpTemporary({
    required String id,
    required String password,
    required String passwordConfirm,
    required String username,
    required String telephone,
    required String studentNumber,
    required String major,
  }) async {
    try {
      if (!passwordRegExp.hasMatch(password)) {
        throw SignUpModelError(
            message: '비밀번호가 형식에 맞지 않습니다!',
            code: "USR-F200",
            type: SignUpModelType.validatePasswordMatch);
      }
      if (password != passwordConfirm) {
        throw SignUpModelError(
            message: '비밀번호가 일치하지 않습니다!',
            code: "USR-F300",
            type: SignUpModelType.validatePasswordMatch);
      }
      if (username.isEmpty) {
        throw SignUpModelError(
            message: '이름이 형식에 맞지 않습니다!',
            code: "USR-F400",
            type: SignUpModelType.validatePasswordMatch);
      }

      if (telephone.isNotEmpty) {
        if (!telephoneRegExp.hasMatch(telephone)) {
          throw FormatException();
        }
        telephone = telephone.addDash();
        logger.d('전화번호 포맷팅 완료! - $telephone');
      } else {
        logger.d('전화번호 입력되지 않음');
      }

      if (!studentNumberRegExp.hasMatch(studentNumber)) {
        throw SignUpModelError(
            message: '학번이 형식에 않습니다!',
            code: "USR-F600",
            type: SignUpModelType.validatePasswordMatch);
      }

      if (major.isEmpty) {
        throw SignUpModelError(
            message: '학과가 형식에 않습니다!',
            code: "USR-F700",
            type: SignUpModelType.validatePasswordMatch);
      }

      state = SignUpModelLoading();

      final response = await authRepository.validatePasswordMatch(
        password: password,
        passwordConfirm: passwordConfirm,
      );
      state = response;
    } on SignUpModelError catch (e) {
      state = e;
    } on FormatException catch (e) {
      state = SignUpModelError(
          code: "USR-F500",
          message: '전화번호 형식 오류 - $e',
          type: SignUpModelType.validatePasswordMatch);
    } catch (e) {
      state = SignUpModelError(
          code: null,
          message: '예외발생 - $e',
          type: SignUpModelType.validatePasswordMatch);
    }
    return Future.value(state);
  }

  void initState() {
    state = null;
  }
}

extension AddDashToPhoneNumber on String {
  String addDash() {
    if (length != 11) {
      throw FormatException("전화번호가 11자리가 아닙니다.");
    }
    return '${substring(0, 3)}-${substring(3, 7)}-${substring(7)}';
  }

  String? addDashOrNull() {
    if (length != 11) {
      return null;
    }
    return '${substring(0, 3)}-${substring(3, 7)}-${substring(7)}';
  }
}
