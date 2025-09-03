// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_pw_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChangePwModelImpl _$$ChangePwModelImplFromJson(Map<String, dynamic> json) =>
    _$ChangePwModelImpl(
      message: json['message'] as String,
      type: $enumDecode(_$ChangePwTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$ChangePwModelImplToJson(_$ChangePwModelImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'type': _$ChangePwTypeEnumMap[instance.type]!,
    };

const _$ChangePwTypeEnumMap = {
  ChangePwType.changePW: 'changePW',
  ChangePwType.resetPW: 'resetPW',
};
