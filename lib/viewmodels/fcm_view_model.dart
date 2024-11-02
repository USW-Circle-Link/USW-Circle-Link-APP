import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:usw_circle_link/firebase_options.dart';
import 'package:usw_circle_link/main.dart';
import 'package:usw_circle_link/repositories/fcm_repository.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';

final firebaseCloudMessagingViewModelProvider =
    StateNotifierProvider<FirebaseCloudMessagingViewModel, List<String>>((ref) {
  final fcmRepository = ref.read(fcmRepositoryProvider);
  return FirebaseCloudMessagingViewModel(
    fcmRepository: fcmRepository,
  );
});

class FirebaseCloudMessagingViewModel extends StateNotifier<List<String>> {
  final FCMRepository fcmRepository;

  FirebaseCloudMessagingViewModel({
    required this.fcmRepository,
  }) : super([]) {
    Future.wait([
      initializeFCM(),
      loadNotifications(),
    ]);
  }

  Future<void> initializeFCM() async {
    logger.d('Firebase 초기화 중 ...');
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
      name: 'USW_Circle_Link',
    );

    FirebaseMessaging.onMessage.listen(_firebaseMessagingHandler);

    logger.d('Firebase 초기화 성공!');
  }

  // fcm 전경 처리 - 로컬 알림 보이기
  void _firebaseMessagingHandler(RemoteMessage message) {
    logger.d('포그라운드 알림 수신 완료!');
    logger.d('- contentAvailable : ${message.contentAvailable}');
    logger.d('- contentAvailable : ${message.mutableContent}');
    logger.d('- notification : ${message.notification?.body}');
    logger.d('- data : ${message.data}');
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    if (notification != null && android != null && !kIsWeb) {
      // 웹이 아니면서 안드로이드이고, 알림이 있는경우
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            icon: 'launch_background',
          ),
        ),
      );
    }
    final notificationBody = message.notification?.body ?? 'No message body';
    addNotification(notificationBody);
  }

  Future<String> getToken() async {
    return fcmRepository.getToken();
  }

  Future<void> sendToken() async {
    await fcmRepository.sendToken();
  }

  // SharedPreferences에서 알림 목록을 불러오는 메서드
  Future<void> loadNotifications() async {
    state = [];
    final prefs = await SharedPreferences.getInstance();
    state = prefs.getStringList('notifications') ?? [];
  }

  // 알림을 추가하고 SharedPreferences에 저장하는 메서드
  Future<void> addNotification(String notification) async {
    final updatedState = [...state, notification];
    state = updatedState;
    await _saveNotifications(updatedState);
  }

  // 알림을 삭제하고 SharedPreferences에 저장하는 메서드
  Future<void> removeNotification(int index) async {
    final updatedState = [...state]..removeAt(index);
    state = updatedState;
    await _saveNotifications(updatedState);
  }

  // SharedPreferences에 알림 목록을 저장하는 메서드
  Future<void> _saveNotifications(List<String> notifications) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('notifications', notifications);
  }
}
