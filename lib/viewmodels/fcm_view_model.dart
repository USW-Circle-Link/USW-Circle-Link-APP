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
import 'package:usw_circle_link/utils/command.dart';

final firebaseCloudMessagingViewModelProvider =
    StateNotifierProvider<FirebaseCloudMessagingViewModel, AsyncValue<List<String>>>((ref) {
  final fcmRepository = ref.read(fcmRepositoryProvider);
  return FirebaseCloudMessagingViewModel(
    fcmRepository: fcmRepository,
  );
});

class FirebaseCloudMessagingViewModel extends StateNotifier<AsyncValue<List<String>>> {
  final FCMRepository fcmRepository;
  StreamSubscription<String>? _tokenRefreshSubscription;
  StreamSubscription<RemoteMessage>? _onMessageSubscription;

  late final Command1<void, String> tokenRefreshCommand;

  FirebaseCloudMessagingViewModel({
    required this.fcmRepository,
  }) : super(const AsyncValue.loading()) {
    tokenRefreshCommand = Command1(_refreshTokenAction);
    // loadNotifications 완료 후 포그라운드 리스너 등록 (race condition 방지)
    loadNotifications().then((_) => initializeFCM());
  }

  Future<Result<void>> _refreshTokenAction(String token) async {
    final result = await fcmRepository.sendTokenWith(token);
    switch (result) {
      case Ok():
        logger.d('갱신된 FCM 토큰 전송 성공');
      case Error(:final error):
        logger.e('갱신된 FCM 토큰 전송 실패: $error');
    }
    return result;
  }

  Future<void> initializeFCM() async {
    _onMessageSubscription = FirebaseMessaging.onMessage.listen(_firebaseMessagingHandler);

    final result = await fcmRepository.listenTokenRefresh(
      onRefresh: (token) async {
        await tokenRefreshCommand.execute(token);
      },
    );
    
    switch (result) {
      case Ok(:final value):
        _tokenRefreshSubscription = value;
      case Error(:final error):
        logger.e('FCM 토큰 갱신 리스너 등록 실패: $error');
    }
  }

  @override
  void dispose() {
    _tokenRefreshSubscription?.cancel();
    _onMessageSubscription?.cancel();
    tokenRefreshCommand.dispose();
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
    state = const AsyncValue.loading();
    try {
      final prefs = await SharedPreferences.getInstance();
      final notifications = prefs.getStringList('notifications') ?? [];
      state = AsyncValue.data(notifications);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  // 알림을 추가하고 SharedPreferences에 저장하는 메서드
  Future<void> addNotification(String notification) async {
    if (state.value == null || state.value!.contains(notification)) {
      return;
    }
    final updatedState = [...state.value!, notification];
    state = AsyncValue.data(updatedState);
    await _saveNotifications(updatedState);
  }

  // 알림을 삭제하고 SharedPreferences에 저장하는 메서드
  Future<void> removeNotification(int index) async {
    if (state.value == null) return;
    if (index < 0 || index >= state.value!.length) return;
    final updatedState = [...state.value!]..removeAt(index);
    state = AsyncValue.data(updatedState);
    await _saveNotifications(updatedState);
  }

  // SharedPreferences에 알림 목록을 저장하는 메서드
  Future<void> _saveNotifications(List<String> notifications) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('notifications', notifications);
  }
}
