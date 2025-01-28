// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:usw_circle_link/models/base_error.dart';

part 'sign_up_model.freezed.dart';
part 'sign_up_model.g.dart';

enum SignUpModelType {
  verify,
  validatePasswordMatch,
  signUpExistingMember,
  checkProfileIsExist
}

@freezed
class SignUpModel with _$SignUpModel {
  SignUpModel._();

  @JsonSerializable(explicitToJson: true)
  factory SignUpModel({
    SignUpModelType? type,
    required String message,
    String? data,
  }) = _SignUpModel;

  factory SignUpModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpModelFromJson(json);

  SignUpModel setType(SignUpModelType type) =>
      SignUpModel(message: message, data: data, type: type);
}

@freezed
class SignUpModelError extends Error with _$SignUpModelError {
  SignUpModelError._();

  factory SignUpModelError({
    SignUpModelType? type,
    String? exception,
    String? code,
    String? error,
    int? status,
    required String message,
  }) = _SignUpModelError;

  factory SignUpModelError.fromJson(Map<String, dynamic> json) =>
      _$SignUpModelErrorFromJson(json);

  SignUpModelError setType(SignUpModelType type) => SignUpModelError(
      exception: exception,
      code: code,
      error: error,
      status: status,
      message: message,
      type: type);

  @override
  StackTrace get stackTrace => StackTrace.fromString(toString());
}
