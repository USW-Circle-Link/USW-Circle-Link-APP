import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/dio/dio.dart';
import 'package:usw_circle_link/const/data.dart';
import 'package:usw_circle_link/models/delete_user_model.dart';
import 'package:usw_circle_link/utils/logger/Logger.dart';

final deleteUserRepositoryProvider = Provider<DeleteUserRepository>((ref) {
  final dio = ref.watch(dioProvider);

  return DeleteUserRepository(
    baseUrl: 'http://$host:$port/users',
    dio: dio,
  );
});

class DeleteUserRepository {
  final String baseUrl;
  final Dio dio;

  DeleteUserRepository({
    required this.baseUrl,
    required this.dio,
  });

  Future<DeleteUserModel> sendCode() async {
    final response = await dio.post(
      '$baseUrl/exit/send-code',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    logger.d(response.data);

    logger
        .d('sendCode - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return DeleteUserModel.fromJson(response.data)
          .setType(DeleteUserModelType.sendCode);
    } else {
      throw DeleteUserModelError.fromJson(response.data)
          .setType(DeleteUserModelType.sendCode);
    }
  }

  Future<DeleteUserModel> verifyCode({
    required String code,
  }) async {
    final body = {
      "authCode": code,
    };
    final response = await dio.delete(
      '$baseUrl/exit',
      data: body,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'accessToken': 'true',
        },
      ),
    );

    logger.d(response.data);

    logger.d(
        'verifyCode - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return DeleteUserModel.fromJson(response.data)
          .setType(DeleteUserModelType.verifyCode);
    } else {
      throw DeleteUserModelError.fromJson(response.data)
          .setType(DeleteUserModelType.verifyCode);
    }
  }
}
