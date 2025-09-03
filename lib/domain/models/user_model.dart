import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

abstract class UserModelBase {}

class UserModelError extends UserModelBase {
  final String message;
  UserModelError({required this.message});
}

@JsonSerializable()
class UserModel extends UserModelBase {
  final String accessToken;
  final String refreshToken;

  UserModel({required this.accessToken, required this.refreshToken});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
