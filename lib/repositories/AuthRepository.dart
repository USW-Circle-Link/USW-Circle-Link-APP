import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/dio/Dio.dart';
import 'package:usw_circle_link/models/ChangePWModel.dart';
import 'package:usw_circle_link/const/data.dart';
import 'package:usw_circle_link/models/SignUpModel.dart';
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

  Future<SignUpModel> verifyId({
    required String id,
  }) async {
    final response = await dio.get(
      '$baseUrl/verify-duplicate/$id',
    );

    logger
        .d('verifyId - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return SignUpModel.fromJson(response.data)
          .setType(SignUpModelType.verify);
    } else {
      // Bad Request
      throw SignUpModel.fromJson(response.data)
          .setType(SignUpModelType.validatePasswordMatch);
    }
  }

  Future<SignUpModel> validatePasswordMatch({
    required String password,
    required String passwordConfirm,
  }) async {
    final body = {
      "password": password,
      "confirmPassword": passwordConfirm,
    };

    final response = await dio.post(
      '$baseUrl/users/validate-passwords-match',
      data: body,
    );

    logger
        .d('validatePasswordMatch - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return SignUpModel.fromJson(response.data)
          .setType(SignUpModelType.validatePasswordMatch);
    } else {
      // Bad Request
      throw SignUpModelError.fromJson(response.data)
          .setType(SignUpModelType.validatePasswordMatch);
    }
  }

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
      options: Options(headers: {
        'Content-Type': 'application/json',
      }),
    );

    logger.d('login - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return UserModel.fromJson(response.data);
    } else {
      // Bad Request
      throw UserModelError.fromJson(response.data);
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
