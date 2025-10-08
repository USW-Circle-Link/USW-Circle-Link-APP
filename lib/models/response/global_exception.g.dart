// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_exception.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GlobalExceptionImpl _$$GlobalExceptionImplFromJson(
        Map<String, dynamic> json) =>
    _$GlobalExceptionImpl(
      exception: json['exception'] as String?,
      code: json['code'] as String?,
      message: json['message'] as String?,
      status: (json['status'] as num?)?.toInt(),
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$GlobalExceptionImplToJson(
        _$GlobalExceptionImpl instance) =>
    <String, dynamic>{
      'exception': instance.exception,
      'code': instance.code,
      'message': instance.message,
      'status': instance.status,
      'error': instance.error,
    };
