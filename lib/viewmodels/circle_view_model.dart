import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repositories/circle_repository.dart';
import '../models/response/global_exception.dart';
import '../repositories/application_repository.dart';
import '../utils/error_util.dart';
import '../utils/result.dart';
import 'state/circle_state.dart';

final clubIntroViewModelProvider = StateNotifierProvider.autoDispose
    .family<CircleViewModel, CircleState, String>((ref, clubUUID) {
  final circleRepository = ref.read(circleRepositoryProvider);
  final applicationRepository = ref.read(applicationRepositoryProvider);
  return CircleViewModel(circleRepository, applicationRepository, clubUUID);
});

class CircleViewModel extends StateNotifier<CircleState> {
  final CircleRepository circleRepository;
  final ApplicationRepository applicationRepository;

  CircleViewModel(
      this.circleRepository, this.applicationRepository, String clubUUID)
      : super(CircleState()) {
    fetchClubIntro(clubUUID);
  }

  Future<void> fetchClubIntro(String clubUUID) async {
    state = state.copyWith(
      isLoading: true,
      error: null,
    );
    final result = await circleRepository.fetchClubIntro(clubUUID);
    switch (result) {
      case Ok():
        state = state.copyWith(
          isLoading: false,
          circleDetail: result.value,
        );
      case Error():
        var exception = result.error;
        if (exception is GlobalException) {
          state = state.copyWith(
            isLoading: false,
            error: ErrorUtil.instance.getErrorMessage(exception.code) ??
                '동아리 정보 조회 중 문제가 발생했습니다. 잠시 후 다시 시도해주세요.',
          );
        }
        exception =
            exception.toGlobalException(screen: 'Circle_FetchClubIntro');
        await ErrorUtil.instance.logError(exception);
        state = state.copyWith(
          isLoading: false,
          error: ErrorUtil.instance.getErrorMessage(exception.code) ??
              '동아리 정보 조회 중 문제가 발생했습니다. 잠시 후 다시 시도해주세요.',
        );
    }
  }

  Future<void> checkAvailableForApplication({
    required String clubUUID,
  }) async {
    // 첫 state는 Loading 상태
    state = state.copyWith(
      isLoading: true,
      error: null,
      canApply: null,
    );

    final result = await applicationRepository.checkAvailableForApplication(
      clubUUID: clubUUID,
    );

    switch (result) {
      case Ok():
        state = state.copyWith(
          isLoading: false,
          canApply: result.value,
        );
      case Error():
        var exception = result.error;
        if (exception is GlobalException) {
          state = state.copyWith(
            isLoading: false,
            error: ErrorUtil.instance.getErrorMessage(exception.code) ??
                '동아리 지원 가능 여부 조회 중 문제가 발생했습니다. 잠시 후 다시 시도해주세요.',
          );
        }
        exception = exception.toGlobalException(
            screen: 'Circle_CheckAvailableForApplication');
        await ErrorUtil.instance.logError(exception);
        state = state.copyWith(
          isLoading: false,
          error: ErrorUtil.instance.getErrorMessage(exception.code) ??
              '동아리 지원 가능 여부 조회 중 문제가 발생했습니다. 잠시 후 다시 시도해주세요.',
        );
    }
  }
}
