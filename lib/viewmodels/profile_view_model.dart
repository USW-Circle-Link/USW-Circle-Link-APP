import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/models/profile_model.dart';
import 'package:usw_circle_link/repositories/profile_repository.dart';

final profileViewModelProvider = StateNotifierProvider.autoDispose<
    ProfileViewModel, AsyncValue<ProfileModelBase?>>((ref) {
  final profileRepository = ref.watch(profileRepositoryProvider);

  return ProfileViewModel(
    profileRepository: profileRepository,
  );
});

class ProfileViewModel extends StateNotifier<AsyncValue<ProfileModelBase?>> {
  final ProfileRepository profileRepository;

  ProfileViewModel({
    required this.profileRepository,
  }) : super(AsyncValue.data(null));

  Future<ProfileModelBase?> getProfile() async {
    try {
      final response = await profileRepository.getProfile();
      state = AsyncValue.data(response);
      return response;
    } on ProfileModelError catch (e) {
      // 예외처리 안 실패
      state = AsyncValue.data(e);
    } catch (e) {
      // 예외처리 밖 에러(네트워크 에러 ...)
      state = AsyncValue.data(ProfileModelError(message: '예외발생 - $e'));
    }

    return state.value;
  }

  Future<ProfileModelBase?> updateProfile({
    required String userName,
    required String studentNumber,
    required String userHp,
    required String major,
    required String password,
  }) async {
    try {
      final response = await profileRepository.updateProfile(
        userName: userName,
        studentNumber: studentNumber,
        userHp: userHp,
        major: major,
        password: password,
      );
      state = AsyncValue.data(response);
      return response;
    } on ProfileModelError catch (e) {
      // 예외처리 안 실패
      state = AsyncValue.data(e);
    } catch (e) {
      // 예외처리 밖 에러(네트워크 에러 ...)
      state = AsyncValue.data(ProfileModelError(message: '예외발생 - $e'));
    }

    return state.value;
  }
}
