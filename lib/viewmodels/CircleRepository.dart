import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:usw_circle_link/model/Circle.dart';

class CircleRepository {
  Future<List<Circle>> fetchCircles(String uuId) async {
    final response = await http.get(Uri.parse('http://43.200.140.186:8080/mypages/$uuId/my-clubs'));

    if (response.statusCode == 200) {
      final responseBody = response.body;
      print('Server response: $responseBody'); // 서버 응답을 출력
      final data = json.decode(responseBody)['data'] as List;
      return data.map((circle) => Circle.fromJson(circle)).toList();
    } else {
      print('Failed to fetch data: ${response.statusCode}'); // 에러 코드 출력
      throw Exception('소속 동아리 목록 조회에 실패하였습니다');
    }
  }
}
