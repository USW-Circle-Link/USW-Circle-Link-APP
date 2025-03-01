import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_request.freezed.dart';
part 'sign_up_request.g.dart';

@freezed
class SignUpRequest with _$SignUpRequest {
  const factory SignUpRequest({
    @JsonKey(name: "account") required String account,
    @JsonKey(name: "password") required String password,
    @JsonKey(name: "confirmPassword") required String confirmPassword,
    @JsonKey(name: "userName") required String userName,
    @JsonKey(name: "telephone") required String telephone,
    @JsonKey(name: "studentNumber") required String studentNumber,
    @JsonKey(name: "major") required String major,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "emailTokenUUID") String? emailTokenUUID,
    @JsonKey(name: "signupUUID") String? signupUUID,
    @JsonKey(name: "clubs") List<Map<String, String>>? clubs,
  }) = _SignUpRequest;

  factory SignUpRequest.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestFromJson(json);
}
