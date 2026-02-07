// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginDataImpl _$$LoginDataImplFromJson(Map<String, dynamic> json) =>
    _$LoginDataImpl(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      role:
          $enumDecodeNullable(_$UserRoleEnumMap, json['role']) ?? UserRole.user,
      clubuuid: json['clubuuid'] as String?,
    );

Map<String, dynamic> _$$LoginDataImplToJson(_$LoginDataImpl instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'role': _$UserRoleEnumMap[instance.role]!,
      'clubuuid': instance.clubuuid,
    };

const _$UserRoleEnumMap = {
  UserRole.user: 'USER',
  UserRole.leader: 'LEADER',
  UserRole.admin: 'ADMIN',
};
