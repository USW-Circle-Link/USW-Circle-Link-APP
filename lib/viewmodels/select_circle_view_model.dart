import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/models/circle_list_model.dart';
import 'package:usw_circle_link/repositories/circle_list_repository.dart';

final selectCircleViewModelProvider =
    StateNotifierProvider<SelectCircleViewModel, AsyncValue<CircleListModel?>>(
        (ref) {
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
    try {
      final response = await _circleListRepository.fetchAllCircleList();
      state = AsyncData(response);
    } on CircleListModelError catch (e) {
      state = AsyncError(e, e.stackTrace);
    } catch (e) {
      final error = CircleListModelError(
          message: '예외발생 - $e', type: CircleListModelType.all);
      state = AsyncError(error, error.stackTrace);
    }
  }
}
