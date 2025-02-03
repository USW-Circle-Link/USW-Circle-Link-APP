import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/const/data.dart';
import 'package:usw_circle_link/dio/dio.dart';
import 'package:usw_circle_link/models/circle_detail_list_model.dart';
import 'package:usw_circle_link/models/circle_list_model.dart';
import 'package:usw_circle_link/utils/logger/Logger.dart';

final circleListRepositoryProvider = Provider<CircleListRepository>((ref) {
  final dio = ref.watch(dioProvider);

  return CircleListRepository(
    dio: dio,
    baseUrl: '$protocol://$host:$port',
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
      '$baseUrl/clubs',
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

  Future<CircleListModel> fetchOpenCircleList() async {
    final response = await dio.get(
      '$baseUrl/clubs/OPEN',
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

  Future<CircleDetailListModel> fetchMyCircleList() async {
    final response = await dio.get(
      '$baseUrl/mypages/my-clubs',
    );

    logger.d('${response.data}');

    logger.d(
        'fetchMyCircleList - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return CircleDetailListModel.fromJson(response.data);
    } else {
      // Bad Request
      throw CircleDetailListModelError.fromJson(response.data);
    }
  }

  Future<CircleDetailListModel> fetchMyApplicationList() async {
    final response = await dio.get(
      '$baseUrl/mypages/aplict-clubs',
    );

    logger.d('${response.data}');

    logger.d(
        'fetchMyApplicationList - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return CircleDetailListModel.fromJson(response.data);
    } else {
      // Bad Request
      throw CircleDetailListModelError.fromJson(response.data);
    }
  }

  Future<CircleFilteredListModel> fetchAllFilteredCircleList(
      List<String> department) async {
    final response = await dio.get(
      '$baseUrl/clubs/filter/${department.join(',')}',
    );

    logger.d('${response.data}');

    logger.d(
        'fetchAllFilteredCircleList - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return CircleFilteredListModel.fromJson(response.data);
    } else {
      // Bad Request
      throw CircleListModelError.fromJson(response.data);
    }
  }

  Future<CircleFilteredListModel> fetchOpenFilteredCircleList(
      List<String> department) async {
    final response = await dio.get(
      '$baseUrl/clubs/filter/${department.join(',')}/open',
    );

    logger.d('${response.data}');

    logger.d(
        'fetchOpenFilteredCircleList - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return CircleFilteredListModel.fromJson(response.data);
    } else {
      // Bad Request
      throw CircleListModelError.fromJson(response.data);
    }
  }
}
