import 'package:dio/dio.dart';
import 'package:usw_circle_link/const/data.dart';
import 'package:usw_circle_link/dio/Dio.dart';
import 'package:usw_circle_link/utils/logger/Logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/models/my_circle_model.dart';

final MyCircleRepositoryProvider = Provider<MyCircleRepository>((ref) {
  final dio = ref.watch(dioProvider);

  return MyCircleRepository(
    baseUrl: 'https://$host:$port',
    dio: dio,
  );
});

class MyCircleRepository {
  final Dio dio;
  final String baseUrl;

  MyCircleRepository({
   required this.dio,
   required this.baseUrl
});

  Future<List<Circle>> getMyCircles() async {
    try {
      final response = await dio.get(
        '$baseUrl/mypages/my-clubs',
        options: Options(headers: {'accessToken' : 'true'}),
      );

      logger.d(response.data);

      logger.d('getMyCircles - ${response.realUri} 로 요청 성공! (${response.statusCode})');

      if (response.statusCode == 200) {
        final data = response.data['data'] as List;

        return data.map((circle) => Circle.fromJson(circle)).toList();
      } else {
        print('Failed to fetch data: ${response.statusCode}');
        throw Exception('소속 동아리 목록 조회에 실패하였습니다');
      }
    } catch (e) {
      logger.d('Error fetching circles: $e');
      throw Exception('소속 동아리 목록 조회 중 오류가 발생했습니다');
    }
  }
}
