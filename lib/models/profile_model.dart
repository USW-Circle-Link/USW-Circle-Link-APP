// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

abstract class ProfileModelBase {}

enum ProfileModelType { getProfile, updateProfile, checkDuplication }

@freezed
class ProfileModel extends ProfileModelBase with _$ProfileModel {
  ProfileModel._();

  @JsonSerializable(explicitToJson: true)
  factory ProfileModel({
    required String message,
    required ProfileData data,
    ProfileModelType? type,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  ProfileModel setType(ProfileModelType type) => ProfileModel(
        message: message,
        data: data,
        type: type,
      );
}

@freezed
class ProfileData with _$ProfileData {
  factory ProfileData({
    required String userName,
    required String studentNumber,
    required String userHp,
    required String major,
    required String? password,
  }) = _ProfileData;

  factory ProfileData.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataFromJson(json);
}

@freezed
class ProfileModelError with _$ProfileModelError implements Exception {
  ProfileModelError._();

  factory ProfileModelError({
    required String message,
    String? code,
    ProfileModelType? type,
  }) = _ProfileModelError;

  factory ProfileModelError.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelErrorFromJson(json);

  ProfileModelError setType(ProfileModelType type) => ProfileModelError(
        message: message,
        code: code,
        type: type,
      );

  StackTrace get stackTrace => StackTrace.fromString(toString());
}
