import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/models/circle_list_model.dart';
import 'package:usw_circle_link/repositories/circle_list_repository.dart';
import 'package:usw_circle_link/utils/logger/Logger.dart';

final mainViewModelProvider = StateNotifierProvider.autoDispose<MainViewModel,
    AsyncValue<CircleListModel>>((ref) {
  final circleListRepository = ref.read(circleListRepositoryProvider);
  return MainViewModel(circleListRepository: circleListRepository);
});

class MainViewModel extends StateNotifier<AsyncValue<CircleListModel>> {
  final CircleListRepository circleListRepository;

  MainViewModel({
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
    } on CircleListModelError catch (e) {
      logger.d(e);
      state = AsyncValue.error(e, e.stackTrace);
    } catch (e) {
      final error = CircleListModelError(message:'예외발생! - $e',type: CircleListModelType.all);
      logger.e(e);
      state = AsyncValue.error(error, error.stackTrace);
    }
  }

  Future<void> fetchOpenCircleList() async {
    try {
      state = AsyncValue.loading();

      final response = await circleListRepository.fetchOpenCircleList();

      state = AsyncValue.data(response);
    } on CircleListModelError catch (e) {
      state = AsyncValue.error(e, e.stackTrace);
    } catch (e) {
      logger.e(e);
      final error = CircleListModelError(message: '예외발생! - $e',type: CircleListModelType.department);
      state = AsyncValue.error(error, error.stackTrace);
    }
  }
}
