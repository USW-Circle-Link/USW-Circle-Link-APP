// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'circle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CircleModel _$CircleModelFromJson(Map<String, dynamic> json) => CircleModel(
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      mainImage: json['mainImage'] as String,
      introduction: json['introduction'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$CircleModelToJson(CircleModel instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'mainImage': instance.mainImage,
      'introduction': instance.introduction,
      'tags': instance.tags,
    };
