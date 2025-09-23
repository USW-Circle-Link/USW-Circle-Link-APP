import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/dio/Dio.dart';
import 'package:usw_circle_link/models/profile_model.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';

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

  Future<ProfileModel> getProfile() async {
    final response = await dio.get(
      '$basePath/me',
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
      return ProfileModel.fromJson(response.data)
          .setType(ProfileModelType.getProfile);
    } else {
      // Bad Request
      throw ProfileModelError.fromJson(response.data)
          .setType(ProfileModelType.getProfile);
    }
  }

  Future<ProfileModel> updateProfile({
    required String userName,
    required String studentNumber,
    required String userHp,
    required String major,
    required String password,
  }) async {
    final body = {
      'userName': userName,
      'studentNumber': studentNumber,
      'userHp': userHp,
      'major': major,
      'userPw': password,
    };

    final response = await dio.patch(
      '$basePath/change',
      options: Options(headers: {
        'accessToken': 'true',
        'Content-Type': 'application/json',
      }),
      data: body,
    );

    logger.d(response.data);

    logger.d(
        'updateProfile - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return ProfileModel.fromJson(response.data)
          .setType(ProfileModelType.updateProfile);
    } else {
      // 기존에는 단순히 메시지만 던졌지만, 이제는 JSON을 파싱해서 오류 코드 등도 포함시킵니다.
      throw ProfileModelError.fromJson(response.data)
          .setType(ProfileModelType.updateProfile);
    }
  }
}
