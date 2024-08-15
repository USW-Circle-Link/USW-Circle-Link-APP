import 'package:freezed_annotation/freezed_annotation.dart';

part 'UserModel.freezed.dart';
part 'UserModel.g.dart';

abstract class UserModelBase {}

@freezed
class UserModel extends UserModelBase with _$UserModel {
  @JsonSerializable(explicitToJson: true)
  const factory UserModel({
    required String message,
     required LoginData data,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}

@freezed
class LoginData with _$LoginData {

  factory LoginData({
    required String accessToken,
    required String refreshToken,
  }) = _LoginData;

  factory LoginData.fromJson(Map<String, dynamic> json) => _$LoginDataFromJson(json);
}

@freezed
class UserModelError extends UserModelBase with _$UserModelError implements Exception {

  factory UserModelError({
    required String message,
    String? code,
    String? exception,
    String? error,
    int? status,
  }) = _UserModelError;

  factory UserModelError.fromJson(Map<String, dynamic> json) => _$UserModelErrorFromJson(json);
}

class UserModelLoading extends UserModelBase {}