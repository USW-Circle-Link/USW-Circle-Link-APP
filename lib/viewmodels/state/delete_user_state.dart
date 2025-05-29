import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_user_state.freezed.dart';

@freezed
class DeleteUserState with _$DeleteUserState {
  factory DeleteUserState({
    @Default(false) bool isLoading,
    @Default(false) bool isSendCodeSuccess,
    @Default(false) bool isVerifyCodeSuccess,
    @Default('') String code,
    @Default('') String email,
    String? error,
    @Default(false) bool isCodeError,
  }) = _DeleteUserState;
}
