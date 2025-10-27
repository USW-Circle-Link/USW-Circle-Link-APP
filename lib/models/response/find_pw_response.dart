import 'package:freezed_annotation/freezed_annotation.dart';

part 'find_pw_response.freezed.dart';
part 'find_pw_response.g.dart';

@freezed
class FindPwResponse with _$FindPwResponse {
  factory FindPwResponse({
    required String message,
    String? data,
  }) = _FindPwResponse;

  factory FindPwResponse.fromJson(Map<String, dynamic> json) =>
      _$FindPwResponseFromJson(json);
}
