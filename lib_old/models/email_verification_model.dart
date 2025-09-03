// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_verification_model.freezed.dart';
part 'email_verification_model.g.dart';

@freezed
class EmailVerificationModel with _$EmailVerificationModel {
  @JsonSerializable(explicitToJson: true)
  factory EmailVerificationModel({
    required String uuid,
  }) = _EmailVerificationModel;
}

@freezed
class EmailVerificationModelError
    with _$EmailVerificationModelError
    implements Error {
  EmailVerificationModelError._();
  factory EmailVerificationModelError({
    String? exception,
    String? code,
    String? error,
    int? status,
    required String message,
  }) = _EmailVerificationModelError;

  factory EmailVerificationModelError.fromJson(Map<String, dynamic> json) =>
      _$EmailVerificationModelErrorFromJson(json);

  @override
  StackTrace get stackTrace => StackTrace.fromString(toString());
}
