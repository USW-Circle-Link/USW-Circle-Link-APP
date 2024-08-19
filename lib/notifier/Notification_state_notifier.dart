import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationStateNotifier extends StateNotifier<List<String>> {
  NotificationStateNotifier() : super([]) {
    _loadNotifications();
  }

  // SharedPreferences에서 알림 목록을 불러오는 메서드
  Future<void> _loadNotifications() async {
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

// StateNotifierProvider 정의
final notificationProvider =
    StateNotifierProvider<NotificationStateNotifier, List<String>>((ref) {
  return NotificationStateNotifier();
});

final notificationViewModelProvider = Provider<NotificationViewModel>((ref) {
  return NotificationViewModel(ref: ref);
});

class NotificationViewModel {
  final Ref ref;

  NotificationViewModel({required this.ref});

  void initializeFCM() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      final notificationBody = message.notification?.body ?? 'No message body';
      ref.read(notificationProvider.notifier).addNotification(notificationBody);

    });
  }

}