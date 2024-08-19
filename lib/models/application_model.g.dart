// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApplicationModelImpl _$$ApplicationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ApplicationModelImpl(
      message: json['message'] as String,
      data: json['data'] as String?,
      type: $enumDecodeNullable(_$ApplicationModelTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$ApplicationModelImplToJson(
        _$ApplicationModelImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
      'type': _$ApplicationModelTypeEnumMap[instance.type],
    };

const _$ApplicationModelTypeEnumMap = {
  ApplicationModelType.getApplication: 'getApplication',
  ApplicationModelType.apply: 'apply',
};

_$ApplicationModelErrorImpl _$$ApplicationModelErrorImplFromJson(
        Map<String, dynamic> json) =>
    _$ApplicationModelErrorImpl(
      message: json['message'] as String,
      type: $enumDecodeNullable(_$ApplicationModelTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$ApplicationModelErrorImplToJson(
        _$ApplicationModelErrorImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'type': _$ApplicationModelTypeEnumMap[instance.type],
    };
