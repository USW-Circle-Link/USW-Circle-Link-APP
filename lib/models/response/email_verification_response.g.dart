// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_verification_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EmailVerificationResponseImpl _$$EmailVerificationResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$EmailVerificationResponseImpl(
      message: json['message'] as String,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$EmailVerificationResponseImplToJson(
        _$EmailVerificationResponseImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      uuid: json['emailToken_uuid'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'emailToken_uuid': instance.uuid,
      'email': instance.email,
    };
