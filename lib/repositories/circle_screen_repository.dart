import 'package:dio/dio.dart';
import 'package:usw_circle_link/const/data.dart';
import 'package:usw_circle_link/models/circle_screen_model.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';

class ClubRepository {
  final Dio _dio = Dio();

  Future<ClubIntro> fetchClubIntro(String clubId) async {
    try {
      final response = await _dio.get(
        'http://$host:$port/clubs/intro/$clubId',
        options: Options(
          headers: {
            'accessToken': 'true',
          },
        ),
      );
      logger.d(response.data['data']);
      return ClubIntro.fromJson(response.data['data']);
    } catch (e) {
      logger.e(e);
      throw Exception("Failed to fetch club intro");
    }
  }
}
