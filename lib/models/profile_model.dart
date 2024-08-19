import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

abstract class ProfileModelBase {}

@freezed
class ProfileModel extends ProfileModelBase with _$ProfileModel {

  @JsonSerializable(explicitToJson: true)
  factory ProfileModel({
    required String message,
    required ProfileData data,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => _$ProfileModelFromJson(json);
}

@freezed
class ProfileData with _$ProfileData {

  factory ProfileData({
    required String userName,
    required String studentNumber,
    required String userHp,
    required String major,
  }) = _ProfileData;

  factory ProfileData.fromJson(Map<String, dynamic> json) => _$ProfileDataFromJson(json);
}

@freezed
class ProfileModelError extends ProfileModelBase with _$ProfileModelError implements Exception {

  factory ProfileModelError({
    required String message,
  }) = _ProfileModelError;

  factory ProfileModelError.fromJson(Map<String, dynamic> json) => _$ProfileModelErrorFromJson(json);
}

class ProfileModelLoading extends ProfileModelBase {}

