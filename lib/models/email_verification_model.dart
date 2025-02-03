// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_verification_model.freezed.dart';
part 'email_verification_model.g.dart';

enum EmailVerificationModelType { sendMail, completeSignUp }

@freezed
class EmailVerificationModel with _$EmailVerificationModel {
  EmailVerificationModel._();

  @JsonSerializable(explicitToJson: true)
  factory EmailVerificationModel({
    required String message,
    required dynamic data,
    EmailVerificationModelType? type,
  }) = _EmailVerificationModel;

  factory EmailVerificationModel.fromJson(Map<String, dynamic> json) =>
      _$EmailVerificationModelFromJson(json);

  EmailVerificationModel setType(EmailVerificationModelType type) =>
      EmailVerificationModel(
        message: message,
        data: data,
        type: type,
      );
}

@freezed
class EmailVerificationData with _$EmailVerificationData {
  factory EmailVerificationData({
    required String account,
    required String emailToken_uuid,
  }) = _EmailVerificationData;

  factory EmailVerificationData.fromJson(Map<String, dynamic> json) =>
      _$EmailVerificationDataFromJson(json);
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
    EmailVerificationModelType? type,
  }) = _EmailVerificationModelError;

  factory EmailVerificationModelError.fromJson(Map<String, dynamic> json) =>
      _$EmailVerificationModelErrorFromJson(json);

  EmailVerificationModelError setType(EmailVerificationModelType type) =>
      EmailVerificationModelError(
        message: message,
        exception: exception,
        code: code,
        error: error,
        status: status,
        type: type,
      );

  @override
  StackTrace get stackTrace => StackTrace.fromString(toString());
}
