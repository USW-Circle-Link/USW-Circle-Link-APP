import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:usw_circle_link/utils/error_util.dart';

part 'sign_up_state.freezed.dart';

@freezed
class SignUpState with _$SignUpState {
  factory SignUpState({
    @Default(false) bool isLoading,
    @Default(false) bool idVerified,
    @Default(false) bool emailVerified,
    @Default(false) bool signUpSuccess,
    @Default({}) Map<String, dynamic> signUpForm,
    String? error,
    @Default(false) bool isDialogError,
    @Default(false) bool needToRedirectLogin,
    @Default(false) bool needToRedirectSignUpOption,
    FieldType? errorField,
  }) = _SignUpState;
}
