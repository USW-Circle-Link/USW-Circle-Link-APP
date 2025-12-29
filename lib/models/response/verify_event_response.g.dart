// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_event_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VerifyEventResponseImpl _$$VerifyEventResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$VerifyEventResponseImpl(
      clubUUID: json['clubUUID'] as String,
      isFirstVerify: json['isFirstVerify'] as bool,
      verifiedAt: json['verified_at'] as String,
    );

Map<String, dynamic> _$$VerifyEventResponseImplToJson(
        _$VerifyEventResponseImpl instance) =>
    <String, dynamic>{
      'clubUUID': instance.clubUUID,
      'isFirstVerify': instance.isFirstVerify,
      'verified_at': instance.verifiedAt,
    };
