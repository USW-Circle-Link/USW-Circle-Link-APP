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
};

_$CircleListDataImpl _$$CircleListDataImplFromJson(Map<String, dynamic> json) =>
    _$CircleListDataImpl(
      clubName: json['clubName'] as String,
      mainPhoto: json['mainPhoto'] as String,
      departmentName: json['departmentName'] as String,
    );

Map<String, dynamic> _$$CircleListDataImplToJson(
        _$CircleListDataImpl instance) =>
    <String, dynamic>{
      'clubName': instance.clubName,
      'mainPhoto': instance.mainPhoto,
      'departmentName': instance.departmentName,
    };

_$CircleListModelErrorImpl _$$CircleListModelErrorImplFromJson(
        Map<String, dynamic> json) =>
    _$CircleListModelErrorImpl(
      type: $enumDecodeNullable(_$CircleListModelTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$CircleListModelErrorImplToJson(
        _$CircleListModelErrorImpl instance) =>
    <String, dynamic>{
      'type': _$CircleListModelTypeEnumMap[instance.type],
    };
