// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignUpRequestImpl _$$SignUpRequestImplFromJson(Map<String, dynamic> json) =>
    _$SignUpRequestImpl(
      account: json['account'] as String,
      password: json['password'] as String,
      confirmPassword: json['confirmPassword'] as String,
      userName: json['userName'] as String,
      telephone: json['telephone'] as String,
      studentNumber: json['studentNumber'] as String,
      major: json['major'] as String,
      email: json['email'] as String,
      uuid: json['uuid'] as String?,
      clubs: (json['clubs'] as List<dynamic>?)
          ?.map((e) => Map<String, String>.from(e as Map))
          .toList(),
    );

Map<String, dynamic> _$$SignUpRequestImplToJson(_$SignUpRequestImpl instance) =>
    <String, dynamic>{
      'account': instance.account,
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
      'userName': instance.userName,
      'telephone': instance.telephone,
      'studentNumber': instance.studentNumber,
      'major': instance.major,
      'email': instance.email,
      'uuid': instance.uuid,
      'clubs': instance.clubs,
    };
