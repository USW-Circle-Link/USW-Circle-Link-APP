import 'package:freezed_annotation/freezed_annotation.dart';

part 'application_answer.freezed.dart';
part 'application_answer.g.dart';

@freezed
class ApplicationAnswer with _$ApplicationAnswer {
  factory ApplicationAnswer({
    required int questionId,
    int? optionId,
    String? answerText,
  }) = _ApplicationAnswer;

  factory ApplicationAnswer.fromJson(Map<String, dynamic> json) =>
      _$ApplicationAnswerFromJson(json);
}

