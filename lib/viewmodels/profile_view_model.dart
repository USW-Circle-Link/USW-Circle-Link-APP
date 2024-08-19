import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/models/profile_model.dart';
import 'package:usw_circle_link/repositories/profile_repository.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';

final profileViewModelProvider =
    StateNotifierProvider<ProfileViewModel, ProfileModelBase?>((ref) {
  final profileRepository = ref.watch(profileRepositoryProvider);

  return ProfileViewModel(
    profileRepository: profileRepository,
  );
});

class ProfileViewModel extends StateNotifier<ProfileModelBase?> {
  final ProfileRepository profileRepository;
  
  ProfileViewModel({
    required this.profileRepository,
  }) : super(null);

  Future<void> getProfile() async { 
    try {
      final response = await profileRepository.getProfile();
      state = response;
    } on ProfileModelError catch (e) {
      // 예외처리 안 실패
      logger.d(e);
      rethrow;
    } catch (e) {
      // 예외처리 밖 에러(네트워크 에러 ...)
      logger.e('예외발생 - $e');
      rethrow;
    }
  }
}
