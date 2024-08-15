import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'package:usw_circle_link/notifier/notification_state_notifier.dart';

final notificationViewModelProvider = Provider<NotificationViewModel>((ref) {
  return NotificationViewModel(ref: ref);
});

class NotificationViewModel {
  final Ref ref;

  NotificationViewModel({required this.ref});

  final String apiUrl = 'https://yourserver.com/api/notifications';

  void initializeFCM() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      final notificationBody = message.notification?.body ?? 'No message body';
      ref.read(notificationProvider.notifier).addNotification(notificationBody);
      _sendNotificationToServer(notificationBody);
    });
  }

  Future<void> _sendNotificationToServer(String message) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{'message': message}),
      );
      if (response.statusCode != 200) {
        throw Exception('Failed to send notification');
      }
    } catch (e) {
      print('Error sending notification to server: $e');
    }
  }
}
