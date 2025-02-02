import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/const/data.dart';
import 'package:usw_circle_link/dio/Dio.dart';
import 'package:usw_circle_link/models/category_model.dart';
import 'package:usw_circle_link/models/circle_detail_model.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';

final circleRepositoryProvider = Provider<CircleRepository>((ref) {
  final dio = ref.read(dioProvider);
  final baseUrl = '$protocol://$host:$port/clubs';
  return CircleRepository(dio: dio, baseUrl: baseUrl);
});

class CircleRepository {
  final Dio dio;
  final String baseUrl;

  CircleRepository({required this.dio, required this.baseUrl});

  Future<CircleDetailModel> fetchClubIntro(int clubId) async {
    try {
      final response = await dio.get(
        '$baseUrl/intro/$clubId',
      );

      logger.d(response.data['data']);

      logger.d(
          'fetchClubIntro - ${response.realUri} 로 요청 성공! (${response.statusCode})');

      return CircleDetailModel.fromJson(response.data['data']);
    } catch (e) {
      throw CircleDetailModelError(message: "에외발생 - $e");
    }
  }

  Future<CategoryModel> fetchCategory() async {
    try {
      final response = await dio.get('$baseUrl/categories');

      logger.d(response.data);

      logger.d(
          'fetchCategory - ${response.realUri} 로 요청 성공! (${response.statusCode})');

      return CategoryModel.fromJson(response.data);
    } catch (e) {
      throw CategoryModelError(message: "에외발생 - $e");
    }
  }
}
