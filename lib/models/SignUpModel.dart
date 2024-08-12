import 'package:freezed_annotation/freezed_annotation.dart';

part 'SignUpModel.freezed.dart';
part 'SignUpModel.g.dart';

abstract class SignUpModelBase {}

enum SignUpModelType {verify, validatePasswordMatch}

@freezed
class SignUpModel extends SignUpModelBase with _$SignUpModel {

  SignUpModel._();

  @JsonSerializable(explicitToJson: true)
  factory SignUpModel({
    SignUpModelType? type,
    required String message,
    SignUpData? data,
  }) = _SignUpModel;

  factory SignUpModel.fromJson(Map<String, dynamic> json) => _$SignUpModelFromJson(json);

  SignUpModel setType(SignUpModelType _type) => SignUpModel(message: message, data: data, type: _type);
}

@freezed
class SignUpData with _$SignUpData {

  factory SignUpData({
    required String emailTokenId,
    required String account,
  }) = _SignUpData;

  factory SignUpData.fromJson(Map<String, dynamic> json) => _$SignUpDataFromJson(json);
}

class SignUpModelLoading extends SignUpModelBase {}

@freezed
class SignUpModelError extends SignUpModelBase with _$SignUpModelError implements Exception {

  SignUpModelError._();

  factory SignUpModelError({
    SignUpModelType? type,
    String? exception,
    String? code,
    String? error,
    int? status,
    required String message,
  }) = _SignUpModelError;

  factory SignUpModelError.fromJson(Map<String, dynamic> json) => _$SignUpModelErrorFromJson(json);

  SignUpModelError setType(SignUpModelType _type) => SignUpModelError(exception: exception, code: code, error: error, status: status, message: message, type: _type);
}