import 'package:freezed_annotation/freezed_annotation.dart';

/// 사용자 역할 Enum
///
/// API 명세서 기준: USER, LEADER, ADMIN
enum UserRole {
  @JsonValue('USER')
  user,
  @JsonValue('LEADER')
  leader,
  @JsonValue('ADMIN')
  admin;

  const UserRole();
}
