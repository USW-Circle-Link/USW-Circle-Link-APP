import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:usw_circle_link/utils/decoder/JWTDecoder.dart';

part 'UserModel.freezed.dart';
part 'UserModel.g.dart';

abstract class UserModelBase {}

@freezed
class UserModel extends UserModelBase with _$UserModel {
  const factory UserModel({
    required String message,
    @JWTConverter() required LoginData data,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}

@freezed
class LoginData with _$LoginData {

  factory LoginData({
    required String accessToken,
    List<String>? clubIds,
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

class JWTConverter implements JsonConverter<LoginData, LoginData>{
  const JWTConverter();

  @override
  LoginData fromJson(LoginData json) {
    final accessToken = json.accessToken;
    final payload = JwtDecoder.decode(accessToken);
    return LoginData(accessToken: accessToken, clubIds: payload['clubIds']);
  }

  @override
  LoginData toJson(LoginData object) {
    return LoginData(accessToken: object.accessToken);
  }

}