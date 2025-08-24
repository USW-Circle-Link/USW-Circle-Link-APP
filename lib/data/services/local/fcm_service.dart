import 'package:firebase_messaging/firebase_messaging.dart';

// 백그라운드 메시지 핸들러 (Top-level function)
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // TODO: 백그라운드 메시지 수신 시 처리 로직 (e.g. 로컬 알림 표시)
  print("Handling a background message: ${message.messageId}");
}

class FCMService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initialize() async {
    // 권한 요청
    await _firebaseMessaging.requestPermission();

    // 포그라운드 메시지 핸들링
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // TODO: 포그라운드 메시지 수신 시 처리 로직 (e.g. 인앱 알림 UI 표시)
      print('Got a message whilst in the foreground!');
      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });

    // 백그라운드 메시지 핸들러 등록
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  Future<String?> getToken() async {
    return "dummyToken";
  }
}