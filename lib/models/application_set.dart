import 'package:freezed_annotation/freezed_annotation.dart';

part 'application_set.freezed.dart';
part 'application_set.g.dart';

@freezed
class ApplicationSet with _$ApplicationSet {
  factory ApplicationSet({
    required String clubId,
    String? formId,
    String? title,
    String? description,
    required List<ApplicationQuestion> questions,
  }) = _ApplicationSet;

  factory ApplicationSet.fromJson(Map<String, dynamic> json) =>
      _$ApplicationSetFromJson(json);
}

enum QuestionType {
  @JsonValue('RADIO')
  radio,
  @JsonValue('CHECKBOX')
  checkbox,
  @JsonValue('DROPDOWN')
  dropdown,
  @JsonValue('SHORT_TEXT')
  shortText,
  @JsonValue('LONG_TEXT')
  longText,
}

@freezed
class ApplicationQuestion with _$ApplicationQuestion {
  factory ApplicationQuestion({
    required int questionId,
    required int sequence,
    required QuestionType type,
    @JsonKey(name: 'content') required String questionText,
    @Default(true) bool required,
    @Default([]) List<QuestionOption> options,
  }) = _ApplicationQuestion;

  factory ApplicationQuestion.fromJson(Map<String, dynamic> json) =>
      _$ApplicationQuestionFromJson(json);
}

@freezed
class QuestionOption with _$QuestionOption {
  factory QuestionOption({
    int? sequence,
    required String content,
    String? value,
    int? optionId,
  }) = _QuestionOption;

  factory QuestionOption.fromJson(Map<String, dynamic> json) =>
      _$QuestionOptionFromJson(json);
}

