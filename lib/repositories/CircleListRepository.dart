import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/const/data.dart';
import 'package:usw_circle_link/dio/Dio.dart';
import 'package:usw_circle_link/models/CircleListModel.dart';
import 'package:usw_circle_link/utils/logger/Logger.dart';

final CircleListRepositoryPrivider = Provider<CircleListRepository>((ref) {
  final dio = ref.watch(dioProvider);
  
  return CircleListRepository(
    dio: dio,
    baseUrl: 'http://$host:$port/clubs',
  );
});

class CircleListRepository {
  final Dio dio;
  final String baseUrl;

  CircleListRepository({
    required this.dio,
    required this.baseUrl,
  });

  Future<CircleListModel> fetchAllCircleList() async {
    final response = await dio.get(
      '$baseUrl/ACADEMIC',
    );

    logger.d('${response.data}');

    logger.d(
        'fetchAllCircleList - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return CircleListModel.fromJson(response.data)
          .setType(CircleListModelType.all);
    } else {
      // Bad Request
      throw CircleListModelError.fromJson(response.data)
          .setType(CircleListModelType.all);
    }
  }

  Future<CircleListModel> fetchDepartmentCircleList() async {
    final response = await dio.get(
      '$baseUrl/ACADEMIC/OPEN',
    );

    logger.d('${response.data}');

    logger.d(
        'fetchDepartmentCircleList - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return CircleListModel.fromJson(response.data)
          .setType(CircleListModelType.department);
    } else {
      // Bad Request
      throw CircleListModelError.fromJson(response.data)
          .setType(CircleListModelType.department);
    }
  }
}
