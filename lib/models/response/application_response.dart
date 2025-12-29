import 'package:freezed_annotation/freezed_annotation.dart';

part 'application_response.freezed.dart';
part 'application_response.g.dart';

@freezed
class ApplicationResponse with _$ApplicationResponse {
  factory ApplicationResponse({
    required String message,
    String? data,
  }) = _ApplicationResponse;

  factory ApplicationResponse.fromJson(Map<String, dynamic> json) =>
      _$ApplicationResponseFromJson(json);
}
