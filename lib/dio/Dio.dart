import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/secure_storage/SecureStorage.dart';
import 'package:usw_circle_link/utils/interceptor/TokenInterceptor.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio();
 
  final storage = ref.watch(secureStorageProvider);
 
  dio.interceptors.add(
    TokenInterceptor(storage: storage, ref: ref),
  );
 
  return dio;
});