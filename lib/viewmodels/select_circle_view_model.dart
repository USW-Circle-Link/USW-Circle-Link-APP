import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/circle_list_model.dart';
import '../repositories/circle_list_repository.dart';
import '../models/response/global_exception.dart';
import '../utils/result.dart';

final selectCircleViewModelProvider = StateNotifierProvider.autoDispose<
    SelectCircleViewModel, AsyncValue<CircleListModel?>>((ref) {
  return SelectCircleViewModel(ref.read(circleListRepositoryProvider));
});

class SelectCircleViewModel
    extends StateNotifier<AsyncValue<CircleListModel?>> {
  final CircleListRepository _circleListRepository;

  SelectCircleViewModel(this._circleListRepository)
      : super(const AsyncLoading()) {
    fetchAllCircleList();
  }

  Future<void> fetchAllCircleList() async {
    state = const AsyncLoading();
    final result = await _circleListRepository.fetchAllCircleList();
    switch (result) {
      case Ok(:final value):
        state = AsyncData(value);
      case Error(:final error):
        if (error is GlobalException) {
          state = AsyncError(error, error.stackTrace);
        } else {
          final exception =
              error.toGlobalException(screen: 'SelectCircle_FetchAll');
          state = AsyncError(exception, exception.stackTrace);
        }
    }
  }
}
