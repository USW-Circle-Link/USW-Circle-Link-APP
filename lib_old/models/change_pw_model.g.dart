// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_pw_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChangePWModelImpl _$$ChangePWModelImplFromJson(Map<String, dynamic> json) =>
    _$ChangePWModelImpl(
      message: json['message'] as String,
      type: $enumDecodeNullable(_$ChangePwModelTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$ChangePWModelImplToJson(_$ChangePWModelImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'type': _$ChangePwModelTypeEnumMap[instance.type],
    };

const _$ChangePwModelTypeEnumMap = {
  ChangePwModelType.changePW: 'changePW',
  ChangePwModelType.resetPW: 'resetPW',
};

_$ChangePWModelErrorImpl _$$ChangePWModelErrorImplFromJson(
        Map<String, dynamic> json) =>
    _$ChangePWModelErrorImpl(
      message: json['message'] as String,
      exception: json['exception'] as String?,
      code: json['code'] as String?,
      status: (json['status'] as num?)?.toInt(),
      error: json['error'] as String?,
      type: $enumDecodeNullable(_$ChangePwModelTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$ChangePWModelErrorImplToJson(
        _$ChangePWModelErrorImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'exception': instance.exception,
      'code': instance.code,
      'status': instance.status,
      'error': instance.error,
      'type': _$ChangePwModelTypeEnumMap[instance.type],
    };
