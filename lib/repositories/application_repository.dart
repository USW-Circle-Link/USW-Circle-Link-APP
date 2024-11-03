import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/dio/dio.dart';
import 'package:usw_circle_link/models/application_model.dart';
import 'package:usw_circle_link/const/data.dart';
import 'package:usw_circle_link/utils/logger/Logger.dart';

final applicationRepositoryProvider = Provider<ApplicationRepository>((ref) {
  final dio = ref.watch(dioProvider);

  return ApplicationRepository(
    baseUrl: '$protocol://$host:$port/apply',
    dio: dio,
  );
});

class ApplicationRepository {
  final Dio dio;
  final String baseUrl;

  ApplicationRepository({
    required this.dio,
    required this.baseUrl,
  });

  Future<ApplicationModel> checkAvailableForApplication({
    required int clubId,
  }) async {
    final response = await dio.get(
      '$baseUrl/can-apply/$clubId',
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
    required int clubId,
  }) async {
    final response = await dio.get(
      '$baseUrl/$clubId',
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
    required int clubId,
    required String aplictGoogleFormUrl,
  }) async {
    final response = await dio.post(
      '$baseUrl/$clubId',
      data: {
        'aplictGoogleFormUrl': aplictGoogleFormUrl,
      },
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
