import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/models/circle_detail_model.dart';
import 'package:usw_circle_link/repositories/circle_repository.dart';

final clubIntroViewModelProvider = StateNotifierProvider.autoDispose
    .family<CircleViewModel, AsyncValue<CircleDetailModel>, String>(
        (ref, clubUUID) {
  final repository = ref.read(circleRepositoryProvider);
  return CircleViewModel(repository, clubUUID);
});

class CircleViewModel extends StateNotifier<AsyncValue<CircleDetailModel>> {
  final CircleRepository _repository;

  CircleViewModel(this._repository, String clubUUID) : super(AsyncLoading()) {
    fetchClubIntro(clubUUID);
  }

  Future<void> fetchClubIntro(String clubUUID) async {
    try {
      state = AsyncLoading();
      final response = await _repository.fetchClubIntro(clubUUID);
      state = AsyncData(response);
    } catch (e) {
      state = AsyncError(e, (e as Error).stackTrace!);
    }
  }
}
