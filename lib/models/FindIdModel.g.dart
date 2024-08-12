// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FindIdModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FindIdModelImpl _$$FindIdModelImplFromJson(Map<String, dynamic> json) =>
    _$FindIdModelImpl(
      message: json['message'] as String,
      data: json['data'] as String,
      type: $enumDecodeNullable(_$FindIdModelTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$FindIdModelImplToJson(_$FindIdModelImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
      'type': _$FindIdModelTypeEnumMap[instance.type],
    };

const _$FindIdModelTypeEnumMap = {
  FindIdModelType.findId: 'findId',
  FindIdModelType.resendMail: 'resendMail',
};

_$FindIdModelErrorImpl _$$FindIdModelErrorImplFromJson(
        Map<String, dynamic> json) =>
    _$FindIdModelErrorImpl(
      exception: json['exception'] as String?,
      code: json['code'] as String?,
      message: json['message'] as String,
      error: json['error'] as String?,
      status: (json['status'] as num?)?.toInt(),
      type: $enumDecodeNullable(_$FindIdModelTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$FindIdModelErrorImplToJson(
        _$FindIdModelErrorImpl instance) =>
    <String, dynamic>{
      'exception': instance.exception,
      'code': instance.code,
      'message': instance.message,
      'error': instance.error,
      'status': instance.status,
      'type': _$FindIdModelTypeEnumMap[instance.type],
    };
