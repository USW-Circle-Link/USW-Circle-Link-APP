import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:usw_circle_link/firebase_options.dart';
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
      name:'USW_Circle_Link',
    );

    FirebaseMessaging.onMessage.listen(_firebaseMessagingHandler);

    logger.d('Firebase 초기화 성공!');
  }

  // 메시지 핸들러
  Future<void> _firebaseMessagingHandler(RemoteMessage message) async {
    logger.d('알림 수신 완료 - $message');
    //await analytics.logEvent(name: 'message_received');
    final notificationBody = message.notification?.body ?? 'No message body';
    addNotification(notificationBody);
  }

  Future<String> getToken() async {
    return fcmRepository.getToken();
  }

  // SharedPreferences에서 알림 목록을 불러오는 메서드
  Future<void> loadNotifications() async {
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
