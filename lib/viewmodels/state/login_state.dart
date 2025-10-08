import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  factory LoginState({
    @Default(false) bool isLoading,
    @Default(false) bool isLoginSuccess,
    @Default(false) bool isLoginError,
    @Default('') String error,
  }) = _LoginState;
}
