import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/models/notice_detail_model.dart';
import 'package:usw_circle_link/repositories/notice_repository.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';
import 'package:usw_circle_link/utils/result.dart';

final noticeDetailViewModelProvider = StateNotifierProvider.autoDispose<
    NoticeDetailViewModel, NoticeDetailModelBase?>((ref) {
  final noticeRepository = ref.watch(noticeRepositoryProvider);

  return NoticeDetailViewModel(
    noticeRepository: noticeRepository,
  );
});

class NoticeDetailViewModel extends StateNotifier<NoticeDetailModelBase?> {
  final NoticeRepository noticeRepository;

  NoticeDetailViewModel({
    required this.noticeRepository,
  }) : super(null);

  Future<void> getDetail({
    required String noticeUUID,
  }) async {
    state = NoticeDetailLoading();
    final result = await noticeRepository.getDetail(noticeUUID: noticeUUID);
    switch (result) {
      case Ok(:final value):
        state = value;
      case Error(:final error):
        if (error is NoticeDetailModelError) {
          logger.d(error);
          state = error;
        } else {
          logger.e('예외발생 - $error');
          final detailError = NoticeDetailModelError(
            message: '예외발생 - $error',
            type: NoticeDetailModelType.getDetail,
          );
          state = detailError;
        }
    }
  }
}
