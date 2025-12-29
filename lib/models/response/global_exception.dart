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
    String? screen,
    String? errorType,
  }) = _GlobalException;

  factory GlobalException.fromJson(Map<String, dynamic> json) =>
      _$GlobalExceptionFromJson(json);

  StackTrace get stackTrace => StackTrace.fromString(toString());
}

extension GlobalExceptionExtension on Exception {
  GlobalException toGlobalException({String? screen}) {
    if (this is GlobalException) {
      return this as GlobalException;
    }
    return GlobalException(
      exception: runtimeType.toString(),
      code: null,
      message: '예외발생! - ${toString()}',
      status: null,
      error: toString(),
      screen: screen,
      errorType: runtimeType.toString(),
    );
  }
}
