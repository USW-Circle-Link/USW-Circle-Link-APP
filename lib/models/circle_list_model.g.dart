// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'circle_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CircleListModelImpl _$$CircleListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CircleListModelImpl(
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => CircleListData.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: $enumDecodeNullable(_$CircleListModelTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$CircleListModelImplToJson(
        _$CircleListModelImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data.map((e) => e.toJson()).toList(),
      'type': _$CircleListModelTypeEnumMap[instance.type],
    };

const _$CircleListModelTypeEnumMap = {
  CircleListModelType.all: 'all',
  CircleListModelType.department: 'department',
  CircleListModelType.filtered_all: 'filtered_all',
  CircleListModelType.filtered_open: 'filtered_open',
};

_$CircleFilteredListModelImpl _$$CircleFilteredListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CircleFilteredListModelImpl(
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map(
              (e) => CircleFilteredListData.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: $enumDecodeNullable(_$CircleListModelTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$CircleFilteredListModelImplToJson(
        _$CircleFilteredListModelImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data.map((e) => e.toJson()).toList(),
      'type': _$CircleListModelTypeEnumMap[instance.type],
    };

_$CircleListDataImpl _$$CircleListDataImplFromJson(Map<String, dynamic> json) =>
    _$CircleListDataImpl(
      clubId: (json['clubId'] as num).toInt(),
      clubName: json['clubName'] as String,
      mainPhoto: json['mainPhoto'] as String?,
      departmentName: json['departmentName'] as String?,
      clubHashtags: (json['clubHashtags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$CircleListDataImplToJson(
        _$CircleListDataImpl instance) =>
    <String, dynamic>{
      'clubId': instance.clubId,
      'clubName': instance.clubName,
      'mainPhoto': instance.mainPhoto,
      'departmentName': instance.departmentName,
      'clubHashtags': instance.clubHashtags,
    };

_$CircleFilteredListDataImpl _$$CircleFilteredListDataImplFromJson(
        Map<String, dynamic> json) =>
    _$CircleFilteredListDataImpl(
      categoryId: (json['categoryId'] as num).toInt(),
      clubCategoryName: json['clubCategoryName'] as String?,
      categoryName: json['categoryName'] as String?,
      clubs: (json['clubs'] as List<dynamic>)
          .map((e) => CircleListData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CircleFilteredListDataImplToJson(
        _$CircleFilteredListDataImpl instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'clubCategoryName': instance.clubCategoryName,
      'categoryName': instance.categoryName,
      'clubs': instance.clubs,
    };

_$CircleListModelErrorImpl _$$CircleListModelErrorImplFromJson(
        Map<String, dynamic> json) =>
    _$CircleListModelErrorImpl(
      message: json['message'] as String?,
      code: json['code'] as String?,
      type: $enumDecodeNullable(_$CircleListModelTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$CircleListModelErrorImplToJson(
        _$CircleListModelErrorImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'type': _$CircleListModelTypeEnumMap[instance.type],
    };
