// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeleteUserModelImpl _$$DeleteUserModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DeleteUserModelImpl(
      message: json['message'] as String,
      type: $enumDecodeNullable(_$DeleteUserModelTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$DeleteUserModelImplToJson(
        _$DeleteUserModelImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'type': _$DeleteUserModelTypeEnumMap[instance.type],
    };

const _$DeleteUserModelTypeEnumMap = {
  DeleteUserModelType.sendCode: 'sendCode',
  DeleteUserModelType.verifyCode: 'verifyCode',
};

_$DeleteUserModelErrorImpl _$$DeleteUserModelErrorImplFromJson(
        Map<String, dynamic> json) =>
    _$DeleteUserModelErrorImpl(
      message: json['message'] as String,
      exception: json['exception'] as String?,
      code: json['code'] as String?,
      status: (json['status'] as num?)?.toInt(),
      error: json['error'] as String?,
      type: $enumDecodeNullable(_$DeleteUserModelTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$DeleteUserModelErrorImplToJson(
        _$DeleteUserModelErrorImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'exception': instance.exception,
      'code': instance.code,
      'status': instance.status,
      'error': instance.error,
      'type': _$DeleteUserModelTypeEnumMap[instance.type],
    };
