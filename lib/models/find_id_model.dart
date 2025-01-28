import 'package:freezed_annotation/freezed_annotation.dart';

part 'find_id_model.freezed.dart';
part 'find_id_model.g.dart';

@freezed
class FindIdModel with _$FindIdModel {
  FindIdModel._();

  factory FindIdModel({
    required String message,
    required String data,
  }) = _FindIdModel;

  factory FindIdModel.fromJson(Map<String, dynamic> json) =>
      _$FindIdModelFromJson(json);
}

@freezed
class FindIdModelError with _$FindIdModelError implements Error {
  FindIdModelError._();

  factory FindIdModelError({
    String? exception,
    String? code,
    required String message,
    String? error,
    int? status,
  }) = _FindIdModelError;

  factory FindIdModelError.fromJson(Map<String, dynamic> json) =>
      _$FindIdModelErrorFromJson(json);

  @override
  StackTrace get stackTrace => StackTrace.fromString(toString());
}
