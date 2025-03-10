// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_verification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EmailVerificationModelImpl _$$EmailVerificationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EmailVerificationModelImpl(
      uuid: json['uuid'] as String,
    );

Map<String, dynamic> _$$EmailVerificationModelImplToJson(
        _$EmailVerificationModelImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
    };

_$EmailVerificationModelErrorImpl _$$EmailVerificationModelErrorImplFromJson(
        Map<String, dynamic> json) =>
    _$EmailVerificationModelErrorImpl(
      exception: json['exception'] as String?,
      code: json['code'] as String?,
      error: json['error'] as String?,
      status: (json['status'] as num?)?.toInt(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$$EmailVerificationModelErrorImplToJson(
        _$EmailVerificationModelErrorImpl instance) =>
    <String, dynamic>{
      'exception': instance.exception,
      'code': instance.code,
      'error': instance.error,
      'status': instance.status,
      'message': instance.message,
    };
