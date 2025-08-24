import 'package:json_annotation/json_annotation.dart';

part 'profile_model.g.dart';

abstract class ProfileModelBase {}

class ProfileModelError extends ProfileModelBase {
  final String message;
  ProfileModelError({required this.message});
}

@JsonSerializable()
class ProfileModel extends ProfileModelBase {
  final String loginId;
  final String name;
  final String email;
  final String? profileImage;

  ProfileModel({
    required this.loginId,
    required this.name,
    required this.email,
    this.profileImage,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
}