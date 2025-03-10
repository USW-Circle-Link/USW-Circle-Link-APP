// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_verification_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EmailVerificationResponseImpl _$$EmailVerificationResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$EmailVerificationResponseImpl(
      message: json['message'] as String,
      data:
          EmailVerificationData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$EmailVerificationResponseImplToJson(
        _$EmailVerificationResponseImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data.toJson(),
    };

_$EmailVerificationDataImpl _$$EmailVerificationDataImplFromJson(
        Map<String, dynamic> json) =>
    _$EmailVerificationDataImpl(
      emailTokenUuid: json['emailTokenUUID'] as String,
      signupUuid: json['signupUUID'] as String,
    );

Map<String, dynamic> _$$EmailVerificationDataImplToJson(
        _$EmailVerificationDataImpl instance) =>
    <String, dynamic>{
      'emailTokenUUID': instance.emailTokenUuid,
      'signupUUID': instance.signupUuid,
    };
