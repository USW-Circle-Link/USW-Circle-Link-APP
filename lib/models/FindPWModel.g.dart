// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FindPWModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FindPWModelImpl _$$FindPWModelImplFromJson(Map<String, dynamic> json) =>
    _$FindPWModelImpl(
      message: json['message'] as String,
      data: json['data'] as String,
      type: $enumDecodeNullable(_$FindPWModelTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$FindPWModelImplToJson(_$FindPWModelImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
      'type': _$FindPWModelTypeEnumMap[instance.type],
    };

const _$FindPWModelTypeEnumMap = {
  FindPWModelType.findPW: 'findPW',
  FindPWModelType.resendMail: 'resendMail',
};

_$FindPWModelErrorImpl _$$FindPWModelErrorImplFromJson(
        Map<String, dynamic> json) =>
    _$FindPWModelErrorImpl(
      exception: json['exception'] as String?,
      code: json['code'] as String?,
      message: json['message'] as String,
      error: json['error'] as String?,
      status: (json['status'] as num?)?.toInt(),
      type: $enumDecodeNullable(_$FindPWModelTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$FindPWModelErrorImplToJson(
        _$FindPWModelErrorImpl instance) =>
    <String, dynamic>{
      'exception': instance.exception,
      'code': instance.code,
      'message': instance.message,
      'error': instance.error,
      'status': instance.status,
      'type': _$FindPWModelTypeEnumMap[instance.type],
    };
