// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApplicationSetImpl _$$ApplicationSetImplFromJson(Map<String, dynamic> json) =>
    _$ApplicationSetImpl(
      clubId: json['clubId'] as String,
      formId: json['formId'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      questions: (json['questions'] as List<dynamic>)
          .map((e) => ApplicationQuestion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ApplicationSetImplToJson(
        _$ApplicationSetImpl instance) =>
    <String, dynamic>{
      'clubId': instance.clubId,
      'formId': instance.formId,
      'title': instance.title,
      'description': instance.description,
      'questions': instance.questions,
    };

_$ApplicationQuestionImpl _$$ApplicationQuestionImplFromJson(
        Map<String, dynamic> json) =>
    _$ApplicationQuestionImpl(
      questionId: (json['questionId'] as num).toInt(),
      sequence: (json['sequence'] as num).toInt(),
      type: $enumDecode(_$QuestionTypeEnumMap, json['type']),
      questionText: json['content'] as String,
      required: json['required'] as bool? ?? true,
      options: (json['options'] as List<dynamic>?)
              ?.map((e) => QuestionOption.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ApplicationQuestionImplToJson(
        _$ApplicationQuestionImpl instance) =>
    <String, dynamic>{
      'questionId': instance.questionId,
      'sequence': instance.sequence,
      'type': _$QuestionTypeEnumMap[instance.type]!,
      'content': instance.questionText,
      'required': instance.required,
      'options': instance.options,
    };

const _$QuestionTypeEnumMap = {
  QuestionType.radio: 'RADIO',
  QuestionType.checkbox: 'CHECKBOX',
  QuestionType.dropdown: 'DROPDOWN',
  QuestionType.shortText: 'SHORT_TEXT',
  QuestionType.longText: 'LONG_TEXT',
};

_$QuestionOptionImpl _$$QuestionOptionImplFromJson(Map<String, dynamic> json) =>
    _$QuestionOptionImpl(
      sequence: (json['sequence'] as num?)?.toInt(),
      content: json['content'] as String,
      value: json['value'] as String?,
      optionId: (json['optionId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$QuestionOptionImplToJson(
        _$QuestionOptionImpl instance) =>
    <String, dynamic>{
      'sequence': instance.sequence,
      'content': instance.content,
      'value': instance.value,
      'optionId': instance.optionId,
    };
