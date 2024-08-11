// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ApplicationModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApplicationModelImpl _$$ApplicationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ApplicationModelImpl(
      data: json['data'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$$ApplicationModelImplToJson(
        _$ApplicationModelImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
    };

_$ApplicationModelCompleteImpl _$$ApplicationModelCompleteImplFromJson(
        Map<String, dynamic> json) =>
    _$ApplicationModelCompleteImpl(
      message: json['message'] as String,
    );

Map<String, dynamic> _$$ApplicationModelCompleteImplToJson(
        _$ApplicationModelCompleteImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
    };

_$ApplicationModelErrorImpl _$$ApplicationModelErrorImplFromJson(
        Map<String, dynamic> json) =>
    _$ApplicationModelErrorImpl(
      message: json['message'] as String,
      errorType: $enumDecodeNullable(
          _$ApplicationModelErrorTypeEnumMap, json['errorType']),
    );

Map<String, dynamic> _$$ApplicationModelErrorImplToJson(
        _$ApplicationModelErrorImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'errorType': _$ApplicationModelErrorTypeEnumMap[instance.errorType],
    };

const _$ApplicationModelErrorTypeEnumMap = {
  ApplicationModelErrorType.getApplication: 'getApplication',
  ApplicationModelErrorType.apply: 'apply',
};
