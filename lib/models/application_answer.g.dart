// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApplicationAnswerImpl _$$ApplicationAnswerImplFromJson(
        Map<String, dynamic> json) =>
    _$ApplicationAnswerImpl(
      questionId: (json['questionId'] as num).toInt(),
      optionId: (json['optionId'] as num?)?.toInt(),
      answerText: json['answerText'] as String?,
    );

Map<String, dynamic> _$$ApplicationAnswerImplToJson(
        _$ApplicationAnswerImpl instance) =>
    <String, dynamic>{
      'questionId': instance.questionId,
      'optionId': instance.optionId,
      'answerText': instance.answerText,
    };
