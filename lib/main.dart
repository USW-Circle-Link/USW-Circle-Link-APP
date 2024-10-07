import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:usw_circle_link/router/router.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingHandler(RemoteMessage message) async {
  logger.d('백그라운드 알림 수신 완료! - ${message.mutableContent}');
  //await analytics.logEvent(name: 'message_received');
  final notificationBody = message.notification?.body ?? 'No message body';
  // SharedPreferences를 사용하여 백그라운드에서도 알림을 저장
  final prefs = await SharedPreferences.getInstance();
  final notifications = prefs.getStringList('notifications') ?? [];
  notifications.add(notificationBody);
  await prefs.setStringList('notifications', notifications);
}

void onDeidReceiveNotificationResponse(NotificationResponse details) {
  logger.d(details);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // background 수신처리
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingHandler);
  await setupFlutterNotifications();

  runApp(
    ProviderScope(
      child: CircleLink(),
    ),
  );
}

// 필요 변수
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
late AndroidNotificationChannel channel;
bool isFlutterLocalNotificationsInitialized = false; // 셋팅여부 판단 flag

/// 셋팅 메소드
Future<void> setupFlutterNotifications() async {
  if (isFlutterLocalNotificationsInitialized) {
    return;
  }
  channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.high,
  );
  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()?.initialize(DarwinInitializationSettings(),onDidReceiveNotificationResponse: onDeidReceiveNotificationResponse);
  // iOS foreground notification 권한
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  // IOS background 권한 체킹 , 요청
  await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  // 셋팅flag 설정
  isFlutterLocalNotificationsInitialized = true;
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
