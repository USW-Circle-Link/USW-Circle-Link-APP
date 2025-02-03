// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryModelImpl _$$CategoryModelImplFromJson(Map<String, dynamic> json) =>
    _$CategoryModelImpl(
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => CategoryData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CategoryModelImplToJson(_$CategoryModelImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

_$CategoryDataImpl _$$CategoryDataImplFromJson(Map<String, dynamic> json) =>
    _$CategoryDataImpl(
      clubCategoryId: (json['clubCategoryId'] as num).toInt(),
      clubCategory: json['clubCategory'] as String,
    );

Map<String, dynamic> _$$CategoryDataImplToJson(_$CategoryDataImpl instance) =>
    <String, dynamic>{
      'clubCategoryId': instance.clubCategoryId,
      'clubCategory': instance.clubCategory,
    };

_$CategoryModelErrorImpl _$$CategoryModelErrorImplFromJson(
        Map<String, dynamic> json) =>
    _$CategoryModelErrorImpl(
      message: json['message'] as String,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$$CategoryModelErrorImplToJson(
        _$CategoryModelErrorImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
    };
