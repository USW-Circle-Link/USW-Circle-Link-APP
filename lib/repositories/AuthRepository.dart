import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/dio/Dio.dart';
import 'package:usw_circle_link/models/LoginResponse.dart';
import 'package:usw_circle_link/const/data.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final dio = ref.watch(dioProvider);
 
  return AuthRepository(
    baseUrl: 'http://$host:$port/user/me',
    dio: dio,
  );
});

class AuthRepository {
  final String baseUrl;
  final Dio dio;
 
  AuthRepository({
    required this.baseUrl,
    required this.dio,
  });
 
  Future<LoginResponse> login({
    required String id,
    required String password,
  }) async {
        final serialized = base64Encode(utf8.encode('$id:$password'));
 
    final response = await dio.post(
      '$baseUrl/login',
      options: Options(
        headers: {
          'authorization': 'Basic $serialized',
        },
      ),
    );
 
    return LoginResponse.fromJson(response.data);
  }
}