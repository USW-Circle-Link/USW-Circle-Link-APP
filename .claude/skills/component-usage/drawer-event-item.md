# DrawerEventItem

드로어 메뉴의 이벤트 아이템 컴포넌트

## 파일 위치

- 컴포넌트: [lib/widgets/drawer_event_item/drawer_event_item.dart](../../../lib/widgets/drawer_event_item/drawer_event_item.dart)
- 스타일: [lib/widgets/drawer_event_item/drawer_event_item_styles.dart](../../../lib/widgets/drawer_event_item/drawer_event_item_styles.dart)

## Import

```dart
import 'package:usw_circle_link/widgets/drawer_event_item/drawer_event_item.dart';
```

## 사용법

### 기본 사용
```dart
buildDrawerEventItem(
  title: '동아리의 밤 입장하기',
  onTap: () async {
    await ref
      .read(eventCertificateViewModelProvider.notifier)
      .getStatus();
  },
)
```

## 기능

- 특별 이벤트용 메뉴 아이템
- 일반 DrawerItem과 다른 스타일
- 그라데이션 배경 지원

## Props

| 속성 | 타입 | 필수 | 설명 |
|------|------|------|------|
| title | String | O | 이벤트 제목 |
| onTap | VoidCallback | O | 탭 콜백 |
| style | DrawerEventItemStyle | X | 스타일 설정 |

## 관련 컴포넌트

- [DrawerItem](drawer-item.md) - 일반 드로어 메뉴 아이템
- [LoggedInMenu](logged-in-menu.md) - 드로어 메뉴
