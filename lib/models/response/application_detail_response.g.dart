// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApplicationDetailResponseImpl _$$ApplicationDetailResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ApplicationDetailResponseImpl(
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) =>
              ApplicationQuestionAnswer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ApplicationDetailResponseImplToJson(
        _$ApplicationDetailResponseImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

_$ApplicationQuestionAnswerImpl _$$ApplicationQuestionAnswerImplFromJson(
        Map<String, dynamic> json) =>
    _$ApplicationQuestionAnswerImpl(
      question: json['question'] as String,
      answer: json['answer'] as String,
    );

Map<String, dynamic> _$$ApplicationQuestionAnswerImplToJson(
        _$ApplicationQuestionAnswerImpl instance) =>
    <String, dynamic>{
      'question': instance.question,
      'answer': instance.answer,
    };
