import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../config/constants.dart';

class CustomInterceptor extends Interceptor {
  final FlutterSecureStorage storage;
  final String baseUrl;

  CustomInterceptor({required this.storage, required this.baseUrl});

  @override
  void onRequest(RequestOptions options,
      RequestInterceptorHandler handler) async {
    final accessToken = await storage.read(key: accessTokenKey);
    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final refreshTokenValue = await storage.read(key: refreshTokenKey);
      if (refreshTokenValue == null) {
        // TODO: 로그아웃 처리
        return super.onError(err, handler);
      }

      try {
        final refreshDio = Dio(BaseOptions(
          baseUrl: baseUrl,
        ));

        final refreshResponse = await refreshDio.post(
          '/auth/refresh', // TODO: 실제 토큰 재발급 API 경로 확인 필요
          options: Options(
            headers: {'Authorization': 'Bearer $refreshTokenValue'},
          ),
        );

        final newAccessToken = refreshResponse.data['accessToken'];
        final newRefreshToken = refreshResponse.data['refreshToken'];
        await storage.write(key: accessTokenKey, value: newAccessToken);
        await storage.write(key: refreshTokenKey, value: newRefreshToken);

        err.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';
        final response = await refreshDio.fetch(err.requestOptions);
        return handler.resolve(response);
      } on DioException {
        // TODO: 리프레시 토큰 만료 시 로그아웃 처리
        return super.onError(err, handler);
      }
    }
    super.onError(err, handler);
  }
}