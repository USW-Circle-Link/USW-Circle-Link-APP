// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NoticeDetailModelImpl _$$NoticeDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NoticeDetailModelImpl(
      message: json['message'] as String?,
      data: NoticeDetailData.fromJson(json['data'] as Map<String, dynamic>),
      type: $enumDecodeNullable(_$NoticeDetailModelTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$NoticeDetailModelImplToJson(
        _$NoticeDetailModelImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data.toJson(),
      'type': _$NoticeDetailModelTypeEnumMap[instance.type],
    };

const _$NoticeDetailModelTypeEnumMap = {
  NoticeDetailModelType.getDetail: 'getDetail',
};

_$NoticeDetailDataImpl _$$NoticeDetailDataImplFromJson(
        Map<String, dynamic> json) =>
    _$NoticeDetailDataImpl(
      noticeUUID: json['noticeUUID'] as String,
      noticeTitle: json['noticeTitle'] as String,
      noticeContent: json['noticeContent'] as String,
      adminName: json['adminName'] as String?,
      noticeCreatedAt: json['noticeCreatedAt'] as String,
      noticePhotos: (json['noticePhotos'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$NoticeDetailDataImplToJson(
        _$NoticeDetailDataImpl instance) =>
    <String, dynamic>{
      'noticeUUID': instance.noticeUUID,
      'noticeTitle': instance.noticeTitle,
      'noticeContent': instance.noticeContent,
      'adminName': instance.adminName,
      'noticeCreatedAt': instance.noticeCreatedAt,
      'noticePhotos': instance.noticePhotos,
    };

_$NoticeDetailModelErrorImpl _$$NoticeDetailModelErrorImplFromJson(
        Map<String, dynamic> json) =>
    _$NoticeDetailModelErrorImpl(
      message: json['message'] as String,
      type: $enumDecodeNullable(_$NoticeDetailModelTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$NoticeDetailModelErrorImplToJson(
        _$NoticeDetailModelErrorImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'type': _$NoticeDetailModelTypeEnumMap[instance.type],
    };
