import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/models/circle_list_model.dart';
import 'package:usw_circle_link/models/sign_up_model.dart';
import 'package:usw_circle_link/repositories/auth_repository.dart';
import 'package:usw_circle_link/utils/logger/Logger.dart';
import 'package:usw_circle_link/utils/regex/regex.dart';

final signUpViewModelProvider = StateNotifierProvider.autoDispose<
    SignUpViewModel, AsyncValue<SignUpModel?>>((ref) {
  final AuthRepository authRepository = ref.read(authRepositoryProvider);
  return SignUpViewModel(authRepository: authRepository);
});

class SignUpViewModel extends StateNotifier<AsyncValue<SignUpModel?>> {
  final AuthRepository authRepository;

  SignUpViewModel({
    required this.authRepository,
  }) : super(AsyncData(null));

  Future<void> verifyId({required String id}) async {
    try {
      state = AsyncLoading();
      if (id.isEmpty || !idRegExp.hasMatch(id)) {
        final error = SignUpModelError(
            message: '아이디가 형식에 맞지 않습니다.',
            code: 'USR-F100',
            type: SignUpModelType.verify);
        state = AsyncError(error, error.stackTrace);
        throw error;
      }
      final response = await authRepository.verifyId(id: id);
      state = AsyncData(response);
    } on SignUpModelError catch (e) {
      state = AsyncError(e, e.stackTrace);
    } catch (e) {
      final error =
          SignUpModelError(message: '예외발생 - $e', type: SignUpModelType.verify);
      state = AsyncError(error, error.stackTrace);
    }
  }

  Future<void> signUpExistingMember({
    required String account,
    required String password,
    required String passwordConfirm,
    required String username,
    required String telephone,
    required String studentNumber,
    required String major,
    required String email,
    required List<CircleListData> clubs,
  }) async {
    try {
      state = AsyncLoading();
      logger.d(password.validate());
      if (!password.validate()) {
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
          throw SignUpModelError(
              code: "USR-F500",
              message: '전화번호 형식에 맞지 않습니다!',
              type: SignUpModelType.validatePasswordMatch);
        }
      } else {
        logger.d('전화번호 입력되지 않음');
      }

      if (!studentNumberRegExp.hasMatch(studentNumber)) {
        throw SignUpModelError(
            message: '학번이 형식에 맞지 않습니다!',
            code: "USR-F600",
            type: SignUpModelType.validatePasswordMatch);
      }

      if (major.isEmpty) {
        throw SignUpModelError(
            message: '학과가 형식에 맞지 않습니다!',
            code: "USR-F700",
            type: SignUpModelType.validatePasswordMatch);
      }

      final response = await authRepository.signUpExistingMember(
        account: account,
        password: password,
        username: username,
        telephone: telephone,
        studentNumber: studentNumber,
        email: email,
        major: major,
        clubs: clubs.map((e) => {"clubId": e.clubId}).toList(),
      );
      state = AsyncData(response);
    } on SignUpModelError catch (e) {
      state = AsyncError(e, e.stackTrace);
    } catch (e) {
      final error = SignUpModelError(
          message: '예외발생 - $e', type: SignUpModelType.signUpExistingMember);
      state = AsyncError(error, error.stackTrace);
    }
  }

  Future<void> signUpTemporary({
    required String id,
    required String password,
    required String passwordConfirm,
    required String username,
    required String telephone,
    required String studentNumber,
    required String major,
  }) async {
    try {
      state = AsyncLoading();
      logger.d(password.validate());
      if (!password.validate()) {
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
          throw SignUpModelError(
              code: "USR-F500",
              message: '전화번호 형식에 맞지 않습니다!',
              type: SignUpModelType.validatePasswordMatch);
        }
      } else {
        logger.d('전화번호 입력되지 않음');
      }

      if (!studentNumberRegExp.hasMatch(studentNumber)) {
        throw SignUpModelError(
            message: '학번이 형식에 맞지 않습니다!',
            code: "USR-F600",
            type: SignUpModelType.validatePasswordMatch);
      }

      if (major.isEmpty) {
        throw SignUpModelError(
            message: '학과가 형식에 맞지 않습니다!',
            code: "USR-F700",
            type: SignUpModelType.validatePasswordMatch);
      }

      final response = await authRepository.checkProfileIsExist(
        username: username,
        studentNumber: studentNumber,
        userHp: telephone,
      );
      state = AsyncData(response);
    } on SignUpModelError catch (e) {
      state = AsyncError(e, e.stackTrace);
    } catch (e) {
      final error = SignUpModelError(
          message: '예외발생 - $e', type: SignUpModelType.checkProfileIsExist);
      state = AsyncError(error, error.stackTrace);
    }
  }

  void initState() {
    state = AsyncData(null);
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
