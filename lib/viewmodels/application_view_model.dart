import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/const/analytics_const.dart';
import 'package:usw_circle_link/models/application_answer.dart';
import 'package:usw_circle_link/models/application_set.dart';
import 'package:usw_circle_link/repositories/application_repository.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';
import 'package:usw_circle_link/viewmodels/user_view_model.dart';

import '../models/response/global_exception.dart';
import '../utils/command.dart';
import '../utils/error_util.dart';
import '../utils/result.dart';

final applicationViewModelProvider =
    ChangeNotifierProvider.autoDispose<ApplicationViewModel>((ref) {
  final ApplicationRepository applicationRepository =
      ref.read(applicationRepositoryProvider);
  return ApplicationViewModel(
    applicationRepository: applicationRepository,
    ref: ref,
  );
});

/// ApplicationViewModel
///
/// Command 패턴으로 비동기 작업 관리
/// - getApplication: 지원서 양식 조회
/// - apply: 지원서 제출
class ApplicationViewModel extends ChangeNotifier {
  final ApplicationRepository applicationRepository;
  final Ref ref;

  ApplicationViewModel({
    required this.applicationRepository,
    required this.ref,
  }) {
    getApplicationCommand = Command1(_getApplication);
    applyCommand = Command1(_apply);
  }

  // Commands
  late final Command1<ApplicationSet, String> getApplicationCommand;
  late final Command1<void, String> applyCommand;

  // State
  ApplicationSet? _applicationSet;
  Map<int, ApplicationAnswer> _answers = {};
  bool _applySuccess = false;
  String? _error;

  // Getters
  ApplicationSet? get applicationSet => _applicationSet;
  Map<int, ApplicationAnswer> get answers => _answers;
  bool get applySuccess => _applySuccess;
  String? get error => _error;
  bool get isLoading =>
      getApplicationCommand.running || applyCommand.running;

  /// 지원서 양식 조회
  void getApplication(String clubUUID) {
    _applicationSet = null;
    _answers = {};
    _error = null;
    _applySuccess = false;
    notifyListeners();
    getApplicationCommand.execute(clubUUID);
  }

  Future<Result<ApplicationSet>> _getApplication(String clubUUID) async {
    try {
      final result =
          await applicationRepository.getApplication(clubUUID: clubUUID);

      switch (result) {
        case Ok(:final value):
          _applicationSet = value;
          notifyListeners();
          return Result.ok(value);
        case Error(:final error):
          if (error is GlobalException) {
            _error = ErrorUtil.instance.getErrorMessage(error.code) ??
                '지원서 조회 중 문제가 발생했습니다. 잠시 후 다시 시도해주세요.';
          } else {
            final exception = error.toGlobalException(
                screen: 'Application_GetApplication');
            await ErrorUtil.instance.logError(exception);
            _error = ErrorUtil.instance.getErrorMessage(exception.code) ??
                '지원서 조회 중 문제가 발생했습니다. 잠시 후 다시 시도해주세요.';
          }
          notifyListeners();
          return Result.error(error);
      }
    } catch (e) {
      _error = '지원서 조회 중 문제가 발생했습니다. 잠시 후 다시 시도해주세요.';
      notifyListeners();
      return Result.error(Exception('$e'));
    }
  }

  void updateAnswer({
    required int questionId,
    int? optionId,
    String? answerText,
  }) {
    final updatedAnswers = Map<int, ApplicationAnswer>.from(_answers);
    updatedAnswers[questionId] = ApplicationAnswer(
      questionId: questionId,
      optionId: optionId,
      answerText: answerText,
    );
    _answers = updatedAnswers;
    notifyListeners();
  }

  bool isFormValid() {
    if (_applicationSet == null) return false;
    final requiredQuestions =
        _applicationSet!.questions.where((q) => q.required).toList();
    for (var question in requiredQuestions) {
      final answer = _answers[question.questionId];
      if (answer == null) {
        return false;
      }
      final hasOptionAnswer = answer.optionId != null;
      final hasTextAnswer =
          answer.answerText != null && answer.answerText!.trim().isNotEmpty;
      if (!hasOptionAnswer && !hasTextAnswer) {
        return false;
      }
    }
    return true;
  }

  /// 지원서 제출
  Future<void> apply({required String clubUUID}) async {
    _error = null;
    _applySuccess = false;
    notifyListeners();
    await applyCommand.execute(clubUUID);
  }

  Future<Result<void>> _apply(String clubUUID) async {
    try {
      if (!isFormValid()) {
        _error = '모든 필수 질문에 답변해주세요.';
        notifyListeners();
        return Result.error(Exception(_error!));
      }

      if (_applicationSet == null || _applicationSet!.formId == null) {
        _error = '지원서 정보를 불러올 수 없습니다.';
        notifyListeners();
        return Result.error(Exception(_error!));
      }

      // 지원 가능 여부 확인
      final canApplyResult = await applicationRepository
          .checkAvailableForApplication(clubUUID: clubUUID);
      switch (canApplyResult) {
        case Ok(:final value):
          if (!value) {
            _error = '현재 지원 가능한 기간이 아닙니다.';
            notifyListeners();
            return Result.error(Exception(_error!));
          }
        case Error(:final error):
          if (error is GlobalException) {
            _error = ErrorUtil.instance.getErrorMessage(error.code) ??
                '동아리 지원 중 문제가 발생했습니다. 잠시 후 다시 시도해주세요.';
            notifyListeners();
            return Result.error(error);
          }
      }

      // 답변 데이터 구성
      final answersList = <Map<String, dynamic>>[];
      for (var question in _applicationSet!.questions) {
        final answer = _answers[question.questionId];
        if (answer != null) {
          if (question.type == QuestionType.checkbox &&
              answer.answerText != null) {
            final selectedOptionIds = answer.answerText!
                .split(', ')
                .map((idStr) => int.tryParse(idStr))
                .where((id) => id != null)
                .cast<int>();
            for (var optionId in selectedOptionIds) {
              answersList.add({
                'questionId': question.questionId,
                'optionId': optionId,
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

      // 제출
      final result = await applicationRepository.apply(
        clubUUID: clubUUID,
        formId: _applicationSet!.formId!,
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

          _applySuccess = true;
          notifyListeners();
          return Result.ok(null);

        case Error(:final error):
          if (error is GlobalException) {
            _error = ErrorUtil.instance.getErrorMessage(error.code) ??
                '동아리 지원 중 문제가 발생했습니다. 잠시 후 다시 시도해주세요.';
          } else {
            final exception =
                error.toGlobalException(screen: 'Application_Apply');
            await ErrorUtil.instance.logError(exception);
            _error = ErrorUtil.instance.getErrorMessage(exception.code) ??
                '동아리 지원 중 문제가 발생했습니다. 잠시 후 다시 시도해주세요.';
          }
          notifyListeners();
          return Result.error(error);
      }
    } catch (e) {
      _error = '동아리 지원 중 문제가 발생했습니다. 잠시 후 다시 시도해주세요.';
      notifyListeners();
      return Result.error(Exception('$e'));
    }
  }
}
