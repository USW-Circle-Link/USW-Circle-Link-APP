import 'package:freezed_annotation/freezed_annotation.dart';

part 'FindIdModel.freezed.dart';
part 'FindIdModel.g.dart';

abstract class FindIdModelBase {}

@freezed
class FindIdModel extends FindIdModelBase with _$FindIdModel {

  FindIdModel._();

  factory FindIdModel({
    required String message,
    required String data,
  }) = _FindIdModel;

  factory FindIdModel.fromJson(Map<String, dynamic> json) => _$FindIdModelFromJson(json);
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
  }) = _FindIdModelError;

  factory FindIdModelError.fromJson(Map<String, dynamic> json) => _$FindIdModelErrorFromJson(json);
}

class FindIdModelLoading extends FindIdModelBase {}