import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/firebase_options.dart';

final fcmRepositoryProvider = Provider<FCMRepository>((ref) {
  return FCMRepository();
});

class FCMRepository {
  const FCMRepository();

  Future<String> getToken() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    final token = await FirebaseMessaging.instance.getToken();
    if (token != null) {
      return token;
    } else {
      throw FCMTokenNotFoundException();
    }
  }

  Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    await Firebase.initializeApp();
    print("Handling a background message: ${message.messageId}");
  }
}

class FCMTokenNotFoundException implements Exception {}
