import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/secure_storage/secure_storage.dart';
import 'package:usw_circle_link/utils/interceptor/default_interceptor.dart';
import 'package:usw_circle_link/utils/interceptor/token_interceptor.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio();

  final storage = ref.watch(secureStorageProvider);

  dio.interceptors.addAll([
    DefaultInterceptor(),
    TokenInterceptor(storage: storage, ref: ref),
  ]);

  return dio;
});
