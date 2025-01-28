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
      clubId: (json['clubId'] as num).toInt(),
      mainPhotoPath: json['mainPhotoPath'] as String?,
      clubName: json['clubName'] as String,
      leaderName: json['leaderName'] as String,
      leaderHp: json['leaderHp'] as String,
      clubInsta: json['clubInsta'] as String,
      circleRoom: json['circleRoom'] as String?,
      aplictStatus: json['aplictStatus'] as String?,
    );

Map<String, dynamic> _$$CircleImplToJson(_$CircleImpl instance) =>
    <String, dynamic>{
      'clubId': instance.clubId,
      'mainPhotoPath': instance.mainPhotoPath,
      'clubName': instance.clubName,
      'leaderName': instance.leaderName,
      'leaderHp': instance.leaderHp,
      'clubInsta': instance.clubInsta,
      'circleRoom': instance.circleRoom,
      'aplictStatus': instance.aplictStatus,
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
