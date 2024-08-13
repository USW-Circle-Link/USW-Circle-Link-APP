import 'package:freezed_annotation/freezed_annotation.dart';

part 'FindPWModel.freezed.dart';
part 'FindPWModel.g.dart';

enum FindPWModelType {sendCode, verifyCode}

abstract class FindPWModelBase {}

@freezed
class FindPWModel extends FindPWModelBase with _$FindPWModel {

  FindPWModel._();

  factory FindPWModel({
    required String message,
   String? data,
    FindPWModelType? type,
  }) = _FindPWModel;

  factory FindPWModel.fromJson(Map<String, dynamic> json) => _$FindPWModelFromJson(json);

  FindPWModel setType(FindPWModelType _type) => FindPWModel(message: message, data: data, type: _type);
}

@freezed
class FindPWModelError extends FindPWModelBase with _$FindPWModelError implements Exception {

  FindPWModelError._();

  factory FindPWModelError({
    String? exception,
    String? code,
    required String message,
    String? error,
    int? status,
    FindPWModelType? type,
  }) = _FindPWModelError;

  factory FindPWModelError.fromJson(Map<String, dynamic> json) => _$FindPWModelErrorFromJson(json);

  FindPWModelError setType(FindPWModelType _type) => FindPWModelError(message: message, exception: exception, code: code, error: error, status: status, type: _type);
}

class FindPWModelLoading extends FindPWModelBase {}