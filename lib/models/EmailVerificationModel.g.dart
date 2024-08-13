// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EmailVerificationModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EmailVerificationModelImpl _$$EmailVerificationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EmailVerificationModelImpl(
      message: json['message'] as String,
      data:
          EmailVerificationData.fromJson(json['data'] as Map<String, dynamic>),
      type: $enumDecodeNullable(
          _$EmailVerificationModelTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$EmailVerificationModelImplToJson(
        _$EmailVerificationModelImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data.toJson(),
      'type': _$EmailVerificationModelTypeEnumMap[instance.type],
    };

const _$EmailVerificationModelTypeEnumMap = {
  EmailVerificationModelType.sendMail: 'sendMail',
  EmailVerificationModelType.resendMail: 'resendMail',
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

_$EmailVerificationModelResendImpl _$$EmailVerificationModelResendImplFromJson(
        Map<String, dynamic> json) =>
    _$EmailVerificationModelResendImpl(
      message: json['message'] as String,
      data: json['data'] as String,
      type: $enumDecodeNullable(
          _$EmailVerificationModelTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$EmailVerificationModelResendImplToJson(
        _$EmailVerificationModelResendImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
      'type': _$EmailVerificationModelTypeEnumMap[instance.type],
    };

_$EmailVerificationModelCompleteImpl
    _$$EmailVerificationModelCompleteImplFromJson(Map<String, dynamic> json) =>
        _$EmailVerificationModelCompleteImpl(
          message: json['message'] as String,
          data: json['data'] as String,
          type: $enumDecodeNullable(
              _$EmailVerificationModelTypeEnumMap, json['type']),
        );

Map<String, dynamic> _$$EmailVerificationModelCompleteImplToJson(
        _$EmailVerificationModelCompleteImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
      'type': _$EmailVerificationModelTypeEnumMap[instance.type],
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
