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
        errorField: null,
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

  Future<void> signUpNewMember() async {
    try {
      state = state.copyWith(
        isLoading: true,
        error: null,
        errorField: null,
        signUpSuccess: false,
      );

      logger.d(state.signUpForm);

      final response = await ref.read(authRepositoryProvider).signUpNewMember(
            request: SignUpRequest.fromJson(state.signUpForm),
          );
      state = state.copyWith(
        isLoading: false,
        signUpSuccess: response,
      );
    } catch (e) {
      logger.d(e);
      state = state.copyWith(
        isLoading: false,
        error: '회원가입에 실패했습니다.',
      );
    }
  }

  Future<void> signUpExistingMember() async {
    try {
      state = state.copyWith(
        isLoading: true,
        error: null,
        errorField: null,
        signUpSuccess: false,
      );

      logger.d(state.signUpForm);

      final account = state.signUpForm['account'];
      final password = state.signUpForm['password'];
      final confirmPassword = state.signUpForm['confirmPassword'];
      final userName = state.signUpForm['userName'];
      final telephone = state.signUpForm['telephone'];
      final studentNumber = state.signUpForm['studentNumber'];
      final major = state.signUpForm['major'];
      final email = state.signUpForm['email'];

      final invalidField = validateField(
        account: account,
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
            FieldType.password => '비밀번호가 형식에 맞지 않습니다!',
            FieldType.passwordConfirm => '비밀번호가 일치하지 않습니다!',
            FieldType.username => '이름이 형식에 맞지 않습니다!',
            FieldType.telephone => '전화번호 형식에 맞지 않습니다!',
            FieldType.studentNumber => '학번이 형식에 맞지 않습니다!',
            FieldType.major => '학과가 형식에 맞지 않습니다!',
            FieldType.email => '이메일이 형식에 맞지 않습니다!',
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
      state = state.copyWith(
        isLoading: false,
        error: ErrorUtil.instance.getErrorMessage(e.code) ?? '회원가입에 실패했습니다.',
      );
    } catch (e) {
      logger.d(e);
      state = state.copyWith(
        isLoading: false,
        error: '회원가입에 실패했습니다.',
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

    if (email != null && email.isEmpty) {
      return FieldType.email;
    }

    return null;
  }
}
