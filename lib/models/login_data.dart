// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:usw_circle_link/models/enums/user_role.dart';

part 'login_data.freezed.dart';
part 'login_data.g.dart';

@freezed
class LoginData with _$LoginData {
  factory LoginData({
    required String accessToken,
    required String refreshToken,
    @Default(UserRole.user) UserRole role,
    @JsonKey(name: 'clubuuid') String? clubuuid,
    @Default(false) bool isAgreedTerms,
  }) = _LoginData;

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);
}
