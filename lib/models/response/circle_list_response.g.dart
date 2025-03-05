// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'circle_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CircleListResponseImpl _$$CircleListResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CircleListResponseImpl(
      message: json['message'] as String,
      clubs: (json['data'] as List<dynamic>)
          .map((e) => Club.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CircleListResponseImplToJson(
        _$CircleListResponseImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.clubs.map((e) => e.toJson()).toList(),
    };

_$ClubImpl _$$ClubImplFromJson(Map<String, dynamic> json) => _$ClubImpl(
      clubUuid: json['clubUUID'] as String,
      clubName: json['clubName'] as String,
      mainPhoto: json['mainPhoto'] as String?,
    );

Map<String, dynamic> _$$ClubImplToJson(_$ClubImpl instance) =>
    <String, dynamic>{
      'clubUUID': instance.clubUuid,
      'clubName': instance.clubName,
      'mainPhoto': instance.mainPhoto,
    };
