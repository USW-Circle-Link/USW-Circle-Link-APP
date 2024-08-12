import 'package:freezed_annotation/freezed_annotation.dart';

part 'FindIdModel.freezed.dart';
part 'FindIdModel.g.dart';

enum FindIdModelType {findId, resendMail}

abstract class FindIdModelBase {}

@freezed
class FindIdModel extends FindIdModelBase with _$FindIdModel {

  FindIdModel._();

  factory FindIdModel({
    required String message,
    required String data,
    FindIdModelType? type,
  }) = _FindIdModel;

  factory FindIdModel.fromJson(Map<String, dynamic> json) => _$FindIdModelFromJson(json);

  FindIdModel setType(FindIdModelType _type) => FindIdModel(message: message, data: data, type: _type);
}

@freezed
class FindIdModelError extends FindIdModelBase with _$FindIdModelError implements Exception {

  FindIdModelError._();

  factory FindIdModelError({
    String? exception,
    String? code,
    required String message,
    String? error,
    int? status,
    FindIdModelType? type,
  }) = _FindIdModelError;

  factory FindIdModelError.fromJson(Map<String, dynamic> json) => _$FindIdModelErrorFromJson(json);

  FindIdModelError setType(FindIdModelType _type) => FindIdModelError(message: message, exception: exception, code: code, error: error, status: status, type: _type);
}

class FindIdModelLoading extends FindIdModelBase {}