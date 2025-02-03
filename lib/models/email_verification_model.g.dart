// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_verification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EmailVerificationModelImpl _$$EmailVerificationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EmailVerificationModelImpl(
      message: json['message'] as String,
      data: json['data'],
      type: $enumDecodeNullable(
          _$EmailVerificationModelTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$EmailVerificationModelImplToJson(
        _$EmailVerificationModelImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
      'type': _$EmailVerificationModelTypeEnumMap[instance.type],
    };

const _$EmailVerificationModelTypeEnumMap = {
  EmailVerificationModelType.sendMail: 'sendMail',
  EmailVerificationModelType.completeSignUp: 'completeSignUp',
};

_$EmailVerificationDataImpl _$$EmailVerificationDataImplFromJson(
        Map<String, dynamic> json) =>
    _$EmailVerificationDataImpl(
      account: json['account'] as String,
      emailToken_uuid: json['emailToken_uuid'] as String,
    );

Map<String, dynamic> _$$EmailVerificationDataImplToJson(
        _$EmailVerificationDataImpl instance) =>
    <String, dynamic>{
      'account': instance.account,
      'emailToken_uuid': instance.emailToken_uuid,
    };

_$EmailVerificationModelErrorImpl _$$EmailVerificationModelErrorImplFromJson(
        Map<String, dynamic> json) =>
    _$EmailVerificationModelErrorImpl(
      exception: json['exception'] as String?,
      code: json['code'] as String?,
      error: json['error'] as String?,
      status: (json['status'] as num?)?.toInt(),
      message: json['message'] as String,
      type: $enumDecodeNullable(
          _$EmailVerificationModelTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$EmailVerificationModelErrorImplToJson(
        _$EmailVerificationModelErrorImpl instance) =>
    <String, dynamic>{
      'exception': instance.exception,
      'code': instance.code,
      'error': instance.error,
      'status': instance.status,
      'message': instance.message,
      'type': _$EmailVerificationModelTypeEnumMap[instance.type],
    };
