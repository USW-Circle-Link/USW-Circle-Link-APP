// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      message: json['message'] as String,
      data: LoginData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data.toJson(),
    };

_$LoginDataImpl _$$LoginDataImplFromJson(Map<String, dynamic> json) =>
    _$LoginDataImpl(
      accessToken: json['accessToken'] as String,
      clubIds:
          (json['clubIds'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$LoginDataImplToJson(_$LoginDataImpl instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'clubIds': instance.clubIds,
    };

_$UserModelErrorImpl _$$UserModelErrorImplFromJson(Map<String, dynamic> json) =>
    _$UserModelErrorImpl(
      message: json['message'] as String,
      code: json['code'] as String?,
      exception: json['exception'] as String?,
      error: json['error'] as String?,
      status: (json['status'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$UserModelErrorImplToJson(
        _$UserModelErrorImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'exception': instance.exception,
      'error': instance.error,
      'status': instance.status,
    };
