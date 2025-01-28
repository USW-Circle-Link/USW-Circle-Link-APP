// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'find_id_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FindIdModelImpl _$$FindIdModelImplFromJson(Map<String, dynamic> json) =>
    _$FindIdModelImpl(
      message: json['message'] as String,
      data: json['data'] as String,
    );

Map<String, dynamic> _$$FindIdModelImplToJson(_$FindIdModelImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

_$FindIdModelErrorImpl _$$FindIdModelErrorImplFromJson(
        Map<String, dynamic> json) =>
    _$FindIdModelErrorImpl(
      exception: json['exception'] as String?,
      code: json['code'] as String?,
      message: json['message'] as String,
      error: json['error'] as String?,
      status: (json['status'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$FindIdModelErrorImplToJson(
        _$FindIdModelErrorImpl instance) =>
    <String, dynamic>{
      'exception': instance.exception,
      'code': instance.code,
      'message': instance.message,
      'error': instance.error,
      'status': instance.status,
    };
