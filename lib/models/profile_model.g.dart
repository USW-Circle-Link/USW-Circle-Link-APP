// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileModelImpl _$$ProfileModelImplFromJson(Map<String, dynamic> json) =>
    _$ProfileModelImpl(
      message: json['message'] as String,
      data: ProfileData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ProfileModelImplToJson(_$ProfileModelImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data.toJson(),
    };

_$ProfileDataImpl _$$ProfileDataImplFromJson(Map<String, dynamic> json) =>
    _$ProfileDataImpl(
      userName: json['userName'] as String,
      studentNumber: json['studentNumber'] as String,
      userHp: json['userHp'] as String,
      major: json['major'] as String,
    );

Map<String, dynamic> _$$ProfileDataImplToJson(_$ProfileDataImpl instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'studentNumber': instance.studentNumber,
      'userHp': instance.userHp,
      'major': instance.major,
    };

_$ProfileModelErrorImpl _$$ProfileModelErrorImplFromJson(
        Map<String, dynamic> json) =>
    _$ProfileModelErrorImpl(
      message: json['message'] as String,
    );

Map<String, dynamic> _$$ProfileModelErrorImplToJson(
        _$ProfileModelErrorImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
    };