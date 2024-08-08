// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ChangePWModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChangePWModelImpl _$$ChangePWModelImplFromJson(Map<String, dynamic> json) =>
    _$ChangePWModelImpl(
      message: json['message'] as String,
    );

Map<String, dynamic> _$$ChangePWModelImplToJson(_$ChangePWModelImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
    };

_$ChangePWModelErrorImpl _$$ChangePWModelErrorImplFromJson(
        Map<String, dynamic> json) =>
    _$ChangePWModelErrorImpl(
      message: json['message'] as String,
      exception: json['exception'] as String?,
      code: json['code'] as String?,
      status: (json['status'] as num?)?.toInt(),
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$ChangePWModelErrorImplToJson(
        _$ChangePWModelErrorImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'exception': instance.exception,
      'code': instance.code,
      'status': instance.status,
      'error': instance.error,
    };
