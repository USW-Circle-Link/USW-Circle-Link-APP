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

  Future<void> getApplication(int clubId) async {
    try {
      // 첫 state는 Loading 상태
      state = AsyncLoading();

      final applicationResponse =
          await applicationRepository.getApplication(clubId: clubId);

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
    required int clubId,
    required String aplictGoogleFormUrl,
  }) async {
    try {
      // 첫 state는 Loading 상태
      state = AsyncLoading();

      final applicationResponse = await applicationRepository.apply(
          clubId: clubId, aplictGoogleFormUrl: aplictGoogleFormUrl);

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
    required int clubId,
  }) async {
    try {
      // 첫 state는 Loading 상태
      state = AsyncLoading();

      final applicationResponse =
          await applicationRepository.checkAvailableForApplication(
        clubId: clubId,
      );

      state = AsyncData(applicationResponse);
    } on ApplicationModelError catch (e) {
      state = AsyncError(e, e.stackTrace);
    } catch (e) {
      final error = ApplicationModelError(
          message: '에외발생 - $e',
          type: ApplicationModelType.checkAvailableForApplication);
      state = AsyncError(error, error.stackTrace);
    }
  }
}
