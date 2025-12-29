// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_verification_model.freezed.dart';
part 'email_verification_model.g.dart';

@freezed
class EmailVerificationModel with _$EmailVerificationModel {
  @JsonSerializable(explicitToJson: true)
  factory EmailVerificationModel({
    required String uuid,
  }) = _EmailVerificationModel;
}
