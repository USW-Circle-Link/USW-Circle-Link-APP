import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/models/circle_list_model.dart';
import 'package:usw_circle_link/repositories/circle_list_repository.dart';
import 'package:usw_circle_link/utils/logger/Logger.dart';

final mainViewModelProvider =
    StateNotifierProvider.autoDispose<MainViewModel, CircleListModelBase?>(
        (ref) {
  final circleListRepository = ref.read(CircleListRepositoryPrivider);
  return MainViewModel(circleListRepository: circleListRepository);
});

class MainViewModel extends StateNotifier<CircleListModelBase?> {
  final CircleListRepository circleListRepository;

  MainViewModel({
    required this.circleListRepository,
  }) : super(null);

  Future<void> fetchAllCircleList() async {
    try {
      state = CircleListModelLoading();

      final response = await circleListRepository.fetchAllCircleList();

      state = response;
    } on CircleListModelError catch (e) {
      state = e;
    } catch (e) {
      logger.e(e);
      state = CircleListModelError(type: CircleListModelType.all);
    }
  }

  Future<void> fetchDepartmentCircleList() async {
    try {
      state = CircleListModelLoading();

      final response = await circleListRepository.fetchDepartmentCircleList();

      state = response;
    } on CircleListModelError catch (e) {
      state = e;
    } catch (e) {
      logger.e(e);
      state = CircleListModelError(type: CircleListModelType.department);
    }
  }
}
