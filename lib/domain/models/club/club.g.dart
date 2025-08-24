// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'club.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClubImpl _$$ClubImplFromJson(Map<String, dynamic> json) => _$ClubImpl(
      clubUUID: json['clubUUID'] as String,
      clubName: json['clubName'] as String,
      mainPhoto: json['mainPhoto'] as String,
      departmentName: json['departmentName'] as String,
      clubHashtags: (json['clubHashtags'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$ClubImplToJson(_$ClubImpl instance) =>
    <String, dynamic>{
      'clubUUID': instance.clubUUID,
      'clubName': instance.clubName,
      'mainPhoto': instance.mainPhoto,
      'departmentName': instance.departmentName,
      'clubHashtags': instance.clubHashtags,
    };
