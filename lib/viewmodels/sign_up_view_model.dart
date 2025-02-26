import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/models/circle_list_model.dart';
import 'package:usw_circle_link/models/sign_up_model.dart';
import 'package:usw_circle_link/repositories/auth_repository.dart';
import 'package:usw_circle_link/utils/error_util.dart';
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

      final invalidField = validateField(
        account: account,
        password: password,
        passwordConfirm: passwordConfirm,
        username: username,
        telephone: telephone,
        studentNumber: studentNumber,
        major: major,
        email: email,
      );

      switch (invalidField) {
        case FieldType.password:
          throw SignUpModelError(
              message: '비밀번호가 형식에 맞지 않습니다!',
              code: "USR-F200",
              type: SignUpModelType.signUpExistingMember);
        case FieldType.passwordConfirm:
          throw SignUpModelError(
              message: '비밀번호가 일치하지 않습니다!',
              code: "USR-F300",
              type: SignUpModelType.signUpExistingMember);
        case FieldType.username:
          throw SignUpModelError(
              message: '이름이 형식에 맞지 않습니다!',
              code: "USR-F400",
              type: SignUpModelType.signUpExistingMember);
        case FieldType.telephone:
          throw SignUpModelError(
              message: '전화번호 형식에 맞지 않습니다!',
              code: "USR-F500",
              type: SignUpModelType.signUpExistingMember);
        case FieldType.studentNumber:
          throw SignUpModelError(
              message: '학번이 형식에 맞지 않습니다!',
              code: "USR-F600",
              type: SignUpModelType.signUpExistingMember);
        case FieldType.major:
          throw SignUpModelError(
              message: '학과가 형식에 맞지 않습니다!',
              code: "USR-F700",
              type: SignUpModelType.signUpExistingMember);
        case FieldType.email:
          throw SignUpModelError(
              message: '이메일이 형식에 맞지 않습니다!',
              code: "USR-F800",
              type: SignUpModelType.signUpExistingMember);
        default:
          break;
      }

      final response = await authRepository.signUpExistingMember(
        account: account,
        password: password,
        username: username,
        telephone: telephone,
        studentNumber: studentNumber,
        email: email,
        major: major,
        clubs: clubs.map((e) => {"clubUUID": e.clubUUID}).toList(),
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

      final invalidField = validateField(
        account: id,
        password: password,
        passwordConfirm: passwordConfirm,
        username: username,
        telephone: telephone,
        studentNumber: studentNumber,
        major: major,
      );

      switch (invalidField) {
        case FieldType.password:
          throw SignUpModelError(
              message: '비밀번호가 형식에 맞지 않습니다!',
              code: "USR-F200",
              type: SignUpModelType.checkProfileIsExist);
        case FieldType.passwordConfirm:
          throw SignUpModelError(
              message: '비밀번호가 일치하지 않습니다!',
              code: "USR-F300",
              type: SignUpModelType.checkProfileIsExist);
        case FieldType.username:
          throw SignUpModelError(
              message: '이름이 형식에 맞지 않습니다!',
              code: "USR-F400",
              type: SignUpModelType.checkProfileIsExist);
        case FieldType.telephone:
          throw SignUpModelError(
              message: '전화번호 형식에 맞지 않습니다!',
              code: "USR-F500",
              type: SignUpModelType.checkProfileIsExist);
        case FieldType.studentNumber:
          throw SignUpModelError(
              message: '학번이 형식에 맞지 않습니다!',
              code: "USR-F600",
              type: SignUpModelType.checkProfileIsExist);
        case FieldType.major:
          throw SignUpModelError(
              message: '학과가 형식에 맞지 않습니다!',
              code: "USR-F700",
              type: SignUpModelType.checkProfileIsExist);
        default:
          break;
      }

      final response = await authRepository.checkProfileIsExist(
        username: username,
        studentNumber: studentNumber,
        userHp: telephone,
        password: password,
        passwordConfirm: passwordConfirm,
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

  /// 회원가입 필드 검증
  /// validateField 함수는 회원가입 시 입력된 필드들을 검증하는 함수입니다.
  ///
  /// 필수 매개변수:
  /// - `account`: 사용자 계정
  /// - `password`: 사용자 비밀번호
  /// - `passwordConfirm`: 비밀번호 확인
  /// - `username`: 사용자 이름
  /// - `telephone`: 사용자 전화번호
  /// - `studentNumber`: 학번
  /// - `major`: 전공
  /// - `email`: 사용자 이메일
  ///
  /// 반환값:
  /// - `FieldType?`: 검증에 실패한 필드의 타입을 반환합니다. 모든 필드가 검증에 성공하면 `null`을 반환합니다.
  ///
  /// 검증 로직:
  /// - 비밀번호가 유효하지 않으면 `FieldType.password`를 반환합니다.
  /// - 비밀번호와 비밀번호 확인이 일치하지 않으면 `FieldType.passwordConfirm`을 반환합니다.
  /// - 이름이 비어있거나 형식에 맞지 않으면 `FieldType.username`을 반환합니다.
  /// - 전화번호가 비어있거나 형식에 맞지 않으면 `FieldType.telephone`을 반환합니다.
  /// - 학번이 형식에 맞지 않으면 `FieldType.studentNumber`을 반환합니다.
  /// - 전공이 비어있으면 `FieldType.major`를 반환합니다.
  /// - 모든 필드가 유효하면 `null`을 반환합니다.
  FieldType? validateField({
    required String account,
    required String password,
    required String passwordConfirm,
    required String username,
    required String telephone,
    required String studentNumber,
    required String major,
    String? email,
  }) {
    final isPasswordValid = password.validate();
    logger.d(isPasswordValid);
    if (!isPasswordValid) {
      return FieldType.password;
    }
    if (password != passwordConfirm) {
      return FieldType.passwordConfirm;
    }
    if (username.isEmpty || !nameRegExp.hasMatch(username)) {
      return FieldType.username;
    }

    if (telephone.isEmpty || !telephoneRegExp.hasMatch(telephone)) {
      return FieldType.telephone;
    }

    if (!studentNumberRegExp.hasMatch(studentNumber)) {
      return FieldType.studentNumber;
    }

    if (major.isEmpty) {
      return FieldType.major;
    }

    if (email != null && email.isEmpty) {
      return FieldType.email;
    }

    return null;
  }
}
