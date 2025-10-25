// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'global_exception.freezed.dart';
part 'global_exception.g.dart';

@freezed
class GlobalException with _$GlobalException implements Exception {
  GlobalException._();

  factory GlobalException({
    @JsonKey(name: "exception") String? exception,
    @JsonKey(name: "code") String? code,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "status") int? status,
    @JsonKey(name: "error") String? error,
  }) = _GlobalException;

  factory GlobalException.fromJson(Map<String, dynamic> json) =>
      _$GlobalExceptionFromJson(json);

  StackTrace get stackTrace => StackTrace.fromString(toString());
}

extension GlobalExceptionExtension on Exception {
  GlobalException toGlobalException() => GlobalException(
        exception: toString(),
        code: null,
        message: toString(),
        status: null,
        error: toString(),
      );
}
