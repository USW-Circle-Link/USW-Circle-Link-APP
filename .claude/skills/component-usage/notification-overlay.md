# NotificationOverlay

알림 오버레이 컴포넌트

## 파일 위치

- 컴포넌트: [lib/widgets/notification_overlay/notification_overlay.dart](../../../lib/widgets/notification_overlay/notification_overlay.dart)
- 스타일: [lib/widgets/notification_overlay/notification_overlay_styles.dart](../../../lib/widgets/notification_overlay/notification_overlay_styles.dart)

## Import

```dart
import 'package:usw_circle_link/widgets/notification_overlay/notification_overlay.dart';
```

## 사용법

### 기본 사용
```dart
NotificationOverlay(
  title: '새 알림',
  message: '동아리 가입 신청이 승인되었습니다.',
  onTap: () => navigateToNotifications(),
  onDismiss: () => hideNotification(),
)
```

### OverlayEntry로 표시
```dart
OverlayEntry? _overlayEntry;

void showNotification(String title, String message) {
  _overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: MediaQuery.of(context).padding.top + 10,
      left: 10,
      right: 10,
      child: NotificationOverlay(
        title: title,
        message: message,
        onDismiss: () => _overlayEntry?.remove(),
      ),
    ),
  );
  Overlay.of(context).insert(_overlayEntry!);
}
```

## 기능

- 상단에서 슬라이드 인 애니메이션
- 자동 숨김 (일정 시간 후)
- 탭하여 상세 페이지로 이동
- 스와이프하여 닫기

## Props

| 속성 | 타입 | 필수 | 설명 |
|------|------|------|------|
| title | String | O | 알림 제목 |
| message | String | O | 알림 내용 |
| onTap | VoidCallback? | X | 탭 콜백 |
| onDismiss | VoidCallback? | X | 닫기 콜백 |

## 관련 컴포넌트

- [CloudMessaging](cloud-messaging.md) - FCM 메시징 위젯
