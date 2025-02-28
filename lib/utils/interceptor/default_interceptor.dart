import 'package:dio/dio.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';

class DefaultInterceptor extends Interceptor {
  DefaultInterceptor();

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
}
