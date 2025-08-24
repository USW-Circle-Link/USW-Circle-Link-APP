// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exception.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExceptionImpl _$$ExceptionImplFromJson(Map<String, dynamic> json) =>
    _$ExceptionImpl(
      exception: json['exception'] as String?,
      code: json['code'] as String?,
      message: json['message'] as String?,
      status: (json['status'] as num?)?.toInt(),
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$ExceptionImplToJson(_$ExceptionImpl instance) =>
    <String, dynamic>{
      'exception': instance.exception,
      'code': instance.code,
      'message': instance.message,
      'status': instance.status,
      'error': instance.error,
    };
