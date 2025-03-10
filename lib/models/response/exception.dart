import 'package:freezed_annotation/freezed_annotation.dart';

part 'exception.freezed.dart';
part 'exception.g.dart';

@freezed
class Exception with _$Exception {
  const factory Exception({
    @JsonKey(name: "exception") String? exception,
    @JsonKey(name: "code") String? code,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "status") int? status,
    @JsonKey(name: "error") String? error,
  }) = _Exception;

  factory Exception.fromJson(Map<String, dynamic> json) =>
      _$ExceptionFromJson(json);
}
