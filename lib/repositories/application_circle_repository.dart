import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:usw_circle_link/const/data.dart';
import 'package:usw_circle_link/models/application_cricle_model.dart';

class ApplicationCircleRepository {
  Future<List<Circle>> fetchCircles(String token) async {
    final response = await http.get(
      Uri.parse('http://$host:$port/mypages/aplict-clubs'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final responseBodyBytes = response.bodyBytes;
      final responseBody = utf8.decode(responseBodyBytes); // UTF-8로 수동 디코드
      print('Server response: $responseBody'); // 서버 응답을 출력
      final data = json.decode(responseBody)['data'] as List;
      return data.map((circle) => Circle.fromJson(circle)).toList();
    } else {
      print('Failed to fetch data: ${response.statusCode}'); // 에러 코드 출력
      throw Exception('지원 동아리 목록 조회에 실패하였습니다');
    }
  }
}
