import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/dio/Dio.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';

import '../utils/result.dart';

final fcmRepositoryProvider = Provider<FCMRepository>((ref) {
  final dio = ref.watch(dioProvider);

  return FCMRepository(
    basePath: '/club-leader',
    dio: dio,
  );
});

class FCMRepository {
  final String basePath;
  final Dio dio;

  const FCMRepository({
    required this.basePath,
    required this.dio,
  });

  Future<Result<String>> getToken() async {
    try {
      if (kIsWeb) {
        return Result.error(FCMTokenNotFoundException());
      }

      if (Firebase.apps.isEmpty) {
        await Firebase.initializeApp();
      }

      final token = await FirebaseMessaging.instance.getToken();

      if (token != null) {
        return Result.ok(token);
      } else {
        return Result.error(FCMTokenNotFoundException());
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Future<Result<void>> sendToken() async {
    try {
      final tokenResult = await getToken();
      switch (tokenResult) {
        case Ok(:final value):
          final token = value;
          logger.d('FCM Token 불러오기 성공!');

          final body = {
            'fcmToken': token,
          };

          final response = await dio.patch(
            '/clubs/fcmtoken',
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
              'sendFCMToken - ${response.realUri} 로 요청 성공! (${response.statusCode})');

          if (response.statusCode == 200) {
            return Result.ok(null);
          } else {
            return Result.error(Exception('FCM 토큰 전송 실패'));
          }
        case Error(:final error):
          return Result.error(error);
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}

class FCMTokenNotFoundException implements Exception {}
