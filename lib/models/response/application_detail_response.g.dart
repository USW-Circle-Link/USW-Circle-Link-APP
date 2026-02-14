// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApplicationQuestionAnswerImpl _$$ApplicationQuestionAnswerImplFromJson(
        Map<String, dynamic> json) =>
    _$ApplicationQuestionAnswerImpl(
      question: json['question'] as String,
      answer: json['answer'] as String?,
      optionId: (json['optionId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ApplicationQuestionAnswerImplToJson(
        _$ApplicationQuestionAnswerImpl instance) =>
    <String, dynamic>{
      'question': instance.question,
      'answer': instance.answer,
      'optionId': instance.optionId,
    };
