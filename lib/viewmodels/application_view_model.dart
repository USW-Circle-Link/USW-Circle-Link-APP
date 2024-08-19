import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/models/application_model.dart';
import 'package:usw_circle_link/repositories/application_repository.dart';

final applicationViewModelProvider = StateNotifierProvider.autoDispose<
    ApplicationViewModel, ApplicationModelBase?>((ref) {
  final ApplicationRepository applicationRepository =
      ref.read(applicationRepositoryProvider);
  return ApplicationViewModel(applicationRepository: applicationRepository);
});

class ApplicationViewModel extends StateNotifier<ApplicationModelBase?> {
  final ApplicationRepository applicationRepository;
  ApplicationViewModel({required this.applicationRepository}) : super(null);

  Future<ApplicationModelBase> getApplication(int clubId) async {
    try {
      // 첫 state는 Loading 상태
      state = ApplicationModelLoading();

      final applicationResponse =
          await applicationRepository.getApplication(clubId: clubId);

      state = applicationResponse;
    } on ApplicationModelError catch (e) {
      state = e;
    } catch (e) {
      state = ApplicationModelError(
          message: '에외발생 - $e', type: ApplicationModelType.getApplication);
    }
    return Future.value(state);
  }

  Future<ApplicationModelBase> apply({
    required int clubId,
    required String aplictGoogleFormUrl,
  }) async {
    try {
      // 첫 state는 Loading 상태
      state = ApplicationModelLoading();

      final applicationResponse = await applicationRepository.apply(
          clubId: clubId, aplictGoogleFormUrl: aplictGoogleFormUrl);

      state = applicationResponse;

      return applicationResponse;
    } on ApplicationModelError catch (e) {
      state = e;
    } catch (e) {
      state = ApplicationModelError(message: '에외발생 - $e', type: ApplicationModelType.apply);
    }
    return Future.value(state);
  }
}
