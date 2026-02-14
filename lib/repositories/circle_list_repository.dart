import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/dio/Dio.dart';
import 'package:usw_circle_link/models/category_model.dart';
import 'package:usw_circle_link/models/circle_detail_list_model.dart';
import 'package:usw_circle_link/models/circle_list_model.dart';
import 'package:usw_circle_link/models/response/circle_list_response.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';

import '../models/response/global_exception.dart';
import '../utils/result.dart';

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
  Future<Result<CircleListModel>> fetchAllCircleList() async {
    try {
      final response = await dio.get(basePath);

      logger.d('${response.data}');

      logger.d(
          'fetchAllCircleList - ${response.realUri} 로 요청 성공! (${response.statusCode})');

      if (response.statusCode == 200) {
        return Result.ok(
          CircleListModel.fromJson(response.data)
              .setType(CircleListModelType.all),
        );
      } else {
        return Result.error(GlobalException.fromJson(response.data));
      }
    } on Exception catch (e) {
      return Result.error(e.toGlobalException(screen: 'CircleList_FetchAll'));
    }
  }

  /// 모집중인 분과 동아리 목록 조회
  Future<Result<CircleListModel>> fetchOpenCircleList() async {
    try {
      final response = await dio.get(
        basePath,
        queryParameters: {
          'open': true,
        },
      );

      logger.d('${response.data}');

      logger.d(
          'fetchOpenCircleList - ${response.realUri} 로 요청 성공! (${response.statusCode})');

      if (response.statusCode == 200) {
        return Result.ok(
          CircleListModel.fromJson(response.data)
              .setType(CircleListModelType.department),
        );
      } else {
        return Result.error(GlobalException.fromJson(response.data));
      }
    } on Exception catch (e) {
      return Result.error(e.toGlobalException(screen: 'CircleList_FetchOpen'));
    }
  }

  /// 소속 동아리 목록 조회
  Future<Result<CircleDetailListModel>> fetchMyCircleList() async {
    try {
      final response = await dio.get(
        '/users/me/clubs',
        options: Options(
          headers: {
            'accessToken': 'true',
          },
        ),
      );

      logger.d('${response.data}');

      logger.d(
          'fetchMyCircleList - ${response.realUri} 로 요청 성공! (${response.statusCode})');

      if (response.statusCode == 200) {
        return Result.ok(CircleDetailListModel.fromJson(response.data));
      } else {
        return Result.error(GlobalException.fromJson(response.data));
      }
    } on Exception catch (e) {
      return Result.error(
          e.toGlobalException(screen: 'CircleList_FetchMyCircle'));
    }
  }

  /// 내 신청 동아리 목록 조회
  Future<Result<CircleDetailListModel>> fetchMyApplicationList() async {
    try {
      final response = await dio.get(
        '/users/me/applications',
        options: Options(
          headers: {
            'accessToken': 'true',
          },
        ),
      );

      logger.d('${response.data}');

      logger.d(
          'fetchMyApplicationList - ${response.realUri} 로 요청 성공! (${response.statusCode})');

      if (response.statusCode == 200) {
        return Result.ok(CircleDetailListModel.fromJson(response.data));
      } else {
        return Result.error(GlobalException.fromJson(response.data));
      }
    } on Exception catch (e) {
      return Result.error(
          e.toGlobalException(screen: 'CircleList_FetchMyApplication'));
    }
  }

  /// 분과 목록 조회
  Future<Result<CategoryModel>> fetchCategory() async {
    try {
      final response = await dio.get('/categories');

      logger.d(response.data);

      logger.d(
          'fetchCategory - ${response.realUri} 로 요청 성공! (${response.statusCode})');

      if (response.statusCode == 200) {
        return Result.ok(CategoryModel.fromJson(response.data));
      } else {
        return Result.error(GlobalException.fromJson(response.data));
      }
    } on Exception catch (e) {
      return Result.error(
          e.toGlobalException(screen: 'CircleList_FetchCategory'));
    }
  }

  /// 필터링된 모든 분과 동아리 목록 조회
  Future<Result<CircleFilteredListModel>> fetchAllFilteredCircleList(
    List<String> clubCategoryUUIDs,
  ) async {
    try {
      final response = await dio.get(
        basePath,
        queryParameters: {
          'filter': clubCategoryUUIDs,
        },
      );

      logger.d(response.data);

      logger.d(
          'fetchAllFilteredCircleList - ${response.realUri} 로 요청 성공! (${response.statusCode})');

      if (response.statusCode == 200) {
        return Result.ok(CircleFilteredListModel.fromJson(response.data));
      } else {
        return Result.error(GlobalException.fromJson(response.data));
      }
    } on Exception catch (e) {
      return Result.error(
          e.toGlobalException(screen: 'CircleList_FetchFilteredAll'));
    }
  }

  /// 필터링된 모집중인 분과 동아리 목록 조회
  Future<Result<CircleFilteredListModel>> fetchOpenFilteredCircleList(
    List<String> clubCategoryUUIDs,
  ) async {
    try {
      final response = await dio.get(
        basePath,
        queryParameters: {
          'open': true,
          'filter': clubCategoryUUIDs,
        },
      );

      logger.d(response.data);

      logger.d(
          'fetchOpenFilteredCircleList - ${response.realUri} 로 요청 성공! (${response.statusCode})');

      if (response.statusCode == 200) {
        return Result.ok(CircleFilteredListModel.fromJson(response.data));
      } else {
        return Result.error(GlobalException.fromJson(response.data));
      }
    } on Exception catch (e) {
      return Result.error(
          e.toGlobalException(screen: 'CircleList_FetchFilteredOpen'));
    }
  }

  Future<Result<CircleListResponse>> fetchCircleList() async {
    try {
      final response = await dio.get('$basePath/list');

      logger.d(response.data);

      logger.d(
          'fetchCircleList - ${response.realUri} 로 요청 성공! (${response.statusCode})');

      if (response.statusCode == 200) {
        return Result.ok(CircleListResponse.fromJson(response.data));
      } else {
        return Result.error(GlobalException.fromJson(response.data));
      }
    } on Exception catch (e) {
      return Result.error(e.toGlobalException(screen: 'CircleList_Fetch'));
    }
  }
}
