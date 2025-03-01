import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_user_state.freezed.dart';

@freezed
class DeleteUserState with _$DeleteUserState {
  factory DeleteUserState({
    @Default(false) bool isLoading,
    @Default(false) bool isSendCodeSuccess,
    @Default(false) bool isVerifyCodeSuccess,
    @Default('') String code,
    String? error,
    @Default(false) bool isCodeError,
    @Default(false) bool isDialogError,
  }) = _DeleteUserState;
}
