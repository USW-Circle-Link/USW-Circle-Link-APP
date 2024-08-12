import 'package:freezed_annotation/freezed_annotation.dart';

part 'ChangePWModel.freezed.dart';
part 'ChangePWModel.g.dart';

abstract class ChangePWModelBase {}

@freezed
class ChangePWModel extends ChangePWModelBase with _$ChangePWModel {
  factory ChangePWModel({
    required String message,
  }) = _ChangePWModel;

  factory ChangePWModel.fromJson(Map<String, dynamic> json) =>
      _$ChangePWModelFromJson(json);
}

class ChangePWModelLoading extends ChangePWModelBase {}

@freezed
class ChangePWModelError extends ChangePWModelBase with _$ChangePWModelError implements Exception {
  factory ChangePWModelError({
    required String message,
    String? exception,
    String? code,
    int? status,
    String? error,
  }) = _ChangePWModelError;

  factory ChangePWModelError.fromJson(Map<String, dynamic> json) =>
      _$ChangePWModelErrorFromJson(json);
}
