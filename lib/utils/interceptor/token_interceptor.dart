import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../const/analytics_const.dart';
import '../../models/login_data.dart';
import '../../utils/logger/logger.dart';
import '../../viewmodels/user_view_model.dart';
import '../../repositories/token_repository.dart';
import '../result.dart';

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

      final result = await ref.read(tokenRepositoryProvider).getTokens();
      switch (result) {
        case Ok():
          logger.d("헤더에 액세스 토큰 추가 중 ... - ${result.value.accessToken}");
          break;
        case Error():
          logger.d("토큰 조회 실패 - ${result.error}");
          return handler.resolve(
            Response(requestOptions: options, statusCode: 401, data: {
              'message': "저장소에 토큰이 존재하지 않습니다",
              'code': "USR-F401",
            }),
          );
      }
      final accessToken = result.value.accessToken;

      // 실제 토큰으로 대체
      options.headers.addAll({
        'Authorization': 'Bearer $accessToken',
      });
    }
    if (options.headers['refreshToken'] == 'true' && !kIsWeb) {
      // 웹 환경에서는 리프레시 토큰 사용 안함 withCredentials 옵션 사용
      // 헤더 삭제
      options.headers.remove('refreshToken');

      final result = await ref.read(tokenRepositoryProvider).getTokens();
      switch (result) {
        case Ok():
          logger.d("헤더에 리프레쉬 토큰 추가 중 ... - ${result.value.refreshToken}");
          break;
        case Error():
          logger.e("토큰 조회 실패 - ${result.error}");
          return handler.reject(
            DioException(
              requestOptions: options,
              message: "저장소에 토큰이 존재하지 않습니다",
              type: DioExceptionType.cancel,
            ),
          );
      }
      final refreshToken = result.value.refreshToken;

      // 실제 토큰으로 대체
      options.headers.addAll({
        'Cookie': 'refreshToken=$refreshToken',
      });
    }

    logger.d('onRequest - options.headers - ${options.headers}');

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    logger.w(
        '요청 거부됨 - 상태코드 ${err.response?.statusCode} / 요청경로 ${err.requestOptions.baseUrl}${err.requestOptions.path}');
    // 401 에러가 발생했을 때 (status code)
    // 토큰을 재발급받는 시도를 하고, 토큰이 재발급되면
    // 다시 새로운 토큰을 요청한다.

    // **** 토큰 만료 코드의 경우 response 예외에서 제외 필요 [DefaultInterceptor] ****
    final isStatus401 = err.response?.statusCode == 401;
    final isPathRefresh =
        err.requestOptions.path.contains('/integration/refresh-token');
    final isPathLogin = err.requestOptions.path.contains('/users/login');

    // token을 refresh하려는 의도가 아니었는데 401 에러가 발생했을 때
    if (isStatus401 && !isPathRefresh && !isPathLogin) {
      logger.d('액세스 토큰 재발급 중 ... ');

      final result = await ref.read(tokenRepositoryProvider).getTokens();
      switch (result) {
        case Error():
          logger.e("리프레시 토큰 조회 실패 - ${result.error}");
          // 토큰이 없을 때 에러 반환
          return handler.reject(err);
        case Ok():
          logger.d('저장된 리프레쉬 토큰 - ${result.value.refreshToken}');
          break;
      }

      final refreshToken = result.value.refreshToken;

      // 기존의 refresh token으로 새로운 accessToken 발급 시도
      // 반드시 새로운 Dio 객체를 생성해야 함
      final dio = Dio(
        BaseOptions(
          baseUrl: err.requestOptions.baseUrl,
          extra: {
            'withCredentials': true,
          },
        ),
      );

      try {
        final response = await dio.post(
          '/integration/refresh-token',
          options: (!kIsWeb)
              ? Options(
                  headers: {
                    'Cookie': 'refreshToken=$refreshToken',
                  },
                )
              : null,
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
        final data = LoginData.fromJson(response.data['data']);

        final result = await ref.read(tokenRepositoryProvider).saveTokens(
              accessToken: data.accessToken,
              refreshToken: data.refreshToken,
            );

        switch (result) {
          case Ok():
            break;
          case Error():
            logger.e("토큰 저장 실패 - ${result.error}");
            return handler.reject(err);
        }

        // 디버깅용 확인 코드
        final _result = await ref.read(tokenRepositoryProvider).getTokens();
        switch (_result) {
          case Ok():
            logger.d(
                'onError - AccessToken : ${_result.value.accessToken} / RefreshToken : ${_result.value.refreshToken} / clubUUIDs : ${_result.value.clubUUIDs} 저장 성공!');
            break;
          case Error():
            logger.e("디버깅용 토큰 조회 실패 - ${_result.error}");
            break;
        }

        final options = err.requestOptions;

        // 원래 보내려던 요청 재전송
        logger.d('새로운 액세스 토큰으로 요청보내는 중 ... ');

        // 요청의 헤더에 새로 발급받은 accessToken으로 변경하기
        options.headers.addAll({
          'Authorization': 'Bearer ${data.accessToken}',
        });

        final newResponse = await dio.fetch(options);

        analytics.logEvent(
          name: AnalyticsEvent.refreshToken,
          parameters: {
            AnalyticsParam.timestamp: DateTime.now().toIso8601String(),
          },
        );

        return handler.resolve(newResponse);
      } on DioException catch (e) {
        /// 네트워크 에러
        /// => 리프레쉬 토큰이 만료된거라면 if 조건문에서 처리
        logger.e(e);

        analytics.logEvent(
          name: AnalyticsEvent.refreshToken,
          parameters: {
            AnalyticsParam.timestamp: DateTime.now().toIso8601String(),
            AnalyticsParam.errorMessage: e.toString(),
          },
        );
        return handler.reject(e);
      } catch (e) {
        logger.e(e);
        await ref.read(userViewModelProvider.notifier).abnormalLogout.execute();
        analytics.logEvent(
          name: AnalyticsEvent.refreshToken,
          parameters: {
            AnalyticsParam.timestamp: DateTime.now().toIso8601String(),
            AnalyticsParam.errorMessage: e.toString(),
          },
        );
      }
    } else if (isStatus401 && isPathLogin) {
      if (err.response != null) {
        return handler.resolve(err.response!);
      }
    }

    return handler.reject(err);
  }
}
