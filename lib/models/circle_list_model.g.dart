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
      clubUUID: json['clubUUID'] as String,
      clubName: json['clubName'] as String,
      mainPhoto: json['mainPhotoUrl'] as String?,
      departmentName: json['department'] as String?,
      clubHashtags: (json['hashtags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$CircleListDataImplToJson(
        _$CircleListDataImpl instance) =>
    <String, dynamic>{
      'clubUUID': instance.clubUUID,
      'clubName': instance.clubName,
      'mainPhotoUrl': instance.mainPhoto,
      'department': instance.departmentName,
      'hashtags': instance.clubHashtags,
    };

_$CircleFilteredListDataImpl _$$CircleFilteredListDataImplFromJson(
        Map<String, dynamic> json) =>
    _$CircleFilteredListDataImpl(
      clubCategoryUUID: json['clubCategoryUUID'] as String,
      clubCategoryName: json['clubCategoryName'] as String,
      clubs: (json['clubs'] as List<dynamic>)
          .map((e) => CircleListData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CircleFilteredListDataImplToJson(
        _$CircleFilteredListDataImpl instance) =>
    <String, dynamic>{
      'clubCategoryUUID': instance.clubCategoryUUID,
      'clubCategoryName': instance.clubCategoryName,
      'clubs': instance.clubs,
    };
