import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_pw_model.freezed.dart';
part 'change_pw_model.g.dart';

enum ChangePwModelType { changePW, resetPW }

abstract class ChangePwModelBase {}

@freezed
class ChangePwModel extends ChangePwModelBase with _$ChangePwModel {
  ChangePwModel._();

  factory ChangePwModel({
    required String message,
    ChangePwModelType? type,
  }) = _ChangePWModel;

  factory ChangePwModel.fromJson(Map<String, dynamic> json) =>
      _$ChangePwModelFromJson(json);

  ChangePwModel setType(ChangePwModelType _type) => ChangePwModel(
        message: message,
        type: _type,
      );
}

@freezed
class ChangePwModelError extends ChangePwModelBase
    with _$ChangePwModelError
    implements Exception {
  ChangePwModelError._();
  factory ChangePwModelError({
    required String message,
    String? exception,
    String? code,
    int? status,
    String? error,
    ChangePwModelType? type,
  }) = _ChangePWModelError;

  factory ChangePwModelError.fromJson(Map<String, dynamic> json) =>
      _$ChangePwModelErrorFromJson(json);

  ChangePwModelError setType(ChangePwModelType _type) => ChangePwModelError(
        message: message,
        exception: exception,
        code: code,
        status: status,
        error: error,
        type: _type,
      );
}

class ChangePwModelLoading extends ChangePwModelBase {}

