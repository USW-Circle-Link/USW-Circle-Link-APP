import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart'
    hide Options;
import 'package:usw_circle_link/const/data.dart';
import 'package:usw_circle_link/models/user_model.dart';
import 'package:usw_circle_link/utils/decoder/jwt_decoder.dart';
import 'package:usw_circle_link/utils/logger/Logger.dart';
import 'package:usw_circle_link/viewmodels/user_view_model.dart';

class TokenInterceptor extends Interceptor {
  final Ref ref;
  final FlutterSecureStorage storage;

  TokenInterceptor({
    required this.ref,
    required this.storage,
  });

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.headers['accessToken'] == 'true') {
      // 헤더 삭제
      options.headers.remove('accessToken');

      final accessToken = await storage.read(key: accessTokenKey);
      logger.d("헤더에 액세스 토큰 추가 중 ... - $accessToken");

      if (accessToken == null) {
        return handler.reject(
          DioException(
            requestOptions: options,
            message: "저장소에 토큰이 존재하지 않습니다",
            type: DioExceptionType.cancel,
          ),
        );
      }

      // 실제 토큰으로 대체
      options.headers.addAll({
        'Authorization': 'Bearer $accessToken',
      });
    } else if (options.headers['refreshToken'] == 'true') {
      // 헤더 삭제
      options.headers.remove('refreshToken');

      final refreshToken = await storage.read(key: refreshTokenKey);
      logger.d("헤더에 리프레쉬 토큰 추가 중 ... - $refreshToken");

      // 실제 토큰으로 대체
      options.headers.addAll({
        'Authorization': 'Bearer $refreshToken',
      });
    }

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    logger.w(
        '요청 거부됨 - 상태코드 ${err.response?.statusCode} / 요청경로 ${err.requestOptions.path}');
    // 401 에러가 발생했을 때 (status code)
    // 토큰을 재발급받는 시도를 하고, 토큰이 재발급되면
    // 다시 새로운 토큰을 요청한다.

    // **** 토큰 만료 코드의 경우 response 예외에서 제외 필요 [DefaultInterceptor] ****
    final isStatus401 = err.response?.statusCode == 401;
    final isPathRefresh = err.requestOptions.path == '/auth/refresh-token';

    // token을 refresh하려는 의도가 아니었는데 401 에러가 발생했을 때
    if (isStatus401 && !isPathRefresh) {
      logger.d('액세스 토큰 재발급 중 ... ');

      final refreshToken = await storage.read(key: refreshTokenKey);
      logger.d('저장된 리프레쉬 토큰 - ${refreshToken ?? "없음!"}');

      // refreshToken이 null이면 에러 반환
      if (refreshToken == null) {
        return handler.reject(err);
      }
      // 기존의 refresh token으로 새로운 accessToken 발급 시도
      // 반드시 새로운 Dio 객체를 생성해야 함
      final dio = Dio();

      try {
        final response = await dio.post(
          'http://$host:$port/auth/refresh-token',
          options: Options(
            headers: {
              'Cookie': 'refreshToken=$refreshToken',
            },
          ),
        );

        logger.d(response.data);

        logger.d(
            'refreshAccessToken - ${response.realUri} 로 요청 성공! (${response.statusCode})');

        if (response.statusCode != 200) {
          throw DioException(
            requestOptions: response.requestOptions,
            message: "토큰 재발급 실패!",
            type: DioExceptionType.cancel,
          );
        }
        final data = UserModel.fromJson(response.data).data;

        final accessToken = data.accessToken;
        final newRefreshToken = data.refreshToken;

        final payload = JwtDecoder.decode(accessToken);

        logger.d('onError - payload - $payload');
        // secure storage도 update
        await storage.write(key: accessTokenKey, value: accessToken);
        await storage.write(key: refreshTokenKey, value: newRefreshToken);
        await storage.write(
            key: clubIdsKey, value: jsonEncode(payload['clubIds'] ?? []));

        // 디버깅용 확인 코드
        final accessToken0 = await storage.read(key: accessTokenKey);
        final refreshToken0 = await storage.read(key: refreshTokenKey);
        final clubIdsJsonString = await storage.read(key: clubIdsKey);
        final List<dynamic> clubIds = jsonDecode(clubIdsJsonString ?? "[]");
        logger.d(
            'onError - AccessToken : $accessToken0 / RefreshToken : $refreshToken0 / clubIdsJsonString : $clubIdsJsonString / clubIds : $clubIds 저장 성공!');

        final options = err.requestOptions;

        // 원래 보내려던 요청 재전송
        logger.d('새로운 액세스 토큰으로 요청보내는 중 ... ');

        // 요청의 헤더에 새로 발급받은 accessToken으로 변경하기
        options.headers.addAll({
          'Authorization': 'Bearer $accessToken',
        });

        final newResponse = await dio.fetch(options);

        return handler.resolve(newResponse);
      } on DioException catch (e) {
        logger.e(e);
        // 새로운 Access Token임에도 에러가 발생한다면, Refresh Token마저도 만료된 것임
        await ref.read(userViewModelProvider.notifier).logout();

        return handler.reject(e);
      } catch (e) {
        logger.e(e);
        await ref.read(userViewModelProvider.notifier).logout();
      }
    }

    return handler.reject(err);
  }
}
