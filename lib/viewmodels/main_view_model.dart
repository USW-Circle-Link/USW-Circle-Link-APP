import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/circle_list_model.dart';
import '../repositories/circle_list_repository.dart';
import '../utils/logger/logger.dart';
import '../utils/result.dart';

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
    state = AsyncValue.loading();
    final result = await circleListRepository.fetchAllCircleList();
    switch (result) {
      case Ok(:final value):
        state = AsyncValue.data(value);
      case Error(:final error):
        logger.d(error);
        if (error is GlobalException) {
          state = AsyncValue.error(error, StackTrace.current);
        } else {
          final exception =
              error.toGlobalException(screen: 'CircleList_FetchAll');
          state = AsyncValue.error(exception, StackTrace.current);
        }
    }
  }

  Future<void> fetchOpenCircleList() async {
    state = AsyncValue.loading();
    final result = await circleListRepository.fetchOpenCircleList();
    switch (result) {
      case Ok(:final value):
        state = AsyncValue.data(value);
      case Error(:final error):
        if (error is GlobalException) {
          state = AsyncValue.error(error, StackTrace.current);
        } else {
          final exception =
              error.toGlobalException(screen: 'CircleList_FetchOpen');
          state = AsyncValue.error(exception, StackTrace.current);
        }
    }
  }

  Future<void> fetchAllFilteredCircleList(
      List<String> clubCategoryUUIDs) async {
    state = AsyncValue.loading();
    final result = await circleListRepository
        .fetchAllFilteredCircleList(clubCategoryUUIDs);
    switch (result) {
      case Ok(:final value):
        state = AsyncValue.data(value.toCircleListModel());
      case Error(:final error):
        if (error is GlobalException) {
          state = AsyncValue.error(error, StackTrace.current);
        } else {
          final exception =
              error.toGlobalException(screen: 'CircleList_FetchFilteredAll');
          state = AsyncValue.error(exception, StackTrace.current);
        }
    }
  }

  Future<void> fetchOpenFilteredCircleList(
      List<String> clubCategoryUUIDs) async {
    state = AsyncValue.loading();
    final result = await circleListRepository
        .fetchOpenFilteredCircleList(clubCategoryUUIDs);
    switch (result) {
      case Ok(:final value):
        state = AsyncValue.data(value.toCircleListModel());
      case Error(:final error):
        if (error is GlobalException) {
          state = AsyncValue.error(error, StackTrace.current);
        } else {
          final exception =
              error.toGlobalException(screen: 'CircleList_FetchFilteredOpen');
          state = AsyncValue.error(exception, StackTrace.current);
        }
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
