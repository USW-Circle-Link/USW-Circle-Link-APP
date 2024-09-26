import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/const/data.dart';
import 'package:usw_circle_link/dio/Dio.dart';
import 'package:usw_circle_link/models/profile_model.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';

final updateProfileRepositoryProvider =
    Provider<UpdateProfileRepository>((ref) {
  final dio = ref.watch(dioProvider);

  return UpdateProfileRepository(
    baseUrl: 'http://$host:$port',
    dio: dio,
  );
});

class UpdateProfileRepository {
  final Dio dio;
  final String baseUrl;

  UpdateProfileRepository({
    required this.dio,
    required this.baseUrl,
  });

  Future<ProfileModel> getProfile() async {
    try {
      final response = await dio.get(
        '$baseUrl/profiles/me',
        options: Options(headers: {'accessToken': 'true'}),
      );

      logger.d(
          'getProfile - ${response.realUri} 로 요청 성공! (${response.statusCode})');
      logger.d('getProfile 데이터 - ${response.data}');

      if (response.statusCode == 200) {
        return ProfileModel.fromJson(response.data);
      } else {
        print('Failed to fetch data: ${response.statusCode}');
        throw Exception('프로필 조회에 실패하였습니다');
      }
    } catch (e) {
      print('Error fetching profile: $e');
      throw Exception('프로필 조회 중 오류가 발생했습니다');
    }
  }

  Future<ProfileModel> updateProfile(ProfileData updatedProfile) async {
    final data = {
      'userName': updatedProfile.userName,
      'studentNumber': updatedProfile.studentNumber,
      'userHp': updatedProfile.userHp,
      'major': updatedProfile.major,
    };

    final response = await dio.patch(
      '$baseUrl/profiles/change',
      options: Options(headers: {
        'accessToken': 'true',
        'Content-Type': 'application/json',
      }),
      data: {
        'userName': updatedProfile.userName,
        'studentNumber': updatedProfile.studentNumber,
        'userHp': updatedProfile.userHp,
        'major': updatedProfile.major,
      },
    );

    logger.d('updateProfile - ${response.data}');

    logger.d(
        'updateProfile - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return ProfileModel.fromJson(response.data);
    } else {
      throw ProfileModelError(message: '정보 수정에 실패하였습니다');
    }
  }
}
