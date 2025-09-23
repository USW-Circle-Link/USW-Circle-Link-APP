import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/dio/Dio.dart';
import 'package:usw_circle_link/models/application_model.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';

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

  Future<ApplicationModel> checkAvailableForApplication({
    required String clubUUID,
  }) async {
    final response = await dio.get(
      '$basePath/can-apply/$clubUUID',
      options: Options(headers: {'accessToken': 'true'}),
    );

    logger.d('${response.data}');

    logger.d(
        'checkAvailableForApplication - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return ApplicationModel.fromJson(response.data)
          .setType(ApplicationModelType.checkAvailableForApplication);
    } else {
      // Bad Request
      throw ApplicationModelError.fromJson(response.data)
          .setType(ApplicationModelType.checkAvailableForApplication);
    }
  }

  Future<ApplicationModel> getApplication({
    required String clubUUID,
  }) async {
    final response = await dio.get(
      '$basePath/$clubUUID',
      options: Options(headers: {'accessToken': 'true'}),
    );

    logger.d('${response.data}');

    logger.d(
        'getApplication - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return ApplicationModel.fromJson(response.data)
          .setType(ApplicationModelType.getApplication);
    } else {
      // Bad Request
      throw ApplicationModelError.fromJson(response.data)
          .setType(ApplicationModelType.getApplication);
    }
  }

  Future<ApplicationModel> apply({
    required String clubUUID,
  }) async {
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
      return ApplicationModel.fromJson(response.data)
          .setType(ApplicationModelType.apply);
    } else {
      // Bad Request
      throw ApplicationModelError.fromJson(response.data)
          .setType(ApplicationModelType.apply);
    }
  }
}
