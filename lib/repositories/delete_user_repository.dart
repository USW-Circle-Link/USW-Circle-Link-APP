import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/dio/Dio.dart';
import 'package:usw_circle_link/models/delete_user_model.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';

final deleteUserRepositoryProvider = Provider<DeleteUserRepository>((ref) {
  final dio = ref.watch(dioProvider);

  return DeleteUserRepository(
    basePath: '/users',
    dio: dio,
  );
});

class DeleteUserRepository {
  final String basePath;
  final Dio dio;

  DeleteUserRepository({
    required this.basePath,
    required this.dio,
  });

  Future<bool> sendCode() async {
    final response = await dio.post(
      '$basePath/exit/send-code',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'accessToken': 'true',
        },
      ),
    );

    logger.d(response.data);

    logger
        .d('sendCode - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return true;
    } else {
      throw DeleteUserModelError.fromJson(response.data);
    }
  }

  Future<bool> verifyCode({
    required String code,
  }) async {
    final body = {
      "authCode": code,
    };
    final response = await dio.delete(
      '$basePath/exit',
      data: body,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'accessToken': 'true',
          'refreshToken': 'true'
        },
      ),
    );

    logger.d(response.data);

    logger.d(
        'verifyCode - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return true;
    } else {
      throw DeleteUserModelError.fromJson(response.data);
    }
  }

  Future<String> getEmail() async {
    final response = await dio.get(
      '$basePath/exit/email',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'accessToken': 'true',
        },
      ),
    );

    logger.d(response.data);

    logger
        .d('getEmail - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return response.data['message'];
    } else {
      throw DeleteUserModelError.fromJson(response.data);
    }
  }
}
