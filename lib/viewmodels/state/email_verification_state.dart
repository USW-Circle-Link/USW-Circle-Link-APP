import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_verification_state.freezed.dart';

@freezed
class EmailVerificationState with _$EmailVerificationState {
  factory EmailVerificationState({
    @Default(false) bool isLoading,
    @Default(false) bool isSendMailSuccess,
    @Default(false) bool isVerifySuccess,
    @Default('') String email,
    @Default('') String uuid,
    String? error,
  }) = _EmailVerificationState;
}
