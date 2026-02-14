import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/models/circle_detail_list_model.dart';
import 'package:usw_circle_link/repositories/circle_list_repository.dart';
import 'package:usw_circle_link/utils/result.dart';

final circleListScreenViewModelProvider = StateNotifierProvider.autoDispose
    .family<CircleListViewModel, AsyncValue<CircleDetailListModel>, CircleListType>((ref, circleListType) {
  final circleListRepository = ref.read(circleListRepositoryProvider);
  return CircleListViewModel(
    circleListRepository: circleListRepository,
    circleListType: circleListType,
  );
});

class CircleListViewModel
    extends StateNotifier<AsyncValue<CircleDetailListModel>> {
  final CircleListRepository circleListRepository;
  final CircleListType circleListType;
  CircleListViewModel({
    required this.circleListRepository,
    required this.circleListType,
  }) : super(AsyncLoading()) {
    switch (circleListType) {
      case CircleListType.myCircles:
        fetchMyCircleList();
        break;
      case CircleListType.myApplications:
        fetchMyApplicationList();
        break;
    }
  }

  Future<void> fetchMyCircleList() async {
    final result = await circleListRepository.fetchMyCircleList();
    switch (result) {
      case Ok(:final value):
        state = AsyncData(value);
      case Error(:final error):
        if (error is CircleDetailListModelError) {
          state = AsyncError(error, StackTrace.current);
        } else {
          final modelError =
              CircleDetailListModelError(message: "예외발생! - $error");
          state = AsyncError(modelError, StackTrace.current);
        }
    }
  }

  Future<void> fetchMyApplicationList() async {
    final result = await circleListRepository.fetchMyApplicationList();
    switch (result) {
      case Ok(:final value):
        state = AsyncData(value);
      case Error(:final error):
        if (error is CircleDetailListModelError) {
          state = AsyncError(error, StackTrace.current);
        } else {
          final modelError =
              CircleDetailListModelError(message: "예외발생! - $error");
          state = AsyncError(modelError, StackTrace.current);
        }
    }
  }
}
