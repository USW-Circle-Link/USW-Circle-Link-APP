// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'circle_detail_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CircleDetailListModelImpl _$$CircleDetailListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CircleDetailListModelImpl(
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => Circle.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CircleDetailListModelImplToJson(
        _$CircleDetailListModelImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

_$CircleImpl _$$CircleImplFromJson(Map<String, dynamic> json) => _$CircleImpl(
      clubUUID: json['clubUUID'] as String,
      mainPhotoPath: json['mainPhotoPath'] as String?,
      clubName: json['clubName'] as String,
      leaderName: json['leaderName'] as String,
      leaderHp: json['leaderHp'] as String,
      clubInsta: json['clubInsta'] as String,
      clubRoomNumber: json['clubRoomNumber'] as String?,
      aplictStatus: json['aplictStatus'] as String?,
      aplictUUID: json['aplictUUID'] as String?,
    );

Map<String, dynamic> _$$CircleImplToJson(_$CircleImpl instance) =>
    <String, dynamic>{
      'clubUUID': instance.clubUUID,
      'mainPhotoPath': instance.mainPhotoPath,
      'clubName': instance.clubName,
      'leaderName': instance.leaderName,
      'leaderHp': instance.leaderHp,
      'clubInsta': instance.clubInsta,
      'clubRoomNumber': instance.clubRoomNumber,
      'aplictStatus': instance.aplictStatus,
      'aplictUUID': instance.aplictUUID,
    };

_$CircleDetailListModelErrorImpl _$$CircleDetailListModelErrorImplFromJson(
        Map<String, dynamic> json) =>
    _$CircleDetailListModelErrorImpl(
      message: json['message'] as String,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$$CircleDetailListModelErrorImplToJson(
        _$CircleDetailListModelErrorImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
    };
