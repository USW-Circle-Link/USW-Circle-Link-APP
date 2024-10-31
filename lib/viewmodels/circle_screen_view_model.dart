import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/models/circle_screen_model.dart';
import 'package:usw_circle_link/repositories/circle_screen_repository.dart';

final clubIntroProvider = StateNotifierProvider.autoDispose.family
    <ClubIntroViewModel, AsyncValue<ClubIntro>, int>((ref, clubId) {
  return ClubIntroViewModel(clubId: clubId);
});

class ClubIntroViewModel extends StateNotifier<AsyncValue<ClubIntro>> {
  ClubIntroViewModel({required int clubId}) : super(AsyncLoading()) {
    fetchClubIntro(clubId);
  }
  final ClubRepository _repository = ClubRepository();

  bool isLoading = false;

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
