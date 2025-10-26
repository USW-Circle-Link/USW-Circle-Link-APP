import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../const/analytics_const.dart';
import '../models/profile_model.dart';
import '../repositories/profile_repository.dart';
import '../utils/logger/logger.dart';
import '../utils/regex/Regex.dart';
import '../utils/result.dart';
import '../utils/error_util.dart';
import '../models/response/global_exception.dart';

final updateProfileViewModelProvider = StateNotifierProvider.autoDispose<
    UpdateProfileViewModel, AsyncValue<ProfileModel>>((ref) {
  ref.keepAlive();
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
        final result = await profileRepository.getProfile();
        switch (result) {
          case Ok():
            state = AsyncValue.data(ProfileModel(
              message: '프로필 조회 성공',
              data: result.value,
              type: ProfileModelType.getProfile,
            ));
          case Error():
            final error = ProfileModelError(
                message: result.error.toString(),
                type: ProfileModelType.getProfile);
            state = AsyncError(error, error.stackTrace);
        }
      } on ProfileModelError catch (e) {
        state = AsyncError(e, e.stackTrace);
      } on Exception catch (e) {
        ErrorUtil.instance
            .logError(e.toGlobalException(), screen: 'Profile_GetProfile');
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
    required String password,
  }) async {
    state = AsyncLoading();
    if (userName.isEmpty) {
      throw ProfileModelError(
          message: '이름이 형식에 맞지 않습니다!',
          code: "USR-F400",
          type: ProfileModelType.updateProfile);
    }

    if (!telephoneRegExp.hasMatch(userHp)) {
      throw ProfileModelError(
          code: "USR-F500",
          message: '전화번호 형식에 맞지 않습니다!',
          type: ProfileModelType.updateProfile);
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
    final result = await profileRepository.updateProfile(
      userName: userName,
      studentNumber: studentNumber,
      userHp: userHp,
      major: major,
      password: password,
    );

    switch (result) {
      case Ok():
        // Firebase Analytics: 프로필 업데이트 성공
        analytics.logEvent(
          name: AnalyticsEvent.profileUpdate,
          parameters: {
            AnalyticsParam.timestamp: DateTime.now().toIso8601String(),
          },
        );

        state = AsyncData(ProfileModel(
          message: '프로필 업데이트 성공',
          data: ProfileData(
            userName: userName,
            studentNumber: studentNumber,
            userHp: userHp,
            major: major,
            password: null,
          ),
          type: ProfileModelType.updateProfile,
        ));
      case Error():
        var error = result.error;
        if (error is ProfileModelError) {
        } else {
          error = ProfileModelError(
              message: result.error.toString(),
              type: ProfileModelType.updateProfile);
          ErrorUtil.instance.logError(error.toGlobalException(),
              screen: 'Profile_UpdateProfile');
        }

        state = AsyncError(error, error.stackTrace);
    }
  }
}
