import 'package:freezed_annotation/freezed_annotation.dart';

part 'ChangePWModel.freezed.dart';
part 'ChangePWModel.g.dart';

enum ChangePWModelType { changePW, resetPW }

abstract class ChangePWModelBase {}

@freezed
class ChangePWModel extends ChangePWModelBase with _$ChangePWModel {
  ChangePWModel._();

  factory ChangePWModel({
    required String message,
    ChangePWModelType? type,
  }) = _ChangePWModel;

  factory ChangePWModel.fromJson(Map<String, dynamic> json) =>
      _$ChangePWModelFromJson(json);

  ChangePWModel setType(ChangePWModelType _type) => ChangePWModel(
        message: message,
        type: _type,
      );
}

@freezed
class ChangePWModelError extends ChangePWModelBase
    with _$ChangePWModelError
    implements Exception {
  ChangePWModelError._();
  factory ChangePWModelError({
    required String message,
    String? exception,
    String? code,
    int? status,
    String? error,
    ChangePWModelType? type,
  }) = _ChangePWModelError;

  factory ChangePWModelError.fromJson(Map<String, dynamic> json) =>
      _$ChangePWModelErrorFromJson(json);

  ChangePWModelError setType(ChangePWModelType _type) => ChangePWModelError(
        message: message,
        exception: exception,
        code: code,
        status: status,
        error: error,
        type: _type,
      );
}

class ChangePWModelLoading extends ChangePWModelBase {}
