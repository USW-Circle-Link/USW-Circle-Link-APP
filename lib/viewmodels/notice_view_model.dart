import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:usw_circle_link/models/notice_model.dart';
import 'package:usw_circle_link/repositories/notice_repository.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';
import 'package:usw_circle_link/utils/result.dart';

final noticeViewModelProvider =
    StateNotifierProvider.autoDispose<NoticeViewModel, AsyncValue<NoticeModel>>(
        (ref) {
  final noticeRepository = ref.watch(noticeRepositoryProvider);

  return NoticeViewModel(
    noticeRepository: noticeRepository,
  );
});

class NoticeViewModel extends StateNotifier<AsyncValue<NoticeModel>> {
  final NoticeRepository noticeRepository;

  NoticeViewModel({
    required this.noticeRepository,
  }) : super(AsyncValue.loading()) {
    Future.sync(() async {
      await fetchNotices();
    });
  }

  Future<void> fetchNotices() async {
    final result = await noticeRepository.fetchNotices();
    switch (result) {
      case Ok(:final value):
        state = AsyncData(value);
      case Error(:final error):
        if (error is NoticeModelError) {
          logger.d(error);
          state = AsyncError(error, StackTrace.current);
        } else {
          final noticeError = NoticeModelError(
              message: '예외발생! - $error', type: NoticeModelType.fetchAll);
          logger.e('예외발생 - $noticeError');
          state = AsyncError(noticeError, StackTrace.current);
        }
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
