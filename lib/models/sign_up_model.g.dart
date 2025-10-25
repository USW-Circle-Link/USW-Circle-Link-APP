// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignUpModelImpl _$$SignUpModelImplFromJson(Map<String, dynamic> json) =>
    _$SignUpModelImpl(
      type: $enumDecodeNullable(_$SignUpModelTypeEnumMap, json['type']),
      message: json['message'] as String,
      data: json['data'] as String?,
    );

Map<String, dynamic> _$$SignUpModelImplToJson(_$SignUpModelImpl instance) =>
    <String, dynamic>{
      'type': _$SignUpModelTypeEnumMap[instance.type],
      'message': instance.message,
      'data': instance.data,
    };

const _$SignUpModelTypeEnumMap = {
  SignUpModelType.verify: 'verify',
  SignUpModelType.validatePasswordMatch: 'validatePasswordMatch',
  SignUpModelType.signUpExistingMember: 'signUpExistingMember',
  SignUpModelType.checkProfileIsExist: 'checkProfileIsExist',
};
