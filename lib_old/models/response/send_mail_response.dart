import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_mail_response.freezed.dart';
part 'send_mail_response.g.dart';

@freezed
class SendMailResponse with _$SendMailResponse {
  const factory SendMailResponse({
    @JsonKey(name: "message") required String message,
    @JsonKey(name: "data") required SendMailData data,
  }) = _SendMailResponse;

  factory SendMailResponse.fromJson(Map<String, dynamic> json) =>
      _$SendMailResponseFromJson(json);
}

@freezed
class SendMailData with _$SendMailData {
  const factory SendMailData({
    @JsonKey(name: "emailToken_uuid") required String emailTokenUUID,
    @JsonKey(name: "email") required String email,
  }) = _SendMailData;

  factory SendMailData.fromJson(Map<String, dynamic> json) =>
      _$SendMailDataFromJson(json);
}
