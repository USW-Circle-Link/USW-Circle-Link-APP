import 'package:freezed_annotation/freezed_annotation.dart';

part 'application_detail_response.freezed.dart';
part 'application_detail_response.g.dart';

@freezed
class ApplicationDetailResponse with _$ApplicationDetailResponse {
  ApplicationDetailResponse._();

  factory ApplicationDetailResponse({
    required String message,
    required List<ApplicationQuestionAnswer> data,
  }) = _ApplicationDetailResponse;

  factory ApplicationDetailResponse.fromJson(Map<String, dynamic> json) {
    // API 응답 구조: { "message": "...", "data": { "qnaList": [...] } }
    final dataField = json['data'];
    final qnaList = dataField is Map<String, dynamic>
        ? dataField['qnaList']
        : dataField is List
            ? dataField
            : null;
    
    final questionAnswerList = qnaList != null && qnaList is List
        ? (qnaList as List<dynamic>)
            .where((e) => e is Map<String, dynamic>)
            .map((e) {
              final qaJson = e as Map<String, dynamic>;
              return ApplicationQuestionAnswer(
                question: (qaJson['question'] as String?) ?? '',
                answer: qaJson['answer'] as String?,
                optionId: (qaJson['optionId'] as num?)?.toInt(),
              );
            })
            .toList()
        : <ApplicationQuestionAnswer>[];
    
    return ApplicationDetailResponse(
      message: json['message'] as String,
      data: questionAnswerList,
    );
  }
}

@freezed
class ApplicationQuestionAnswer with _$ApplicationQuestionAnswer {
  factory ApplicationQuestionAnswer({
    required String question,
    String? answer,
    int? optionId,
  }) = _ApplicationQuestionAnswer;

  factory ApplicationQuestionAnswer.fromJson(Map<String, dynamic> json) =>
      _$ApplicationQuestionAnswerFromJson(json);
}








