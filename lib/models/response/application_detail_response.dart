import 'package:freezed_annotation/freezed_annotation.dart';

part 'application_detail_response.freezed.dart';
part 'application_detail_response.g.dart';

@freezed
class ApplicationDetailResponse with _$ApplicationDetailResponse {
  factory ApplicationDetailResponse({
    required String message,
    required List<ApplicationQuestionAnswer> data,
  }) = _ApplicationDetailResponse;

  factory ApplicationDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$ApplicationDetailResponseFromJson(json);
}

@freezed
class ApplicationQuestionAnswer with _$ApplicationQuestionAnswer {
  factory ApplicationQuestionAnswer({
    required String question,
    required String answer,
  }) = _ApplicationQuestionAnswer;

  factory ApplicationQuestionAnswer.fromJson(Map<String, dynamic> json) =>
      _$ApplicationQuestionAnswerFromJson(json);
}








