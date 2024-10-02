import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/models/profile_model.dart';
import 'package:usw_circle_link/repositories/profile_repository.dart';
import 'package:usw_circle_link/repositories/update_profile_repository.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';
import 'package:usw_circle_link/utils/regex/regex.dart';

// 프로필 정보를 가져오는 Provider 정의
final getProfileProvider =
    FutureProvider.autoDispose<ProfileModel>((ref) async {
  final updateProfileRepository = ref.watch(updateProfileRepositoryProvider);

  // 프로필 정보 가져오기
  return await updateProfileRepository.getProfile();
});

// 프로필 업데이트를 처리하는 Provider 정의
final updateProfileViewModelProvider = StateNotifierProvider.autoDispose<
    UpdateProfileViewModel, AsyncValue<ProfileModel>>((ref) {
  final profileRepository = ref.read(profileRepositoryProvider);

  return UpdateProfileViewModel(
    profileRepository: profileRepository,
  );
});

class UpdateProfileViewModel extends StateNotifier<AsyncValue<ProfileModel>> {
  final ProfileRepository profileRepository;
  UpdateProfileViewModel({
    required this.profileRepository,
  }) : super(AsyncValue.loading()) {
    Future.sync(() async {
      try {
        state = AsyncValue.data(await profileRepository.getProfile());
      } on ProfileModelError catch (e) {
        state = AsyncError(e, e.stackTrace);
      } catch (e) {
        final error = ProfileModelError(
            message: '예외발생! - $e', type: ProfileModelType.getProfile);
        state = AsyncError(error, error.stackTrace);
      }
    });
  }

  Future<void> updateProfile({
    required String userName,
    required String studentNumber,
    required String userHp,
    required String major,
  }) async {
    try {
      state = AsyncLoading();
      if (userName.isEmpty) {
        throw ProfileModelError(
            message: '이름이 형식에 맞지 않습니다!',
            code: "USR-F400",
            type: ProfileModelType.updateProfile);
      }

      if (userHp.isNotEmpty) {
        if (!telephoneRegExp.hasMatch(userHp)) {
          throw FormatException();
        }
      } else {
        logger.d('전화번호 입력되지 않음');
      }

      if (!studentNumberRegExp.hasMatch(studentNumber)) {
        throw ProfileModelError(
            message: '학번이 형식에 않습니다!',
            code: "USR-F600",
            type: ProfileModelType.updateProfile);
      }

      if (major.isEmpty) {
        throw ProfileModelError(
            message: '학과가 형식에 않습니다!',
            code: "USR-F700",
            type: ProfileModelType.updateProfile);
      }
      state = AsyncData(
        await profileRepository.updateProfile(
          userName: userName,
          studentNumber: studentNumber,
          userHp: userHp,
          major: major,
        ),
      );
    } on FormatException catch (e) {
      final error = ProfileModelError(
          code: "USR-F500",
          message: '전화번호 형식 오류 - $e',
          type: ProfileModelType.updateProfile);
      state = AsyncError(error, error.stackTrace);
    } on ProfileModelError catch (e) {
      state = AsyncError(e, e.stackTrace);
    } catch (e) {
      final error = ProfileModelError(
          message: '예외발생! - $e', type: ProfileModelType.updateProfile);
      state = AsyncError(error, error.stackTrace);
    }
  }
}
