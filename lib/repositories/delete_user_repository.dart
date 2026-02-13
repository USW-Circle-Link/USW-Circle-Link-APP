import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../dio/Dio.dart';
import '../models/response/global_exception.dart';
import '../utils/logger/logger.dart';

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

  /// 회원 탈퇴 인증 코드 발송 및 이메일 반환
  Future<String> sendCode() async {
    final response = await dio.post(
      '/auth/withdrawal/code',
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
      return response.data['message'];
    } else {
      throw GlobalException.fromJson(response.data);
    }
  }

  Future<bool> verifyCode({
    required String code,
  }) async {
    final body = {
      "authCode": code,
    };
    final response = await dio.delete(
      '/users/me',
      data: body,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'accessToken': 'true',
          if (!kIsWeb) 'refreshToken': 'true'
        },
      ),
    );

    logger.d(response.data);

    logger.d(
        'verifyCode - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return true;
    } else {
      throw GlobalException.fromJson(response.data);
    }
  }

  Future<String> getEmail() async {
    final response = await dio.post(
      '/auth/withdrawal/code',
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
      throw GlobalException.fromJson(response.data);
    }
  }
}
