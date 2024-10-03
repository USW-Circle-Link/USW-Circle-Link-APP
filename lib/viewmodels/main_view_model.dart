import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/models/circle_list_model.dart';
import 'package:usw_circle_link/repositories/circle_list_repository.dart';
import 'package:usw_circle_link/utils/logger/Logger.dart';

final mainViewModelProvider =
    StateNotifierProvider.autoDispose<MainViewModel, AsyncValue<CircleListModelBase?>>(
        (ref) {
  final circleListRepository = ref.read(circleListRepositoryProvider);
  return MainViewModel(circleListRepository: circleListRepository);
});

class MainViewModel extends StateNotifier<AsyncValue<CircleListModelBase?>> {
  final CircleListRepository circleListRepository;

  MainViewModel({
    required this.circleListRepository,
  }) : super(AsyncValue.data(null)) {
    fetchAllCircleList();
  }

  Future<void> fetchAllCircleList() async {
    try {
      state = AsyncValue.data(CircleListModelLoading());

      final response = await circleListRepository.fetchAllCircleList();

      state = AsyncValue.data(response);
    } on CircleListModelError catch (e) {
      state = AsyncValue.data(e);
    } catch (e) {
      logger.e(e);
      state = AsyncValue.data(CircleListModelError(type: CircleListModelType.all));
    }
  }

  Future<void> fetchOpenCircleList() async {
    try {
      state = AsyncValue.data(CircleListModelLoading());

      final response = await circleListRepository.fetchOpenCircleList();

      state = AsyncValue.data(response);
    } on CircleListModelError catch (e) {
      state = AsyncValue.data(e);
    } catch (e) {
      logger.e(e);
      state = AsyncValue.data(CircleListModelError(type: CircleListModelType.department));
    }
  }
}
