import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:usw_circle_link/router/Router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Firebase 초기화

  runApp(
    ProviderScope(
      child: CircleLink(),
    ),
  );
}

class CircleLink extends ConsumerWidget {
  const CircleLink({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _setupFCM();

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: ref.read(routerProvider),
    );
  }

  // FCM 초기화 및 토큰 가져오기
  Future<void> _setupFCM() async {
    // FCM 인스턴스 가져오기
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    // FCM 토큰 요청
    String? token = await messaging.getToken();
    if (token != null) {
      print("FCM Token: $token"); // FCM 토큰 콘솔 출력
    } else {
      print("Failed to get FCM token");
    }

    // 포그라운드에서 수신한 메시지 처리
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Received a message while in foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });
  }
}
