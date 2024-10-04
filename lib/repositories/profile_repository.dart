import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/dio/dio.dart';
import 'package:usw_circle_link/const/data.dart';
import 'package:usw_circle_link/models/profile_model.dart';
import 'package:usw_circle_link/utils/logger/Logger.dart';

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  final dio = ref.watch(dioProvider);

  return ProfileRepository(
    baseUrl: 'https://$host:$port/profiles',
    dio: dio,
  );
});

class ProfileRepository {
  final String baseUrl;
  final Dio dio;

  ProfileRepository({
    required this.baseUrl,
    required this.dio,
  });

  Future<ProfileModel> getProfile() async {
    final response = await dio.get(
      '$baseUrl/me',
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
      return ProfileModel.fromJson(response.data).setType(ProfileModelType.getProfile);
    } else {
      // Bad Request
      throw ProfileModelError.fromJson(response.data).setType(ProfileModelType.getProfile);
    }
  }

  Future<ProfileModel> updateProfile({
    required String userName,
    required String studentNumber,
    required String userHp,
    required String major,
  }) async {
    final body = {
      'userName': userName,
      'studentNumber': studentNumber,
      'userHp': userHp,
      'major': major,
    };

    final response = await dio.patch(
      '$baseUrl/change',
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
      return ProfileModel.fromJson(response.data).setType(ProfileModelType.updateProfile);
    } else {
      throw ProfileModelError(message: '정보 수정에 실패하였습니다', type: ProfileModelType.updateProfile);
    }
  }
}
