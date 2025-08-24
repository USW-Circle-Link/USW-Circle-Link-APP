// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NoticeModelImpl _$$NoticeModelImplFromJson(Map<String, dynamic> json) =>
    _$NoticeModelImpl(
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => NoticeData.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: $enumDecodeNullable(_$NoticeModelTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$NoticeModelImplToJson(_$NoticeModelImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data.map((e) => e.toJson()).toList(),
      'type': _$NoticeModelTypeEnumMap[instance.type],
    };

const _$NoticeModelTypeEnumMap = {
  NoticeModelType.fetchAll: 'fetchAll',
};

_$NoticeDataImpl _$$NoticeDataImplFromJson(Map<String, dynamic> json) =>
    _$NoticeDataImpl(
      noticeUUID: json['noticeUUID'] as String,
      noticeTitle: json['noticeTitle'] as String,
      adminName: json['adminName'] as String,
      noticeCreatedAt: json['noticeCreatedAt'] as String,
    );

Map<String, dynamic> _$$NoticeDataImplToJson(_$NoticeDataImpl instance) =>
    <String, dynamic>{
      'noticeUUID': instance.noticeUUID,
      'noticeTitle': instance.noticeTitle,
      'adminName': instance.adminName,
      'noticeCreatedAt': instance.noticeCreatedAt,
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
