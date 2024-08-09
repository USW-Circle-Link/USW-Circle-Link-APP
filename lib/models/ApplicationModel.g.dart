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
