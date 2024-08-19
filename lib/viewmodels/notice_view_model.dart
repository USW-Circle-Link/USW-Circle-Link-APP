import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:usw_circle_link/models/notice_model.dart';
import 'package:usw_circle_link/repositories/notice_repository.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';

final noticeViewModelProvider =
    StateNotifierProvider.autoDispose<NoticeViewModel, NoticeModelBase?>((ref) {
  final noticeRepository = ref.watch(noticeRepositoryProvider);

  return NoticeViewModel(
    noticeRepository: noticeRepository,
  );
});

class NoticeViewModel extends StateNotifier<NoticeModelBase?> {
  final NoticeRepository noticeRepository;

  NoticeViewModel({
    required this.noticeRepository,
  }) : super(null);

  Future<void> fetchNotices() async {
    try {
      final response = await noticeRepository.fetchNotices();
      state = response;
    } on NoticeModelError catch (e) {
      // 예외처리 안 실패
      logger.d(e);
      rethrow;
    } catch (e) {
      // 예외처리 밖 에러(네트워크 에러 ...)
      logger.e('예외발생 - $e');
      rethrow;
    }
  }
}

extension ParseDateTime on String {
  DateTime parseDateTime() {
    return DateTime.parse(this);
  }
}

extension GetFormattedString on DateTime {
  String getFormattedString() {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(this);
  }
}
