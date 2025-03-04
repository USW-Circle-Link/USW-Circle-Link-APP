import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/models/request/sign_up_request.dart';
import 'package:usw_circle_link/models/sign_up_model.dart';
import 'package:usw_circle_link/repositories/auth_repository.dart';
import 'package:usw_circle_link/utils/error_util.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';
import 'package:usw_circle_link/utils/regex/regex.dart';
import 'package:usw_circle_link/viewmodels/state/sign_up_state.dart';

final signUpViewModelProvider =
    AutoDisposeNotifierProvider<SignUpViewModel, SignUpState>(
        SignUpViewModel.new);

class SignUpViewModel extends AutoDisposeNotifier<SignUpState> {
  @override
  SignUpState build() {
    return SignUpState();
  }

  Future<void> verifyId() async {
    try {
      state = state.copyWith(
        isLoading: true,
        idVerified: false,
        error: null,
        isDialogError: false,
        errorField: null,
        needToRedirectLogin: false,
        needToRedirectSignUpOption: false,
      );

      final id = state.signUpForm['id'];

      if (id.isEmpty || !idRegExp.hasMatch(id)) {
        state = state.copyWith(
          isLoading: false,
          error: '아이디는 5~20자 이내 영어, 숫자만 가능합니다!',
          errorField: FieldType.account,
        );
        return;
      }

      final response = await ref.read(authRepositoryProvider).verifyId(id: id);

      state = state.copyWith(
        isLoading: false,
        idVerified: response,
      );
    } on SignUpModelError catch (e) {
      state = state.copyWith(
        isLoading: false,
        error:
            ErrorUtil.instance.getErrorMessage(e.code) ?? '아이디 중복 확인에 실패했습니다.',
        errorField: FieldType.account,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: '아이디 중복 확인에 실패했습니다.',
        errorField: FieldType.account,
      );
    }
  }

  Future<void> verifyEmail() async {
    try {
      state = state.copyWith(
        isLoading: true,
        emailVerified: false,
        error: null,
        isDialogError: false,
        errorField: null,
        needToRedirectLogin: false,
        needToRedirectSignUpOption: false,
      );

      final email = state.signUpForm['email'];

      if (email.isEmpty) {
        state = state.copyWith(
          isLoading: false,
          error: '이메일을 입력해주세요.',
          errorField: FieldType.email,
        );
        return;
      }

      final response =
          await ref.read(authRepositoryProvider).verifyEmail(email: email);

      state = state.copyWith(
        isLoading: false,
        emailVerified: response,
      );
    } on SignUpModelError catch (e) {
      state = state.copyWith(
        isLoading: false,
        error:
            ErrorUtil.instance.getErrorMessage(e.code) ?? '이메일 중복 확인에 실패했습니다.',
        errorField: FieldType.email,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: '이메일 중복 확인에 실패했습니다.',
        errorField: FieldType.email,
      );
    }
  }

  Future<void> signUpNewMember() async {
    try {
      state = state.copyWith(
        isLoading: true,
        signUpSuccess: false,
        error: null,
        isDialogError: false,
        errorField: null,
        needToRedirectLogin: false,
        needToRedirectSignUpOption: false,
        emailVerified: true, // 산규 회원은 이메일 검증 이미 완료
      );

      logger.d(state.signUpForm);

      final password = state.signUpForm['password'];
      final confirmPassword = state.signUpForm['confirmPassword'];
      final userName = state.signUpForm['userName'];
      final telephone = state.signUpForm['telephone'];
      final studentNumber = state.signUpForm['studentNumber'];
      final major = state.signUpForm['major'];
      final email = state.signUpForm['email'];

      final invalidField = validateField(
        password: password,
        confirmPassword: confirmPassword,
        userName: userName,
        telephone: telephone,
        studentNumber: studentNumber,
        major: major,
        email: email,
      );

      if (invalidField != null) {
        state = state.copyWith(
          isLoading: false,
          error: switch (invalidField) {
            FieldType.account => '아이디 중복 확인을 진행해주세요!',
            FieldType.password =>
              '비밀번호는 영어, 숫자, 특수문자를 모두 포함하여\n8~20자 이내로 작성해주세요.',
            FieldType.passwordConfirm => '비밀번호가 일치하지 않습니다!',
            FieldType.username => '이름은 특수문자 제외 2~30자 이내로 입력해주세요.',
            FieldType.telephone => '전화번호 형식에 맞지 않습니다!',
            FieldType.studentNumber => '학번은 숫자 8자로 입력해주세요.',
            FieldType.major => '단과대/학부(학과)를 선택해주세요.',
            // 사용되지 않는 필드 혹은 이미 검증된 필드
            FieldType.email => null,
            FieldType.currentPassword => null,
            FieldType.code => null,
          },
          errorField: invalidField,
        );
        return;
      }

      final response = await ref.read(authRepositoryProvider).signUpNewMember(
            request: SignUpRequest.fromJson(state.signUpForm),
          );
      state = state.copyWith(
        isLoading: false,
        signUpSuccess: response,
      );
    } on SignUpModelError catch (e) {
      final isDialogError = ErrorUtil.instance.isDialogError(e.code);
      final errorField = ErrorUtil.instance.getFieldType(e.code);
      final errorMessage = ErrorUtil.instance.getErrorMessage(e.code);
      if (errorField == FieldType.account) {
        state = state.copyWith(idVerified: false);
      }
      state = state.copyWith(
        isLoading: false,
        isDialogError: isDialogError || errorField == null,
        error: errorMessage ?? '회원 가입 중 문제가 발생했어요.\n잠시 후 다시 시도해주세요.',
        errorField: errorField,
        needToRedirectSignUpOption:
            ErrorUtil.instance.isNeedToRedirectSignUpOption(e.code),
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        isDialogError: true,
        error: '회원 가입 중 문제가 발생했어요.\n잠시 후 다시 시도해주세요.',
      );
    }
  }

