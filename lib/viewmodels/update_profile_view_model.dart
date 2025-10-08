import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/const/analytics_const.dart';
import 'package:usw_circle_link/models/profile_model.dart';
import 'package:usw_circle_link/repositories/profile_repository.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';
import 'package:usw_circle_link/utils/regex/Regex.dart';
import 'package:usw_circle_link/utils/result.dart';

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
        analytics.logEvent(
          name: AnalyticsEvent.error,
          parameters: {
            AnalyticsParam.errorType: 'ProfileModelError',
            AnalyticsParam.errorCode: e.code ?? 'unknown',
            AnalyticsParam.errorMessage: e.message,
            AnalyticsParam.screen: 'Profile_GetProfile',
            AnalyticsParam.timestamp: DateTime.now().toIso8601String(),
          },
        );
        state = AsyncError(e, e.stackTrace);
      } catch (e) {
        analytics.logEvent(
          name: AnalyticsEvent.error,
          parameters: {
            AnalyticsParam.errorType: e.runtimeType.toString(),
            AnalyticsParam.errorMessage: e.toString(),
            AnalyticsParam.screen: 'Profile_GetProfile',
            AnalyticsParam.timestamp: DateTime.now().toIso8601String(),
          },
        );
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
    try {
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
          final error = ProfileModelError(
              message: result.error.toString(),
              type: ProfileModelType.updateProfile);
          state = AsyncError(error, error.stackTrace);
      }
    } on ProfileModelError catch (e) {
      analytics.logEvent(
        name: AnalyticsEvent.error,
        parameters: {
          AnalyticsParam.errorType: 'ProfileModelError',
          AnalyticsParam.errorCode: e.code ?? 'unknown',
          AnalyticsParam.errorMessage: e.message,
          AnalyticsParam.screen: 'Profile_UpdateProfile',
          AnalyticsParam.timestamp: DateTime.now().toIso8601String(),
        },
      );
      state = AsyncError(e, e.stackTrace);
    } catch (e) {
      analytics.logEvent(
        name: AnalyticsEvent.error,
        parameters: {
          AnalyticsParam.errorType: e.runtimeType.toString(),
          AnalyticsParam.errorMessage: e.toString(),
          AnalyticsParam.screen: 'Profile_UpdateProfile',
          AnalyticsParam.timestamp: DateTime.now().toIso8601String(),
        },
      );
      final error = ProfileModelError(
          message: '예외발생! - $e', type: ProfileModelType.updateProfile);
      state = AsyncError(error, error.stackTrace);
    }
  }
}
