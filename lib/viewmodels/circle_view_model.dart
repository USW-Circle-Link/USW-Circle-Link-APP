import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/models/circle_detail_model.dart';
import 'package:usw_circle_link/repositories/circle_repository.dart';

final clubIntroViewModelProvider = StateNotifierProvider.autoDispose
    .family<CircleViewModel, AsyncValue<CircleDetailModel>, int>((ref, clubId) {
  final repository = ref.read(circleRepositoryProvider);
  return CircleViewModel(repository, clubId);
});

class CircleViewModel extends StateNotifier<AsyncValue<CircleDetailModel>> {
  final CircleRepository _repository;

  CircleViewModel(this._repository, int clubId) : super(AsyncLoading()) {
    fetchClubIntro(clubId);
  }

  Future<void> fetchClubIntro(int clubId) async {
    try {
      state = AsyncLoading();
      final response = await _repository.fetchClubIntro(clubId);
      state = AsyncData(response);
    } catch (e) {
      state = AsyncError(e, (e as Error).stackTrace!);
    }
  }
}
