import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/models/notice_detail_model.dart';
import 'package:usw_circle_link/repositories/notice_repository.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';

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
    try {
      state = NoticeDetailLoading();
      final response = await noticeRepository.getDetail(
        noticeUUID: noticeUUID,
      );
      state = response;
    } on NoticeDetailModelError catch (e) {
      // 예외처리 안 실패
      logger.d(e);
      state = e;
    } catch (e) {
      // 예외처리 밖 에러(네트워크 에러 ...)
      logger.e('예외발생 - $e');
      final error = NoticeDetailModelError(
        message: '예외발생 - $e',
        type: NoticeDetailModelType.getDetail,
      );
      state = error;
    }
  }
}
