import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/dio/Dio.dart';
import 'package:usw_circle_link/models/ApplicationModel.dart';
import 'package:usw_circle_link/models/ChangePWModel.dart';
import 'package:usw_circle_link/const/data.dart';
import 'package:usw_circle_link/models/UserModel.dart';
import 'package:usw_circle_link/utils/logger/Logger.dart';

final applicationRepositoryProvider = Provider<ApplicationRepository>((ref) {
  final dio = ref.watch(dioProvider);

  return ApplicationRepository(
    baseUrl: 'http://$host:$port/user/me',
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

  Future<ApplicationModel> getApplication({
    required int clubId,
  }) async {
    final response = await dio.get(
      '$baseUrl/apply/$clubId',
      options: Options(headers: {'accessToken': 'false'}),
    );

    logger.d('${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return ApplicationModel.fromJson(response.data);
    } else {
      // Bad Request
      throw ApplicationModelError.fromJson(response.data).type(ApplicationModelErrorType.getApplication);
    }
  }

  Future<ApplicationModelComplete> apply({
    required int clubId,
    required String aplictGoogleFormUrl,
  }) async {
    final response = await dio.post('$baseUrl/apply/$clubId',
        data: {
          'aplictGoogleFormUrl': aplictGoogleFormUrl,
        },
        options: Options(headers: {'accessToken': 'true'}));

    if (response.statusCode == 200) {
      return ApplicationModelComplete.fromJson(response.data);
    } else {
      // Bad Request
      throw ApplicationModelError.fromJson(response.data).type(ApplicationModelErrorType.apply);
    }
  }
}
