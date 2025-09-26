import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_frame/flutter_web_frame.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upgrader/upgrader.dart';
import 'package:usw_circle_link/models/aps_payload.dart';
import 'package:usw_circle_link/router/router.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';
import 'package:usw_circle_link/viewmodels/fcm_view_model.dart';
import 'package:usw_circle_link/viewmodels/profile_view_model.dart';
import 'package:usw_circle_link/firebase_options.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingHandler(RemoteMessage message) async {
  logger.d('백그라운드 알림 수신 완료!');
  logger.d('- contentAvailable : ${message.contentAvailable}');
  logger.d('- mutableContent : ${message.mutableContent}');
  logger.d('- notification : ${message.notification?.body}');
  logger.d('- data : ${message.data}');
  //await analytics.logEvent(name: 'message_received');
  final notificationBody = message.notification?.body ?? 'No message body';
  // SharedPreferences를 사용하여 백그라운드에서도 알림을 저장
  final prefs = await SharedPreferences.getInstance();
  final notifications = prefs.getStringList('notifications') ?? [];
  notifications.add(notificationBody);
  await prefs.setStringList('notifications', notifications);
}

@pragma('vm:entry-point')
void onDidReceiveNotificationResponse(NotificationResponse details) {
  logger.d(details);
  logger.d(details.payload);
}

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // Native Splash
  //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // 화면 방향 설정
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  // Firebase 초기화
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // background 수신처리
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingHandler);
  await setupFlutterNotifications();

  // await Upgrader.clearSavedSettings();

  final container = ProviderContainer();

  container.listen(profileViewModelProvider, (previous, next) {
    next.whenData((profile) {
      logger.d('자동 로그인 완료: $profile');
      if (profile != null) {
        //FlutterNativeSplash.remove();
      }
    });
  });

  runApp(
    ProviderScope(
      parent: container,
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
    'com.usw.flag.donggurami.high_importance_channel', // id
    '동구라미 알림 채널', // title
    description: '이 채널은 합격여부 알림을 위해서 사용됩니다.', // description
    importance: Importance.high,
  );
  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  bool? result = await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin>()
      ?.initialize(DarwinInitializationSettings(),
          onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
          onDidReceiveBackgroundNotificationResponse:
              onDidReceiveNotificationResponse);

  logger.d('iOS - $result');

  result = await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.initialize(AndroidInitializationSettings("ic_notification"),
          onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
          onDidReceiveBackgroundNotificationResponse:
              onDidReceiveNotificationResponse);

  logger.d('Android - $result');
  if (!kIsWeb) {
    // iOS foreground notification 권한
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    // IOS background 권한 체킹 , 요청
    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );
  }
  // 셋팅flag 설정
  isFlutterLocalNotificationsInitialized = true;
}

const appcastURL =
    'https://raw.githubusercontent.com/USW-Circle-Link/USW-Circle-Link-APP/refs/heads/main/appcast.xml';
final upgrader = Upgrader(
  messages: UpgraderMessages(code: 'ko'),
  debugLogging: true,
  storeController: UpgraderStoreController(
    onAndroid: () => UpgraderAppcastStore(appcastURL: appcastURL),
    oniOS: () => UpgraderAppcastStore(appcastURL: appcastURL),
  ),
);
final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class CircleLink extends ConsumerWidget {
  const CircleLink({super.key});

  static const platform = MethodChannel('com.usw.circle_link.notifications');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    platform.setMethodCallHandler((call) async {
      logger.d('setMethodCallHandler');
      logger.d('call.method: ${call.method}');
      logger.d('call.arguments: ${call.arguments}');
      logger.d('call.arguments type: ${call.arguments.runtimeType}');
      if (call.method == 'storeNotification') {
        final message = APNSPayload.fromMap(call.arguments);
        logger.d('message: $message');
        ref
            .read(firebaseCloudMessagingViewModelProvider.notifier)
            .addNotification(message.aps.alert.body ?? '');
      }
    });
    return FlutterWebFrame(
      maximumSize: const Size(475.0, 812.0),
      enabled: kIsWeb,
      builder: (context) {
        return ClipRect(
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.white,
              ),
            ),
            routerConfig: ref.read(routerProvider),
            builder: (context, child) {
              return UpgradeAlert(
                showIgnore: false,
                upgrader: upgrader,
                navigatorKey:
                    ref.read(routerProvider).routerDelegate.navigatorKey,
                child: child,
              );
            },
          ),
        );
      },
    );
  }
}
