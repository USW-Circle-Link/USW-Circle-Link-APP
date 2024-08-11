// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SignUpModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignUpModelImpl _$$SignUpModelImplFromJson(Map<String, dynamic> json) =>
    _$SignUpModelImpl(
      type: $enumDecodeNullable(_$SignUpModelTypeEnumMap, json['type']),
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : SignUpData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SignUpModelImplToJson(_$SignUpModelImpl instance) =>
    <String, dynamic>{
      'type': _$SignUpModelTypeEnumMap[instance.type],
      'message': instance.message,
      'data': instance.data?.toJson(),
    };

const _$SignUpModelTypeEnumMap = {
  SignUpModelType.verify: 'verify',
  SignUpModelType.validatePasswordMatch: 'validatePasswordMatch',
};

_$SignUpDataImpl _$$SignUpDataImplFromJson(Map<String, dynamic> json) =>
    _$SignUpDataImpl(
      emailTokenId: json['emailTokenId'] as String,
      account: json['account'] as String,
    );

Map<String, dynamic> _$$SignUpDataImplToJson(_$SignUpDataImpl instance) =>
    <String, dynamic>{
      'emailTokenId': instance.emailTokenId,
      'account': instance.account,
    };

_$SignUpModelErrorImpl _$$SignUpModelErrorImplFromJson(
        Map<String, dynamic> json) =>
    _$SignUpModelErrorImpl(
      type: $enumDecodeNullable(_$SignUpModelTypeEnumMap, json['type']),
      exception: json['exception'] as String?,
      code: json['code'] as String?,
      error: json['error'] as String?,
      status: (json['status'] as num?)?.toInt(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$$SignUpModelErrorImplToJson(
        _$SignUpModelErrorImpl instance) =>
    <String, dynamic>{
      'type': _$SignUpModelTypeEnumMap[instance.type],
      'exception': instance.exception,
      'code': instance.code,
      'error': instance.error,
      'status': instance.status,
      'message': instance.message,
    };
