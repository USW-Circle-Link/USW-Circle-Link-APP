# CloudMessaging

Firebase Cloud Messaging (FCM) 위젯

## 파일 위치

- 컴포넌트: [lib/widgets/cloud_messaging/cloud_messaging.dart](../../../lib/widgets/cloud_messaging/cloud_messaging.dart)
- 스타일: [lib/widgets/cloud_messaging/cloud_messaging_styles.dart](../../../lib/widgets/cloud_messaging/cloud_messaging_styles.dart)

## Import

```dart
import 'package:usw_circle_link/widgets/cloud_messaging/cloud_messaging.dart';
```

## 사용법

### 기본 사용 (앱 최상위에서)
```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CloudMessaging(
      child: MaterialApp(
        // ...
      ),
    );
  }
}
```

## 기능

- FCM 토큰 관리
- 포그라운드 알림 처리
- 백그라운드 알림 처리
- 알림 클릭 시 라우팅

## 플랫폼별 동작

### Web
- 웹 플랫폼에서는 로컬 알림 기능이 비활성화됨
- `kIsWeb` 체크로 분기 처리

### iOS/Android
- 로컬 알림 표시
- 알림 권한 요청
- 딥링크 처리

## Props

| 속성 | 타입 | 필수 | 설명 |
|------|------|------|------|
| child | Widget | O | 자식 위젯 |

## 관련 컴포넌트

- [NotificationOverlay](notification-overlay.md) - 알림 오버레이
