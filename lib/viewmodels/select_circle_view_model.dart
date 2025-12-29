import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/circle_list_model.dart';
import '../repositories/circle_list_repository.dart';
import '../models/response/global_exception.dart';

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
    try {
      final response = await _circleListRepository.fetchAllCircleList();
      state = AsyncData(response);
    } on GlobalException catch (e) {
      state = AsyncError(e, e.stackTrace);
    } on Exception catch (e) {
      final exception = e.toGlobalException(screen: 'SelectCircle_FetchAll');
      state = AsyncError(exception, exception.stackTrace);
    }
  }
}
