import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/const/analytics_const.dart';
import 'package:usw_circle_link/models/application_model.dart';
import 'package:usw_circle_link/repositories/application_repository.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';
import 'package:usw_circle_link/viewmodels/user_view_model.dart';

final applicationViewModelProvider = StateNotifierProvider.autoDispose<
    ApplicationViewModel, AsyncValue<ApplicationModel?>>((ref) {
  final ApplicationRepository applicationRepository =
      ref.read(applicationRepositoryProvider);
  return ApplicationViewModel(
    applicationRepository: applicationRepository,
    ref: ref,
  );
});

class ApplicationViewModel
    extends StateNotifier<AsyncValue<ApplicationModel?>> {
  final ApplicationRepository applicationRepository;
  final Ref ref;

  ApplicationViewModel({
    required this.applicationRepository,
    required this.ref,
  }) : super(AsyncData(null));

  Future<void> getApplication(String clubUUID) async {
    try {
      // 첫 state는 Loading 상태
      state = AsyncLoading();

      final applicationResponse =
          await applicationRepository.getApplication(clubUUID: clubUUID);

      state = AsyncData(applicationResponse);
    } on ApplicationModelError catch (e) {
      analytics.logEvent(
        name: AnalyticsEvent.error,
        parameters: {
          AnalyticsParam.errorType: 'ApplicationModelError',
          AnalyticsParam.errorCode: e.code ?? 'unknown',
          AnalyticsParam.errorMessage: e.message,
          AnalyticsParam.screen: 'Application_GetApplication',
          AnalyticsParam.timestamp: DateTime.now().toIso8601String(),
        },
      );
      state = AsyncError(e, e.stackTrace);
    } catch (e) {
      analytics.logEvent(
        name: AnalyticsEvent.error,
        parameters: {
          AnalyticsParam.errorType: e.runtimeType.toString(),
          AnalyticsParam.errorMessage: e.toString(),
          AnalyticsParam.screen: 'Application_GetApplication',
          AnalyticsParam.timestamp: DateTime.now().toIso8601String(),
        },
      );
      final error = ApplicationModelError(
          message: '에외발생 - $e', type: ApplicationModelType.getApplication);
      state = AsyncError(error, error.stackTrace);
    }
  }

  Future<void> apply({
    required String clubUUID,
  }) async {
    try {
      // 첫 state는 Loading 상태
      state = AsyncLoading();

      final applicationResponse =
          await applicationRepository.apply(clubUUID: clubUUID);

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

      state = AsyncData(applicationResponse);
    } on ApplicationModelError catch (e) {
      analytics.logEvent(
        name: AnalyticsEvent.error,
        parameters: {
          AnalyticsParam.errorType: 'ApplicationModelError',
          AnalyticsParam.errorCode: e.code ?? 'unknown',
          AnalyticsParam.errorMessage: e.message,
          AnalyticsParam.screen: 'Application_Apply',
          AnalyticsParam.timestamp: DateTime.now().toIso8601String(),
        },
      );
      state = AsyncError(e, e.stackTrace);
    } catch (e) {
      analytics.logEvent(
        name: AnalyticsEvent.error,
        parameters: {
          AnalyticsParam.errorType: e.runtimeType.toString(),
          AnalyticsParam.errorMessage: e.toString(),
          AnalyticsParam.screen: 'Application_Apply',
          AnalyticsParam.timestamp: DateTime.now().toIso8601String(),
        },
      );
      final error = ApplicationModelError(
          message: '에외발생 - $e', type: ApplicationModelType.apply);
      state = AsyncError(error, error.stackTrace);
    }
  }

  Future<void> checkAvailableForApplication({
    required String clubUUID,
  }) async {
    try {
      // 첫 state는 Loading 상태
      state = AsyncLoading();

      final applicationResponse =
          await applicationRepository.checkAvailableForApplication(
        clubUUID: clubUUID,
      );

      state = AsyncData(applicationResponse);
    } on ApplicationModelError catch (e) {
      state = AsyncError(e, e.stackTrace);
    } on DioException catch (e) {
      analytics.logEvent(
        name: AnalyticsEvent.error,
        parameters: {
          AnalyticsParam.errorType: 'DioException',
          AnalyticsParam.errorMessage: e.message ?? '',
          AnalyticsParam.screen: 'Application_CheckAvailable',
          AnalyticsParam.timestamp: DateTime.now().toIso8601String(),
        },
      );
      final error = ApplicationModelError(
          message: '에외발생 - $e',
          code: e.message == "저장소에 토큰이 존재하지 않습니다" ? 'USR-F401' : null,
          type: ApplicationModelType.checkAvailableForApplication);
      state = AsyncError(error, error.stackTrace);
    } catch (e) {
      analytics.logEvent(
        name: AnalyticsEvent.error,
        parameters: {
          AnalyticsParam.errorType: e.runtimeType.toString(),
          AnalyticsParam.errorMessage: e.toString(),
          AnalyticsParam.screen: 'Application_CheckAvailable',
          AnalyticsParam.timestamp: DateTime.now().toIso8601String(),
        },
      );
      final error = ApplicationModelError(
          message: '에외발생 - $e',
          type: ApplicationModelType.checkAvailableForApplication);
      state = AsyncError(error, error.stackTrace);
    }
  }
}
