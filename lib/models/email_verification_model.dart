// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_verification_model.freezed.dart';
part 'email_verification_model.g.dart';

enum EmailVerificationModelType { sendMail, resendMail, completeSignUp }

abstract class EmailVerificationModelBase {}

@freezed
class EmailVerificationModel extends EmailVerificationModelBase
    with _$EmailVerificationModel {
  EmailVerificationModel._();

  @JsonSerializable(explicitToJson: true)
  factory EmailVerificationModel({
    required String message,
    required EmailVerificationData data,
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
class EmailVerificationModelResend extends EmailVerificationModelBase
    with _$EmailVerificationModelResend {
  EmailVerificationModelResend._();
  factory EmailVerificationModelResend({
    required String message,
    required String data,
    EmailVerificationModelType? type,
  }) = _EmailVerificationModelResend;

  factory EmailVerificationModelResend.fromJson(Map<String, dynamic> json) =>
      _$EmailVerificationModelResendFromJson(json);
  EmailVerificationModelResend setType(EmailVerificationModelType type) =>
      EmailVerificationModelResend(
        message: message,
        data: data,
        type: type,
      );
}

@freezed
class EmailVerificationModelComplete extends EmailVerificationModelBase
    with _$EmailVerificationModelComplete {
  EmailVerificationModelComplete._();
  factory EmailVerificationModelComplete({
    required String message,
    required String data,
    EmailVerificationModelType? type,
  }) = _EmailVerificationModelComplete;

  factory EmailVerificationModelComplete.fromJson(Map<String, dynamic> json) =>
      _$EmailVerificationModelCompleteFromJson(json);
  EmailVerificationModelComplete setType(EmailVerificationModelType type) =>
      EmailVerificationModelComplete(
        message: message,
        data: data,
        type: type,
      );
}

@freezed
class EmailVerificationModelError extends EmailVerificationModelBase
    with _$EmailVerificationModelError
    implements Exception {
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
}

class EmailVerificationModelLoading extends EmailVerificationModelBase {}
