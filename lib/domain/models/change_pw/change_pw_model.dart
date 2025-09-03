import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_pw_model.freezed.dart';
part 'change_pw_model.g.dart';

enum ChangePwType { changePW, resetPW }


@freezed
class ChangePwModel with _$ChangePwModel {
  const ChangePwModel._();

  const factory ChangePwModel({
    required String message,
    required ChangePwType type,
  }) = _ChangePwModel;

  factory ChangePwModel.changed({required String message}) =>
      ChangePwModel(message: message, type: ChangePwType.changePW);

  factory ChangePwModel.reset({required String message}) =>
      ChangePwModel(message: message, type: ChangePwType.resetPW);

  factory ChangePwModel.fromJson(Map<String, dynamic> json) =>
      _$ChangePwModelFromJson(json);
}