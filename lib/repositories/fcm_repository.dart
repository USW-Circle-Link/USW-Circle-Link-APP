import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/const/data.dart';
import 'package:usw_circle_link/dio/dio.dart';
import 'package:usw_circle_link/utils/logger/Logger.dart';

final fcmRepositoryProvider = Provider<FCMRepository>((ref) {
  final dio = ref.watch(dioProvider);
  
  return FCMRepository(
    baseUrl: 'https://$host:$port/club-leader',
    dio: dio,
  );
});

class FCMRepository {
  final String baseUrl;
  final Dio dio;

  const FCMRepository({
    required this.baseUrl,
    required this.dio,
  });

  Future<String> getToken() async {
    await Firebase.initializeApp();

    final token = await FirebaseMessaging.instance.getToken();
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
      '$baseUrl/fcmtoken',
      data: body,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'accessToken' : 'true,'
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
