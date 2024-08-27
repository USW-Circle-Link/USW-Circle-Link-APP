import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final fcmRepositoryProvider = Provider<FCMRepository>((ref) {
  return FCMRepository();
});

class FCMRepository {
  const FCMRepository();

  Future<String> getToken() async {
    await Firebase.initializeApp();

    final token = await FirebaseMessaging.instance.getToken();
    if (token != null) {
      return token;
    } else {
      throw FCMTokenNotFoundException();
    }
  }
}

class FCMTokenNotFoundException implements Exception {}