  Future<void> signUpExistingMember() async {
    try {
      state = state.copyWith(
        isLoading: true,
        signUpSuccess: false,
        error: null,
        isDialogError: false,
        errorField: null,
        needToRedirectLogin: false,
        needToRedirectSignUpOption: false,
      );

      logger.d(state.signUpForm);

      final password = state.signUpForm['password'];
      final confirmPassword = state.signUpForm['confirmPassword'];
      final userName = state.signUpForm['userName'];
      final telephone = state.signUpForm['telephone'];
      final studentNumber = state.signUpForm['studentNumber'];
      final major = state.signUpForm['major'];
      final email = state.signUpForm['email'];

      final invalidField = validateField(
        password: password,
        confirmPassword: confirmPassword,
        userName: userName,
        telephone: telephone,
        studentNumber: studentNumber,
        major: major,
        email: email,
      );

      if (invalidField != null) {
        state = state.copyWith(
          isLoading: false,
          error: switch (invalidField) {
            FieldType.account => '아이디 중복 확인을 진행해주세요!',
            FieldType.password =>
              '비밀번호는 영어, 숫자, 특수문자를 모두 포함하여\n8~20자 이내로 작성해주세요.',
            FieldType.passwordConfirm => '비밀번호가 일치하지 않습니다!',
            FieldType.username => '이름은 특수문자 제외 2~30자 이내로 입력해주세요.',
            FieldType.telephone => '전화번호 형식에 맞지 않습니다!',
            FieldType.studentNumber => '학번은 숫자 8자로 입력해주세요.',
            FieldType.major => '단과대/학부(학과)를 선택해주세요.',
            FieldType.email => '이메일 중복 확인을 진행해주세요.',
            // 사용되지 않는 필드 혹은 이미 검증된 필드
            FieldType.currentPassword => null,
            FieldType.code => null,
          },
          errorField: invalidField,
        );
        return;
      }

      final response =
          await ref.read(authRepositoryProvider).signUpExistingMember(
                request: SignUpRequest.fromJson(state.signUpForm),
              );
      state = state.copyWith(
        isLoading: false,
        signUpSuccess: response,
      );
    } on SignUpModelError catch (e) {
      final isDialogError = ErrorUtil.instance.isDialogError(e.code);
      final errorField = ErrorUtil.instance.getFieldType(e.code);
      final errorMessage = ErrorUtil.instance.getErrorMessage(e.code);
      if (errorField == FieldType.account) {
        state = state.copyWith(idVerified: false);
      }
      state = state.copyWith(
        isLoading: false,
        isDialogError: isDialogError || errorField == null,
        error: errorMessage ?? '회원 가입 중 문제가 발생했어요.\n잠시 후 다시 시도해주세요.',
        errorField: errorField,
        needToRedirectLogin: ErrorUtil.instance.isNeedToRedirectLogin(e.code),
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        isDialogError: true,
        error: '회원 가입 중 문제가 발생했어요.\n잠시 후 다시 시도해주세요.',
      );
    }
  }

  void setFormData(Map<String, dynamic> formData) {
    state = state.copyWith(
      signUpForm: formData,
    );
  }

  void setIdVerified(bool isVerified) {
    state = state.copyWith(
      idVerified: isVerified,
    );
  }

  void setEmailVerified(bool isVerified) {
    state = state.copyWith(
      emailVerified: isVerified,
    );
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
    required String password,
    required String confirmPassword,
    required String userName,
    required String telephone,
    required String studentNumber,
    String? major,
    String? email,
  }) {
    if (!state.idVerified) {
      return FieldType.account;
    }

    final isPasswordValid = password.validate();
    logger.d('비밀번호 검증 결과 : $isPasswordValid');
    if (!isPasswordValid) {
      return FieldType.password;
    }
    if (password != confirmPassword) {
      return FieldType.passwordConfirm;
    }
    if (userName.isEmpty || !nameRegExp.hasMatch(userName)) {
      return FieldType.username;
    }
    if (telephone.isEmpty || !telephoneRegExp.hasMatch(telephone)) {
      return FieldType.telephone;
    }
    if (!studentNumberRegExp.hasMatch(studentNumber)) {
      return FieldType.studentNumber;
    }
    if (major == null || major.isEmpty) {
      return FieldType.major;
    }
    if (!state.emailVerified) {
      return FieldType.email;
    }

    return null;
  }
}
