import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/models/circle_detail_list_model.dart';
import 'package:usw_circle_link/repositories/circle_list_repository.dart';

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
    try {
      final response = await circleListRepository.fetchMyCircleList();
      state = AsyncData(response);
    } on CircleDetailListModelError catch (e) {
      state = AsyncError(e, e.stackTrace);
    } catch (e) {
      final error = CircleDetailListModelError(message: "에외발생! - $e");
      state = AsyncError(error, error.stackTrace);
    }
  }

  Future<void> fetchMyApplicationList() async {
    try {
      final response = await circleListRepository.fetchMyApplicationList();
      state = AsyncData(response);
    } on CircleDetailListModelError catch (e) {
      state = AsyncError(e, e.stackTrace);
    } catch (e) {
      final error = CircleDetailListModelError(message: "에외발생! - $e");
      state = AsyncError(error, error.stackTrace);
    }
  }
}
