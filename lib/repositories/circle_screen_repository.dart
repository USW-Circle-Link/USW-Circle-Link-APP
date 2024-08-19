import 'package:dio/dio.dart';
import 'package:usw_circle_link/models/circle_screen_model.dart';

class ClubRepository {
  final Dio _dio = Dio();

  Future<ClubIntro> fetchClubIntro(String clubId) async {
    try {
      final response = await _dio.get('http://43.201.237.126:8080/clubs/intro/$clubId');
      return ClubIntro.fromJson(response.data);
    } catch (e) {
      throw Exception("Failed to fetch club intro");
    }
  }
}
