import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_user_model.freezed.dart';
part 'delete_user_model.g.dart';

abstract class DeleteUserModelBase {}

enum DeleteUserModelType { sendCode, verifyCode }

@freezed
class DeleteUserModel extends DeleteUserModelBase with _$DeleteUserModel {
  DeleteUserModel._();

  factory DeleteUserModel({
    required String message,
    DeleteUserModelType? type,
  }) = _DeleteUserModel;

  factory DeleteUserModel.fromJson(Map<String, dynamic> json) =>
      _$DeleteUserModelFromJson(json);

  DeleteUserModel setType(DeleteUserModelType type) =>
      DeleteUserModel(message: message, type: type);
}

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
    DeleteUserModelType? type,
  }) = _DeleteUserModelError;

  factory DeleteUserModelError.fromJson(Map<String, dynamic> json) =>
      _$DeleteUserModelErrorFromJson(json);

  DeleteUserModelError setType(DeleteUserModelType type) =>
      DeleteUserModelError(
        message: message,
        exception: exception,
        code: code,
        status: status,
        error: error,
        type: type,
      );

  @override
  StackTrace? get stackTrace => StackTrace.fromString(toString());
}
