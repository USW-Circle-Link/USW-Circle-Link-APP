import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/dio/Dio.dart';
import 'package:usw_circle_link/models/profile_model.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';
import 'package:usw_circle_link/utils/result.dart';

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  final dio = ref.watch(dioProvider);

  return ProfileRepository(
    basePath: '/profiles',
    dio: dio,
  );
});

class ProfileRepository {
  final String basePath;
  final Dio dio;

  ProfileRepository({
    required this.basePath,
    required this.dio,
  });

  Future<Result<ProfileData>> getProfile() async {
    try {
      final response = await dio.get(
        '/users/me',
        options: Options(
          headers: {
            'accessToken': 'true',
          },
        ),
      );

      logger.d(response.data);

      logger.d(
          'getProfile - ${response.realUri} 로 요청 성공! (${response.statusCode})');

      if (response.statusCode == 200) {
        return Result.ok(ProfileData.fromJson(response.data['data']));
      } else {
        // Bad Request
        return Result.error(ProfileModelError.fromJson(response.data)
            .setType(ProfileModelType.getProfile));
      }
    } on DioException catch (e) {
      return Result.error(ProfileModelError(
        code: "NETWORK_ERROR",
        message: '네트워크 에러 - $e',
        type: ProfileModelType.getProfile,
      ));
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Future<Result<bool>> updateProfile({
    required String userName,
    required String studentNumber,
    required String userHp,
    required String major,
    required String password,
  }) async {
    try {
      final body = {
        'userName': userName,
        'studentNumber': studentNumber,
        'userHp': userHp,
        'major': major,
        'userPw': password,
      };

      final response = await dio.patch(
        '/users/me',
        options: Options(
          headers: {
            'accessToken': 'true',
          },
        ),
        data: body,
      );

      logger.d(response.data);

      logger.d(
          'updateProfile - ${response.realUri} 로 요청 성공! (${response.statusCode})');

      if (response.statusCode == 200) {
        return Result.ok(true);
      } else {
        return Result.error(ProfileModelError.fromJson(response.data)
            .setType(ProfileModelType.updateProfile));
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Future<Result<bool>> checkDuplication({
    required String account,
  }) async {
    try {
      final response = await dio.post(
        '/users/profile/duplication-check',
        data: {
          'account': account,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      logger.d(response.data);

      logger.d(
          'checkDuplication - ${response.realUri} 로 요청 성공! (${response.statusCode})');

      if (response.statusCode == 200) {
        final isDuplicated = response.data['data'] as bool?;
        return Result.ok(isDuplicated ?? false);
      } else {
        return Result.error(ProfileModelError.fromJson(response.data)
            .setType(ProfileModelType.getProfile));
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
