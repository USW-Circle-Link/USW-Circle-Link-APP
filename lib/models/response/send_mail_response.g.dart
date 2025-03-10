// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_mail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SendMailResponseImpl _$$SendMailResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SendMailResponseImpl(
      message: json['message'] as String,
      data: SendMailData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SendMailResponseImplToJson(
        _$SendMailResponseImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

_$SendMailDataImpl _$$SendMailDataImplFromJson(Map<String, dynamic> json) =>
    _$SendMailDataImpl(
      emailTokenUUID: json['emailToken_uuid'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$$SendMailDataImplToJson(_$SendMailDataImpl instance) =>
    <String, dynamic>{
      'emailToken_uuid': instance.emailTokenUUID,
      'email': instance.email,
    };
