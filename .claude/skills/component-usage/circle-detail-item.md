# CircleDetailItem

동아리 상세 정보 아이템 컴포넌트

## 파일 위치

- 컴포넌트: [lib/widgets/circle_detail_item/circle_detail_item.dart](../../../lib/widgets/circle_detail_item/circle_detail_item.dart)
- 스타일: [lib/widgets/circle_detail_item/circle_detail_item_styles.dart](../../../lib/widgets/circle_detail_item/circle_detail_item_styles.dart)

## Import

```dart
import 'package:usw_circle_link/widgets/circle_detail_item/circle_detail_item.dart';
```

## 사용법

### 기본 사용
```dart
CircleDetailItem(
  label: '모집 기간',
  value: '2024.03.01 ~ 2024.03.31',
)
```

### 아이콘과 함께
```dart
CircleDetailItem(
  icon: Icons.calendar_today,
  label: '모집 기간',
  value: '2024.03.01 ~ 2024.03.31',
)
```

### 여러 항목 표시
```dart
Column(
  children: [
    CircleDetailItem(
      label: '카테고리',
      value: circle.category,
    ),
    CircleDetailItem(
      label: '모집 상태',
      value: circle.isRecruiting ? '모집 중' : '모집 마감',
    ),
    CircleDetailItem(
      label: '회원 수',
      value: '${circle.memberCount}명',
    ),
  ],
)
```

## Props

| 속성 | 타입 | 필수 | 설명 |
|------|------|------|------|
| icon | IconData? | X | 왼쪽 아이콘 |
| label | String | O | 라벨 텍스트 |
| value | String | O | 값 텍스트 |
| style | CircleDetailItemStyle | X | 스타일 설정 |

## 관련 컴포넌트

- [CircleDetailOverlay](circle-detail-overlay.md) - 동아리 상세 오버레이
- [CircleItem](circle-item.md) - 동아리 아이템
