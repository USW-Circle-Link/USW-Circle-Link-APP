import 'dart:html' as html;

/// 웹 환경에서 브라우저 Notification API를 사용하여 알림 표시
void showWebNotification(String title, String body) {
  if (html.Notification.supported) {
    html.Notification.requestPermission().then((permission) {
      if (permission == 'granted') {
        html.Notification(title, body: body, icon: '/icons/Icon-192.png');
      }
    });
  }
}
