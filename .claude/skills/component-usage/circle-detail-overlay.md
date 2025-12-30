# CircleDetailOverlay

동아리 상세 정보 오버레이 컴포넌트

## 파일 위치

- 컴포넌트: [lib/widgets/circle_detail_overlay/circle_detail_overlay.dart](../../../lib/widgets/circle_detail_overlay/circle_detail_overlay.dart)
- 스타일: [lib/widgets/circle_detail_overlay/circle_detail_overlay_styles.dart](../../../lib/widgets/circle_detail_overlay/circle_detail_overlay_styles.dart)

## Import

```dart
import 'package:usw_circle_link/widgets/circle_detail_overlay/circle_detail_overlay.dart';
```

## 사용법

### 기본 사용
```dart
showDialog(
  context: context,
  builder: (_) => CircleDetailOverlay(
    circle: circleData,
  ),
);
```

### 전체 예시
```dart
void _showCircleDetail(CircleData circle) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => CircleDetailOverlay(
      circle: circle,
      onApply: () => _applyToCircle(circle),
    ),
  );
}
```

## 기능

- 동아리 상세 정보 표시
- 모집 상태 표시
- 지원하기 버튼
- 스크롤 가능한 내용

## 표시 정보

- 동아리 로고/이미지
- 동아리 이름
- 카테고리
- 모집 상태
- 소개글
- 활동 내용
- SNS 링크

## Props

| 속성 | 타입 | 필수 | 설명 |
|------|------|------|------|
| circle | CircleData | O | 동아리 데이터 |
| onApply | VoidCallback? | X | 지원하기 버튼 콜백 |

## 관련 컴포넌트

- [CircleItem](circle-item.md) - 동아리 아이템
- [CircleList](circle-list.md) - 동아리 목록
- [CircleDetailItem](circle-detail-item.md) - 동아리 상세 아이템
