import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/const/analytics_const.dart';
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
    // 첫 state는 Loading 상태
    state = state.copyWith(
      isLoading: true,
      applicationUrl: null,
      error: null,
    );

    final result =
        await applicationRepository.getApplication(clubUUID: clubUUID);

    switch (result) {
      case Ok():
        state = state.copyWith(
          isLoading: false,
          applicationUrl: result.value,
        );
      case Error():
        var exception = result.error;
        if (exception is GlobalException) {
          state = state.copyWith(
            isLoading: false,
            error: ErrorUtil.instance.getErrorMessage(exception.code) ??
                '지원서 조회 중 문제가 발생했습니다. 잠시 후 다시 시도해주세요.',
          );
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

  Future<void> apply({
    required String clubUUID,
  }) async {
    // 첫 state는 Loading 상태
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
            applySuccess: true,
            error: '이미 지원한 동아리 입니다.',
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

    final result = await applicationRepository.apply(clubUUID: clubUUID);

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
