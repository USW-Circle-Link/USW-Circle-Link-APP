import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/models/application_set.dart';
import 'package:usw_circle_link/models/response/application_detail_response.dart';
import 'package:usw_circle_link/repositories/application_repository.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';

import '../models/response/global_exception.dart';
import '../utils/error_util.dart';
import '../utils/result.dart';

final applicationDetailViewModelProvider = StateNotifierProvider.autoDispose
    .family<ApplicationDetailViewModel, AsyncValue<ApplicationDetailData?>, ApplicationDetailParams>(
        (ref, params) {
  final applicationRepository = ref.read(applicationRepositoryProvider);
  return ApplicationDetailViewModel(
    applicationRepository: applicationRepository,
    params: params,
  );
});

class ApplicationDetailParams {
  final String clubUUID;
  final String aplictId;

  ApplicationDetailParams({
    required this.clubUUID,
    required this.aplictId,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ApplicationDetailParams &&
          runtimeType == other.runtimeType &&
          clubUUID == other.clubUUID &&
          aplictId == other.aplictId;

  @override
  int get hashCode => clubUUID.hashCode ^ aplictId.hashCode;
}

class ApplicationDetailData {
  final ApplicationDetailResponse detailResponse;
  final ApplicationSet? applicationSet;

  ApplicationDetailData({
    required this.detailResponse,
    this.applicationSet,
  });
}

class ApplicationDetailViewModel
    extends StateNotifier<AsyncValue<ApplicationDetailData?>> {
  final ApplicationRepository applicationRepository;
  final ApplicationDetailParams params;

  ApplicationDetailViewModel({
    required this.applicationRepository,
    required this.params,
  }) : super(const AsyncValue.loading()) {
    Future.sync(() async {
      await fetchApplicationDetail();
    });
  }

  Future<void> fetchApplicationDetail() async {
    try {
      state = const AsyncValue.loading();
      
      // 지원서 상세 조회와 지원서 작성 정보를 동시에 가져오기
      final detailResult = await applicationRepository.getApplicationDetail(
        clubUUID: params.clubUUID,
        aplictId: params.aplictId,
      );

      ApplicationSet? applicationSet;
      final applicationResult = await applicationRepository.getApplication(
        clubUUID: params.clubUUID,
      );
      if (applicationResult case Ok()) {
        applicationSet = applicationResult.value;
      }

      switch (detailResult) {
        case Ok():
          state = AsyncValue.data(ApplicationDetailData(
            detailResponse: detailResult.value,
            applicationSet: applicationSet,
          ));
        case Error():
          var exception = detailResult.error;
          if (exception is GlobalException) {
            final errorMessage = ErrorUtil.instance.getErrorMessage(exception.code) ??
                '지원서 조회 중 문제가 발생했습니다. 잠시 후 다시 시도해주세요.';
            state = AsyncValue.error(
              Exception(errorMessage),
              StackTrace.current,
            );
            return;
          }
          exception = exception.toGlobalException(
              screen: 'ApplicationDetail_FetchApplicationDetail');
          await ErrorUtil.instance.logError(exception);
          final errorMessage = ErrorUtil.instance.getErrorMessage(exception.code) ??
              '지원서 조회 중 문제가 발생했습니다. 잠시 후 다시 시도해주세요.';
          state = AsyncValue.error(
            Exception(errorMessage),
            StackTrace.current,
          );
      }
    } catch (e) {
      logger.e('예외발생 - $e');
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
