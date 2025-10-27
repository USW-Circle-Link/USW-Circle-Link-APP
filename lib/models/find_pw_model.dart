import 'package:freezed_annotation/freezed_annotation.dart';

part 'find_pw_model.freezed.dart';
part 'find_pw_model.g.dart';

enum FindPwModelType { sendCode, verifyCode }

@freezed
class FindPwModel with _$FindPwModel {
  FindPwModel._();

  factory FindPwModel({
    required String message,
    String? data,
    FindPwModelType? type,
  }) = _FindPWModel;

  factory FindPwModel.fromJson(Map<String, dynamic> json) =>
      _$FindPwModelFromJson(json);

  FindPwModel setType(FindPwModelType type) =>
      FindPwModel(message: message, data: data, type: type);
}

@freezed
class FindPwModelError with _$FindPwModelError implements Error, Exception {
  FindPwModelError._();

  factory FindPwModelError({
    String? exception,
    String? code,
    required String message,
    String? error,
    int? status,
    FindPwModelType? type,
  }) = _FindPWModelError;

  factory FindPwModelError.fromJson(Map<String, dynamic> json) =>
      _$FindPwModelErrorFromJson(json);

  FindPwModelError setType(FindPwModelType type) => FindPwModelError(
      message: message,
      exception: exception,
      code: code,
      error: error,
      status: status,
      type: type);

  @override
  StackTrace get stackTrace => StackTrace.fromString(toString());
}
