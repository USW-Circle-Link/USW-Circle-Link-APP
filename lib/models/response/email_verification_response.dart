import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_verification_response.freezed.dart';
part 'email_verification_response.g.dart';

@freezed
class EmailVerificationResponse with _$EmailVerificationResponse {
  @JsonSerializable(explicitToJson: true)
  const factory EmailVerificationResponse({
    @JsonKey(name: "message") required String message,
    @JsonKey(name: "data") required EmailVerificationData data,
  }) = _EmailVerificationResponse;

  factory EmailVerificationResponse.fromJson(Map<String, dynamic> json) =>
      _$EmailVerificationResponseFromJson(json);
}

@freezed
class EmailVerificationData with _$EmailVerificationData {
  const factory EmailVerificationData({
    @JsonKey(name: "emailTokenUUID") required String emailTokenUuid,
    @JsonKey(name: "signupUUID") required String signupUuid,
  }) = _EmailVerificationData;

  factory EmailVerificationData.fromJson(Map<String, dynamic> json) =>
      _$EmailVerificationDataFromJson(json);
}
