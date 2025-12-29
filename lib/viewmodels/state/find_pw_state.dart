import 'package:freezed_annotation/freezed_annotation.dart';

part 'find_pw_state.freezed.dart';

@freezed
class FindPwState with _$FindPwState {
  factory FindPwState({
    @Default(false) bool isLoading,
    bool? isSendCodeSuccess,
    bool? isVerifyCodeSuccess,
    String? error,
    bool? isCodeError,
    String? uuid,
  }) = _FindPwState;
}
