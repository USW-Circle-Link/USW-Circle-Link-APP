import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/models/application_model.dart';
import 'package:usw_circle_link/repositories/application_repository.dart';

final applicationViewModelProvider = StateNotifierProvider.autoDispose<
    ApplicationViewModel, AsyncValue<ApplicationModel?>>((ref) {
  final ApplicationRepository applicationRepository =
      ref.read(applicationRepositoryProvider);
  return ApplicationViewModel(applicationRepository: applicationRepository);
});

class ApplicationViewModel
    extends StateNotifier<AsyncValue<ApplicationModel?>> {
  final ApplicationRepository applicationRepository;
  ApplicationViewModel({required this.applicationRepository})
      : super(AsyncData(null));

  Future<void> getApplication(String clubUUID) async {
    try {
      // 첫 state는 Loading 상태
      state = AsyncLoading();

      final applicationResponse =
          await applicationRepository.getApplication(clubUUID: clubUUID);

      state = AsyncData(applicationResponse);
    } on ApplicationModelError catch (e) {
      state = AsyncError(e, e.stackTrace);
    } catch (e) {
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

      state = AsyncData(applicationResponse);
    } on ApplicationModelError catch (e) {
      state = AsyncError(e, e.stackTrace);
    } catch (e) {
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
      final error = ApplicationModelError(
          message: '에외발생 - $e',
          code: e.message == "저장소에 토큰이 존재하지 않습니다" ? 'USR-F401' : null,
          type: ApplicationModelType.checkAvailableForApplication);
      state = AsyncError(error, error.stackTrace);
    } catch (e) {
      final error = ApplicationModelError(
          message: '에외발생 - $e',
          type: ApplicationModelType.checkAvailableForApplication);
      state = AsyncError(error, error.stackTrace);
    }
  }
}
