import 'package:dio/dio.dart';
import 'package:usw_circle_link/models/circle_screen_model.dart';

class ClubRepository {
  final Dio _dio = Dio();

  Future<ClubIntro> fetchClubIntro(String clubId) async {
    try {
      final response = await _dio.get('http://15.164.246.244:8080/clubs/intro/$clubId');
      return ClubIntro.fromJson(response.data);
    } catch (e) {
      throw Exception("Failed to fetch club intro");
    }
  }
}
