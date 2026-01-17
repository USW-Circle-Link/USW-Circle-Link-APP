import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/const/analytics_const.dart';
import 'package:usw_circle_link/models/application_answer.dart';
import 'package:usw_circle_link/models/application_set.dart';
import 'package:usw_circle_link/repositories/application_repository.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';
import 'package:usw_circle_link/viewmodels/user_view_model.dart';

import '../models/response/global_exception.dart';
import '../utils/error_util.dart';
import '../utils/result.dart';
import 'state/application_state.dart';

final applicationViewModelProvider =
    StateNotifierProvider.autoDispose<ApplicationViewModel, ApplicationState>(
        (ref) {
  final ApplicationRepository applicationRepository =
      ref.read(applicationRepositoryProvider);
  return ApplicationViewModel(
    applicationRepository: applicationRepository,
    ref: ref,
  );
});

class ApplicationViewModel extends StateNotifier<ApplicationState> {
  final ApplicationRepository applicationRepository;
  final Ref ref;

  ApplicationViewModel({
    required this.applicationRepository,
    required this.ref,
  }) : super(ApplicationState());

  Future<void> getApplication(String clubUUID) async {
    state = state.copyWith(
      isLoading: true,
      error: null,
      applicationSet: null,
      answers: {},
    );

    final result =
        await applicationRepository.getApplication(clubUUID: clubUUID);

    switch (result) {
      case Ok():
        state = state.copyWith(
          isLoading: false,
          applicationSet: result.value,
        );
      case Error():
        var exception = result.error;
        if (exception is GlobalException) {
          state = state.copyWith(
            isLoading: false,
            error: ErrorUtil.instance.getErrorMessage(exception.code) ??
                '지원서 조회 중 문제가 발생했습니다. 잠시 후 다시 시도해주세요.',
          );
          return;
        }
        exception =
            exception.toGlobalException(screen: 'Application_GetApplication');
        await ErrorUtil.instance.logError(exception);
        state = state.copyWith(
          isLoading: false,
          error: ErrorUtil.instance.getErrorMessage(exception.code) ??
              '지원서 조회 중 문제가 발생했습니다. 잠시 후 다시 시도해주세요.',
        );
        break;
    }
  }

  void updateAnswer({
    required int questionId,
    int? optionId,
    String? answerText,
  }) {
    final updatedAnswers = Map<int, ApplicationAnswer>.from(state.answers);
    updatedAnswers[questionId] = ApplicationAnswer(
      questionId: questionId,
      optionId: optionId,
      answerText: answerText,
    );
    state = state.copyWith(answers: updatedAnswers);
  }

  bool isFormValid() {
    if (state.applicationSet == null) return false;
    final requiredQuestions = state.applicationSet!.questions
        .where((q) => q.required)
        .toList();
    for (var question in requiredQuestions) {
      final answer = state.answers[question.questionId];
      if (answer == null) {
        return false;
      }
      final hasOptionAnswer = answer.optionId != null;
      final hasTextAnswer = answer.answerText != null && answer.answerText!.trim().isNotEmpty;
      if (!hasOptionAnswer && !hasTextAnswer) {
        return false;
      }
    }
    return true;
  }

  Future<void> apply({
    required String clubUUID,
  }) async {
    if (!isFormValid()) {
      state = state.copyWith(
        error: '모든 필수 질문에 답변해주세요.',
      );
      return;
    }

    if (state.applicationSet == null || state.applicationSet!.formId == null) {
      state = state.copyWith(
        error: '지원서 정보를 불러올 수 없습니다.',
      );
      return;
    }

    state = state.copyWith(
      isLoading: true,
      error: null,
      applySuccess: false,
    );

    final canApplyResult = await applicationRepository
        .checkAvailableForApplication(clubUUID: clubUUID);
    switch (canApplyResult) {
      case Ok():
        if (!canApplyResult.value) {
          state = state.copyWith(
            isLoading: false,
            applySuccess: false,
            error: '현재 지원 가능한 기간이 아닙니다.',
          );
          return;
        }
        break;
      case Error():
        var error = canApplyResult.error;
        if (error is GlobalException) {
          state = state.copyWith(
            isLoading: false,
            error: ErrorUtil.instance.getErrorMessage(error.code) ??
                '동아리 지원 중 문제가 발생했습니다. 잠시 후 다시 시도해주세요.',
          );
          return;
        }
        break;
    }

    final answersList = <Map<String, dynamic>>[];
    for (var question in state.applicationSet!.questions) {
      final answer = state.answers[question.questionId];
      if (answer != null) {
        if (question.type == QuestionType.checkbox && answer.answerText != null) {
          final selectedValues = answer.answerText!.split(', ');
          for (var value in selectedValues) {
            final option = question.options.firstWhere(
              (opt) => opt.value == value,
              orElse: () => question.options.first,
            );
            answersList.add({
              'questionId': question.questionId,
              'optionId': option.optionId,
              'answerText': null,
            });
          }
        } else {
          answersList.add({
            'questionId': answer.questionId,
            'optionId': answer.optionId,
            'answerText': answer.answerText,
          });
        }
      }
    }

    final result = await applicationRepository.apply(
      clubUUID: clubUUID,
      formId: state.applicationSet!.formId!,
      answers: answersList,
    );

    switch (result) {
      case Ok():
        // Firebase Analytics: 동아리 지원 성공
        final userState = ref.read(userViewModelProvider).state;
        analytics.logEvent(
          name: AnalyticsEvent.clubApply,
          parameters: {
            AnalyticsParam.clubUUID: clubUUID,
            AnalyticsParam.studentNumber: userState.studentNumber ?? '',
            AnalyticsParam.userName: userState.userName ?? '',
            AnalyticsParam.major: userState.major ?? '',
            AnalyticsParam.userHp: userState.userHp ?? '',
            AnalyticsParam.timestamp: DateTime.now().toIso8601String(),
          },
        );

        state = state.copyWith(
          isLoading: false,
          applySuccess: true,
        );
        break;
      case Error():
        var error = result.error;
        if (error is GlobalException) {
          state = state.copyWith(
            isLoading: false,
            error: ErrorUtil.instance.getErrorMessage(error.code) ??
                '동아리 지원 중 문제가 발생했습니다. 잠시 후 다시 시도해주세요.',
          );
          return;
        }
        final exception = error.toGlobalException(screen: 'Application_Apply');
        await ErrorUtil.instance.logError(exception);
        state = state.copyWith(
          isLoading: false,
          error: ErrorUtil.instance.getErrorMessage(exception.code) ??
              '동아리 지원 중 문제가 발생했습니다. 잠시 후 다시 시도해주세요.',
        );
        break;
    }
  }
}
