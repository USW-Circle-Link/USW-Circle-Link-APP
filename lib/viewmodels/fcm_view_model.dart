import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:usw_circle_link/main.dart';
import 'package:usw_circle_link/repositories/fcm_repository.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';
import 'package:usw_circle_link/utils/result.dart';

final firebaseCloudMessagingViewModelProvider =
    StateNotifierProvider<FirebaseCloudMessagingViewModel, List<String>>((ref) {
  final fcmRepository = ref.read(fcmRepositoryProvider);
  return FirebaseCloudMessagingViewModel(
    fcmRepository: fcmRepository,
  );
});

class FirebaseCloudMessagingViewModel extends StateNotifier<List<String>> {
  final FCMRepository fcmRepository;
  StreamSubscription<String>? _tokenRefreshSubscription;

  FirebaseCloudMessagingViewModel({
    required this.fcmRepository,
  }) : super([]) {
    Future.wait([
      initializeFCM(),
      loadNotifications(),
    ]);
  }

  Future<void> initializeFCM() async {
    FirebaseMessaging.onMessage.listen(_firebaseMessagingHandler);
    _tokenRefreshSubscription = fcmRepository.listenTokenRefresh(
      onRefresh: (token) async {
        await sendToken();
      },
    );
  }

  @override
  void dispose() {
    _tokenRefreshSubscription?.cancel();
    super.dispose();
  }

  // fcm 전경 처리 - 로컬 알림 보이기
  void _firebaseMessagingHandler(RemoteMessage message) {
    logger.d('포그라운드 알림 수신 완료!');
    logger.d('- contentAvailable : ${message.contentAvailable}');
    logger.d('- mutableAvailable : ${message.mutableContent}');
    logger.d('- notification : ${message.notification?.body}');
    logger.d('- data : ${message.data}');
    RemoteNotification? notification = message.notification;
    if (notification != null && !kIsWeb) {
      // Android와 iOS 모두 로컬 알림 표시
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
          iOS: DarwinNotificationDetails(
            presentAlert: true,
            presentBadge: true,
            presentSound: true,
          ),
        ),
      );
    }
    final notificationBody = message.notification?.body ?? 'No message body';
    addNotification(notificationBody);
  }

  Future<String?> getToken() async {
    final result = await fcmRepository.getToken();
    switch (result) {
      case Ok(:final value):
        return value;
      case Error():
        return null;
    }
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
    if (state.contains(notification)) {
      return;
    }
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
