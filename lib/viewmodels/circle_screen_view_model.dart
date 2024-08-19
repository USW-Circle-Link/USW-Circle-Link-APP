import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/models/circle_screen_model.dart';
import 'package:usw_circle_link/repositories/circle_screen_repository.dart';

final clubIntroProvider = StateNotifierProvider<ClubIntroViewModel, ClubIntro?>((ref) {
  return ClubIntroViewModel();
});

class ClubIntroViewModel extends StateNotifier<ClubIntro?> {
  ClubIntroViewModel() : super(null);
  final ClubRepository _repository = ClubRepository();

  bool isLoading = false;

  Future<void> fetchClubIntro(String clubId) async {
    try {
      isLoading = true;
      state = await _repository.fetchClubIntro(clubId);
      isLoading = false;
    } catch (e) {
      isLoading = false;
      rethrow;
    }
  }
}
