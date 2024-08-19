import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/dio/dio.dart';
import 'package:usw_circle_link/const/data.dart';
import 'package:usw_circle_link/models/profile_model.dart';
import 'package:usw_circle_link/utils/logger/Logger.dart';

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  final dio = ref.watch(dioProvider);

  return ProfileRepository(
    baseUrl: 'http://$host:$port/profiles',
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

  /////////// 프로필 관련 API ///////////
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

    logger
        .d('getProfile - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return ProfileModel.fromJson(response.data);
    } else {
      // Bad Request
      throw ProfileModelError.fromJson(response.data);
    }
  }
  ////////////////////////////////////
}
