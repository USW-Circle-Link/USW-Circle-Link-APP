import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_user_model.freezed.dart';
part 'delete_user_model.g.dart';

abstract class DeleteUserModelBase {}

@freezed
class DeleteUserModelError extends DeleteUserModelBase
    with _$DeleteUserModelError
    implements Error {
  DeleteUserModelError._();

  factory DeleteUserModelError({
    required String message,
    String? exception,
    String? code,
    int? status,
    String? error,
  }) = _DeleteUserModelError;

  factory DeleteUserModelError.fromJson(Map<String, dynamic> json) =>
      _$DeleteUserModelErrorFromJson(json);

  @override
  StackTrace? get stackTrace => StackTrace.fromString(toString());
}
