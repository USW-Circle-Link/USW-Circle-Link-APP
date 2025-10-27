import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_event_response.freezed.dart';
part 'verify_event_response.g.dart';

@freezed
class VerifyEventResponse with _$VerifyEventResponse {
  factory VerifyEventResponse({
    required String clubUUID,
    required bool isFirstVerify,
    required String verifiedAt,
  }) = _VerifyEventResponse;

  factory VerifyEventResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyEventResponseFromJson(json);
}
