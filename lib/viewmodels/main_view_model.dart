import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/circle_list_model.dart';
import '../repositories/circle_list_repository.dart';
import '../utils/logger/logger.dart';

import '../models/response/global_exception.dart';

final circleViewModelProvider = StateNotifierProvider.autoDispose<
    CircleViewModel, AsyncValue<CircleListModel>>((ref) {
  final circleListRepository = ref.read(circleListRepositoryProvider);
  return CircleViewModel(circleListRepository: circleListRepository);
});

class CircleViewModel extends StateNotifier<AsyncValue<CircleListModel>> {
  final CircleListRepository circleListRepository;

  CircleViewModel({
    required this.circleListRepository,
  }) : super(AsyncLoading()) {
    Future.sync(() async {
      await fetchAllCircleList();
    });
  }

  Future<void> fetchAllCircleList() async {
    try {
      state = AsyncValue.loading();

      final response = await circleListRepository.fetchAllCircleList();

      state = AsyncValue.data(response);
    } on GlobalException catch (e) {
      logger.d(e);
      state = AsyncValue.error(e, e.stackTrace);
    } on Exception catch (e) {
      logger.e(e);
      final exception = e.toGlobalException(screen: 'CircleList_FetchAll');
      state = AsyncValue.error(exception, exception.stackTrace);
    }
  }

  Future<void> fetchOpenCircleList() async {
    try {
      state = AsyncValue.loading();

      final response = await circleListRepository.fetchOpenCircleList();

      state = AsyncValue.data(response);
    } on GlobalException catch (e) {
      state = AsyncValue.error(e, e.stackTrace);
    } on Exception catch (e) {
      logger.e(e);
      final exception = e.toGlobalException(screen: 'CircleList_FetchOpen');
      state = AsyncValue.error(exception, exception.stackTrace);
    }
  }

  Future<void> fetchAllFilteredCircleList(
      List<String> clubCategoryUUIDs) async {
    try {
      state = AsyncValue.loading();

      final response = await circleListRepository
          .fetchAllFilteredCircleList(clubCategoryUUIDs);

      state = AsyncValue.data(response.toCircleListModel());
    } on GlobalException catch (e) {
      state = AsyncValue.error(e, e.stackTrace);
    } on Exception catch (e) {
      final exception =
          e.toGlobalException(screen: 'CircleList_FetchFilteredAll');
      state = AsyncValue.error(exception, exception.stackTrace);
    }
  }

  Future<void> fetchOpenFilteredCircleList(
      List<String> clubCategoryUUIDs) async {
    try {
      final response = await circleListRepository
          .fetchOpenFilteredCircleList(clubCategoryUUIDs);
      state = AsyncValue.data(response.toCircleListModel());
    } on GlobalException catch (e) {
      state = AsyncValue.error(e, e.stackTrace);
    } on Exception catch (e) {
      final exception =
          e.toGlobalException(screen: 'CircleList_FetchFilteredOpen');
      state = AsyncValue.error(exception, exception.stackTrace);
    }
  }
}

extension on CircleFilteredListModel {
  CircleListModel toCircleListModel() {
    final newList = <CircleListData>[];
    for (var category in data) {
      final clubs = category.clubs;
      newList.addAll(
          clubs.map((e) => e.setDepartmentName(category.clubCategoryName)));
    }
    return CircleListModel(message: message, data: newList);
  }
}
