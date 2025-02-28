import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_verification_response.freezed.dart';
part 'email_verification_response.g.dart';

@freezed
class EmailVerificationResponse with _$EmailVerificationResponse {
  const factory EmailVerificationResponse({
    @JsonKey(name: "message") required String message,
    @JsonKey(name: "data") required Data data,
  }) = _EmailVerificationResponse;

  factory EmailVerificationResponse.fromJson(Map<String, dynamic> json) =>
      _$EmailVerificationResponseFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: "emailToken_uuid") required String uuid,
    @JsonKey(name: "email") required String email,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
