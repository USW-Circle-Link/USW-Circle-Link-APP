import 'package:dio/dio.dart';
import 'package:usw_circle_link/const/data.dart';
import 'package:usw_circle_link/models/UswClubModel.dart';

// 전체 동아리 리스트
class ClubListRepository {
  final Dio dio; // Dio 인스턴스 추가
  final List<Club> clubs; // 동아리 리스트를 저장할 변수

  ClubListRepository(this.dio, this.clubs); // Dio 인스턴스와 클럽 리스트를 초기화

  factory ClubListRepository.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List; // JSON에서 동아리 리스트를 가져옴
    List<Club> clubsList =
        list.map((item) => Club.fromJson(item)).toList(); // Club 객체 리스트로 변환
    return ClubListRepository(Dio(), clubsList); // ClubListRepository 객체 반환
  }

  Future<ClubListRepository> fetchClubs(String token) async {
    try {
      final response = await dio.get(
        'http://$host:$port/clubs/ACADEMIC',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      return ClubListRepository.fromJson(
          response.data); // JSON 데이터를 ClubListRepository 객체로 변환하여 반환
    } catch (e) {
      throw Exception('Failed to load clubs: $e');
    }
  }
}

// 모집중인 동아리 리스트
class RecuitingClubRepository {
  final Dio _dio;

  RecuitingClubRepository(this._dio);

  Future<List<Club>> fetchClubs(String token) async {
    final response = await _dio.get(
      'http://$host:$port/clubs/ACADEMIC/CLOSE',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data['data'];
      return data.map((json) => Club.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load clubs');
    }
  }
}
