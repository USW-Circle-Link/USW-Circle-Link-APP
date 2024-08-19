import 'package:dio/dio.dart';

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
    return handler.next(err);
  }
}
