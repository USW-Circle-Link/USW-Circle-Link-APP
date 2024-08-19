import 'package:dio/dio.dart';
import 'package:usw_circle_link/dio/dio.dart';
import 'package:usw_circle_link/const/data.dart';
import 'package:usw_circle_link/models/application_cricle_model.dart';
import 'package:usw_circle_link/utils/logger/Logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final ApplicationCircleRepositoryProvider = Provider<ApplicationCircleRepository>((ref) {
  final dio = ref.watch(dioProvider);

  return ApplicationCircleRepository(
    baseUrl: 'http://$host:$port',
    dio: dio,
  );
});

class ApplicationCircleRepository {
  final Dio dio;
  final String baseUrl;

  ApplicationCircleRepository({
    required this.dio,
    required this.baseUrl,
  });

  Future<List<Circle>> getAppCircles() async {
    try {
      final response = await dio.get(
        '$baseUrl/mypages/aplict-clubs',
        options: Options(headers: {'accessToken': 'true'}),
      );

      logger.d('getAppCircles - ${response.realUri} 로 요청 성공! (${response.statusCode})');

      if (response.statusCode == 200) {
        // Dio는 이미 JSON을 자동으로 파싱하므로, 별도의 디코딩이 필요 없습니다.
        final data = response.data['data'] as List;

        return data.map((circle) => Circle.fromJson(circle)).toList();
      } else {
        print('Failed to fetch data: ${response.statusCode}');
        throw Exception('지원 동아리 목록 조회에 실패하였습니다');
      }
    } catch (e) {
      print('Error fetching circles: $e');
      throw Exception('지원 동아리 목록 조회 중 오류가 발생했습니다');
    }
  }
}
