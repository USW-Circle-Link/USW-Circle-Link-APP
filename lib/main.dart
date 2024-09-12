import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:usw_circle_link/router/router.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingHandler);
  final token = await FirebaseMessaging.instance.getToken();
  logger.d('FCM Token - $token');

  runApp(
    ProviderScope(
      child: CircleLink(),
    ),
  );
}

Future<void> _firebaseMessagingHandler(RemoteMessage message) async {
  logger.d('백그라운드 알림 수신 완료 - $message');
  //await analytics.logEvent(name: 'message_received');
  final notificationBody = message.notification?.body ?? 'No message body';
  // SharedPreferences를 사용하여 백그라운드에서도 알림을 저장
  final prefs = await SharedPreferences.getInstance();
  final notifications = prefs.getStringList('notifications') ?? [];
  notifications.add(notificationBody);
  await prefs.setStringList('notifications', notifications);
}

class CircleLink extends ConsumerWidget {
  const CircleLink({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
        ),
      ),
      routerConfig: ref.read(routerProvider),
    );
  }
}
