import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/dio/Dio.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';

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

  Future<String> getToken() async {
    if (Firebase.apps.isEmpty) {
      // 초기화 되지 않은 경우 초기화
      await Firebase.initializeApp();
    }

    // iOS
    String? token;
    if (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.macOS) {
      token = await FirebaseMessaging.instance.getToken();
    }
    // Android
    else {
      token = await FirebaseMessaging.instance.getToken();
    }

    if (token != null) {
      return token;
    } else {
      throw FCMTokenNotFoundException();
    }
  }

  Future<void> sendToken() async {
    final token = await getToken();
    logger.d('FCM Token 불러오기 성공! - $token');

    final body = {
      'fcmToken': token,
    };

    final response = await dio.patch(
      '$basePath/fcmtoken',
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
      // TODO:성공 State 반환 필요
    } else {
      // Bad Request
      throw Exception();
    }
  }
}

class FCMTokenNotFoundException implements Exception {}
