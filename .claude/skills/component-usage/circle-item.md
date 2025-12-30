# CircleItem

동아리 목록 아이템 컴포넌트

## 파일 위치

- 컴포넌트: [lib/widgets/circle_item/circle_item.dart](../../../lib/widgets/circle_item/circle_item.dart)
- 스타일: [lib/widgets/circle_item/circle_item_styles.dart](../../../lib/widgets/circle_item/circle_item_styles.dart)

## Import

```dart
import 'package:usw_circle_link/widgets/circle_item/circle_item.dart';
```

## 사용법

### 기본 사용
```dart
CircleItem(
  circle: circleData,
  onTap: () => _showCircleDetail(circleData),
)
```

### 리스트에서 사용
```dart
ListView.builder(
  itemCount: circles.length,
  itemBuilder: (context, index) => CircleItem(
    circle: circles[index],
    onTap: () => _showCircleDetail(circles[index]),
  ),
)
```

## 표시 정보

- 동아리 로고/썸네일
- 동아리 이름
- 카테고리 태그
- 모집 상태 뱃지 (모집 중/모집 마감)
- 간략한 소개

## Props

| 속성 | 타입 | 필수 | 설명 |
|------|------|------|------|
| circle | CircleData | O | 동아리 데이터 |
| onTap | VoidCallback | O | 탭 콜백 |
| style | CircleItemStyle | X | 스타일 설정 |

## 관련 컴포넌트

- [CircleList](circle-list.md) - 동아리 목록
- [CircleGroup](circle-group.md) - 동아리 그룹
- [CircleDetailOverlay](circle-detail-overlay.md) - 동아리 상세 오버레이
