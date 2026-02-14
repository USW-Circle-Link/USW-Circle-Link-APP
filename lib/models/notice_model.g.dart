// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NoticeModelImpl _$$NoticeModelImplFromJson(Map<String, dynamic> json) =>
    _$NoticeModelImpl(
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>)
          .map((e) => NoticeData.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: (json['totalPages'] as num?)?.toInt(),
      totalElements: (json['totalElements'] as num?)?.toInt(),
      currentPage: (json['currentPage'] as num?)?.toInt(),
      type: $enumDecodeNullable(_$NoticeModelTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$NoticeModelImplToJson(_$NoticeModelImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data.map((e) => e.toJson()).toList(),
      'totalPages': instance.totalPages,
      'totalElements': instance.totalElements,
      'currentPage': instance.currentPage,
      'type': _$NoticeModelTypeEnumMap[instance.type],
    };

const _$NoticeModelTypeEnumMap = {
  NoticeModelType.fetchAll: 'fetchAll',
};

_$NoticeModelErrorImpl _$$NoticeModelErrorImplFromJson(
        Map<String, dynamic> json) =>
    _$NoticeModelErrorImpl(
      message: json['message'] as String,
      type: $enumDecodeNullable(_$NoticeModelTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$NoticeModelErrorImplToJson(
        _$NoticeModelErrorImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'type': _$NoticeModelTypeEnumMap[instance.type],
    };
