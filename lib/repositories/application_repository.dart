import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/dio/Dio.dart';
import 'package:usw_circle_link/models/response/application_response.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';

import '../models/response/global_exception.dart';
import '../utils/result.dart';

final applicationRepositoryProvider = Provider<ApplicationRepository>((ref) {
  final dio = ref.watch(dioProvider);

  return ApplicationRepository(
    basePath: '/apply',
    dio: dio,
  );
});

class ApplicationRepository {
  final Dio dio;
  final String basePath;

  ApplicationRepository({
    required this.dio,
    required this.basePath,
  });

  Future<Result<bool>> checkAvailableForApplication({
    required String clubUUID,
  }) async {
    try {
      final response = await dio.get(
        '$basePath/can-apply/$clubUUID',
        options: Options(headers: {'accessToken': 'true'}),
      );

      logger.d('${response.data}');

      logger.d(
          'checkAvailableForApplication - ${response.realUri} 로 요청 성공! (${response.statusCode})');

      if (response.statusCode == 200) {
        return Result.ok(response.data['message'] == '지원 가능');
      } else {
        // Bad Request
        return Result.error(GlobalException.fromJson(response.data));
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Future<Result<String>> getApplication({
    required String clubUUID,
  }) async {
    try {
      final response = await dio.get(
        '$basePath/$clubUUID',
        options: Options(headers: {'accessToken': 'true'}),
      );

      logger.d('${response.data}');

      logger.d(
          'getApplication - ${response.realUri} 로 요청 성공! (${response.statusCode})');

      if (response.statusCode == 200) {
        final url = ApplicationResponse.fromJson(response.data).data;
        if (url == null) {
          return Result.error(GlobalException(
            code: "CINT-202",
            message: "지원서가 등록되지 않았습니다.",
            screen: "Application_GetApplication",
          ));
        }
        return Result.ok(url);
      } else {
        // Bad Request
        return Result.error(GlobalException.fromJson(response.data));
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Future<Result<void>> apply({
    required String clubUUID,
  }) async {
    try {
      final response = await dio.post(
        '$basePath/$clubUUID',
        data: {},
        options: Options(
          headers: {'accessToken': 'true'},
        ),
      );

      logger.d('${response.data}');

      logger.d('apply - ${response.realUri} 로 요청 성공! (${response.statusCode})');

      if (response.statusCode == 200) {
        return Result.ok(null);
      } else {
        // Bad Request
        return Result.error(GlobalException.fromJson(response.data));
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
