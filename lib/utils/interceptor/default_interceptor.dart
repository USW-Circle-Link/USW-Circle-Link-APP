import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/notifier/abnormal_access_notifier.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';

class DefaultInterceptor extends Interceptor {
  final Ref ref;

  DefaultInterceptor({required this.ref});

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.validateStatus = (status) {
      return status != null && status < 500 && status != 401;
    };

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 500) {
      logger.e(err.response?.data);
    } else if (err.response?.statusCode == 401) {
      logger.e(err.response?.data);
    }
    return handler.next(err);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    logger.d(response.data);
    if (response.data['additionalData'] != null) {
      ref.read(abnormalAccessNotifierProvider.notifier).notify();
      handler.next(
        Response(
          statusCode: 400,
          requestOptions: response.requestOptions,
          data: {
            'message': '비정상적인 접근입니다.',
            'code': 'ABNORMAL-ACCESS',
          },
        ),
      );
      return;
    }
    handler.next(response);
  }
}
