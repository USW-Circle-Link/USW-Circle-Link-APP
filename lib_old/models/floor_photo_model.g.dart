// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'floor_photo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FloorPhotoModelImpl _$$FloorPhotoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FloorPhotoModelImpl(
      message: json['message'] as String,
      data: FloorPhotoData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FloorPhotoModelImplToJson(
        _$FloorPhotoModelImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data.toJson(),
    };

_$FloorPhotoDataImpl _$$FloorPhotoDataImplFromJson(Map<String, dynamic> json) =>
    _$FloorPhotoDataImpl(
      roomFloor: json['roomFloor'] as String,
      floorPhotoPath: json['floorPhotoPath'] as String,
    );

Map<String, dynamic> _$$FloorPhotoDataImplToJson(
        _$FloorPhotoDataImpl instance) =>
    <String, dynamic>{
      'roomFloor': instance.roomFloor,
      'floorPhotoPath': instance.floorPhotoPath,
    };

_$FloorPhotoModelErrorImpl _$$FloorPhotoModelErrorImplFromJson(
        Map<String, dynamic> json) =>
    _$FloorPhotoModelErrorImpl(
      message: json['message'] as String,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$$FloorPhotoModelErrorImplToJson(
        _$FloorPhotoModelErrorImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
    };
