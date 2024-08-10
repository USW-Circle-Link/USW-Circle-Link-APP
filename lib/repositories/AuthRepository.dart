import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/dio/Dio.dart';
import 'package:usw_circle_link/models/ChangePWModel.dart';
import 'package:usw_circle_link/const/data.dart';
import 'package:usw_circle_link/models/UserModel.dart';
import 'package:usw_circle_link/utils/logger/Logger.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final dio = ref.watch(dioProvider);

  return AuthRepository(
    baseUrl: 'http://$host:$port/users',
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

  Future<UserModelBase> login({
    required String id,
    required String password,
  }) async {
    final body = {
      'account': id,
      'password': password,
    };

    final response = await dio.post(
      '$baseUrl/login',
      data: body,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        }
      ),
    );

    logger.d('AuthRepository - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return UserModel.fromJson(response.data);
    } else { // Bad Request
      throw  UserModelError.fromJson(response.data);
    }
  }

  Future<ChangePWModelBase> changePW({
    required String userPw,
    required String newPw,
    required String confirmNewPw,
  }) async {
    final response = await dio.patch('$baseUrl/:accessToken/userpw',
        data: {
          'userPw': userPw,
          'newPw': newPw,
          'confirmNewPw': confirmNewPw,
        },
        options: Options(headers: {'accessToken': 'true', 'onPath': 'true'}));

    if (response.statusCode == 200) {
      return ChangePWModel.fromJson(response.data);
    } else {
      // Bad Request
      return ChangePWModelError.fromJson(response.data);
    }
  }
}
