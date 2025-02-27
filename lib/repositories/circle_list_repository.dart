import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/dio/dio.dart';
import 'package:usw_circle_link/models/category_model.dart';
import 'package:usw_circle_link/models/circle_detail_list_model.dart';
import 'package:usw_circle_link/models/circle_list_model.dart';
import 'package:usw_circle_link/utils/logger/Logger.dart';

final circleListRepositoryProvider = Provider<CircleListRepository>((ref) {
  final dio = ref.watch(dioProvider);

  return CircleListRepository(
    dio: dio,
    basePath: '/clubs',
  );
});

class CircleListRepository {
  final Dio dio;
  final String basePath;

  CircleListRepository({
    required this.dio,
    required this.basePath,
  });

  /// 모든 분과 동아리 목록 조회
  ///
  /// 이 함수는 모든 분과 동아리의 목록을 조회합니다.
  ///
  /// return: CircleListModel - 조회된 동아리 목록을 포함하는 모델
  ///
  /// 예외:
  /// - CircleListModelError: 조회 중 오류가 발생한 경우
  Future<CircleListModel> fetchAllCircleList() async {
    final response = await dio.get(
      basePath,
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

  /// 모집중인 분과 동아리 목록 조회
  ///
  /// 이 함수는 모집중인 분과 동아리의 목록을 조회합니다.
  ///
  /// return: CircleListModel - 조회된 동아리 목록을 포함하는 모델
  ///
  /// 예외:
  /// - CircleListModelError: 조회 중 오류가 발생한 경우
  Future<CircleListModel> fetchOpenCircleList() async {
    final response = await dio.get(
      '$basePath/open',
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

  /// 소속 동아리 목록 조회
  ///
  /// 이 함수는 소속 동아리 목록을 조회합니다.
  ///
  /// return: CircleDetailListModel - 조회된 동아리 목록을 포함하는 모델
  ///
  /// 예외:
  /// - CircleDetailListModelError: 조회 중 오류가 발생한 경우
  Future<CircleDetailListModel> fetchMyCircleList() async {
    final response = await dio.get(
      '/mypages/my-clubs',
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

  /// 내 신청 동아리 목록 조회
  ///
  /// 이 함수는 내 신청 동아리 목록을 조회합니다.
  ///
  /// return: CircleDetailListModel - 조회된 동아리 목록을 포함하는 모델
  ///
  /// 예외:
  /// - CircleDetailListModelError: 조회 중 오류가 발생한 경우
  Future<CircleDetailListModel> fetchMyApplicationList() async {
    final response = await dio.get(
      '/mypages/aplict-clubs',
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

  /// 분과 목록 조회
  ///
  /// 이 함수는 분과 목록을 조회합니다.
  ///
  /// return: CategoryModel - 조회된 분과 목록을 포함하는 모델
  ///
  /// 예외:
  /// - CategoryModelError: 조회 중 오류가 발생한 경우
  Future<CategoryModel> fetchCategory() async {
    try {
      final response = await dio.get('$basePath/categories');

      logger.d(response.data);

      logger.d(
          'fetchCategory - ${response.realUri} 로 요청 성공! (${response.statusCode})');

      return CategoryModel.fromJson(response.data);
    } catch (e) {
      throw CategoryModelError(message: "에외발생 - $e");
    }
  }

  /// 필터링된 모든 분과 동아리 목록 조회
  ///
  /// 이 함수는 필터링된 모든 분과 동아리 목록을 조회합니다.
  ///
  /// params:
  /// - department: 분과 목록
  ///
  /// return: CircleFilteredListModel - 필터링된 동아리 목록을 포함하는 모델
  ///
  /// 예외:
  /// - CircleFilteredListModelError: 조회 중 오류가 발생한 경우
  Future<CircleFilteredListModel> fetchAllFilteredCircleList(
    List<String> clubCategoryUUIDs,
  ) async {
    final response = await dio.get(
      '$basePath/filter',
      queryParameters: {
        'clubCategoryUUIDs': clubCategoryUUIDs.join(','),
      },
    );

    logger.d(response.data);

    logger.d(
        'fetchAllFilteredCircleList - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return CircleFilteredListModel.fromJson(response.data);
    } else {
      // Bad Request
      throw CircleListModelError.fromJson(response.data);
    }
  }

  /// 필터링된 모집중인 분과 동아리 목록 조회
  ///
  /// 이 함수는 필터링된 모집중인 분과 동아리 목록을 조회합니다.
  ///
  /// params:
  /// - department: 분과 목록
  ///
  /// return: CircleFilteredListModel - 필터링된 동아리 목록을 포함하는 모델
  ///
  /// 예외:
  /// - CircleFilteredListModelError: 조회 중 오류가 발생한 경우
  Future<CircleFilteredListModel> fetchOpenFilteredCircleList(
    List<String> clubCategoryUUIDs,
  ) async {
    final response = await dio.get(
      '$basePath/open/filter',
      queryParameters: {
        'clubCategoryUUIDs': clubCategoryUUIDs.join(','),
      },
    );

    logger.d(response.data);

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
