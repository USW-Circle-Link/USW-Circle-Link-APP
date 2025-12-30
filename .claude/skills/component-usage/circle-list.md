# CircleList

동아리 목록 컴포넌트

## 파일 위치

- 컴포넌트: [lib/widgets/circle_list/circle_list.dart](../../../lib/widgets/circle_list/circle_list.dart)
- 스타일: [lib/widgets/circle_list/circle_list_styles.dart](../../../lib/widgets/circle_list/circle_list_styles.dart)

## Import

```dart
import 'package:usw_circle_link/widgets/circle_list/circle_list.dart';
```

## 사용법

### 기본 사용
```dart
CircleList(
  circles: circleDataList,
  onItemTap: (circle) => _showCircleDetail(circle),
)
```

### 필터링과 함께
```dart
CircleList(
  circles: filteredCircles,
  isLoading: isLoading,
  emptyMessage: '검색 결과가 없습니다',
  onItemTap: (circle) => _showCircleDetail(circle),
  onRefresh: () => _refreshList(),
)
```

## 기능

- 동아리 목록 표시
- 무한 스크롤 (페이지네이션)
- 당겨서 새로고침
- 로딩 상태 표시
- 빈 상태 메시지

## Props

| 속성 | 타입 | 필수 | 설명 |
|------|------|------|------|
| circles | List<CircleData> | O | 동아리 데이터 목록 |
| onItemTap | Function(CircleData) | O | 아이템 탭 콜백 |
| isLoading | bool | X | 로딩 상태 |
| emptyMessage | String? | X | 빈 목록 메시지 |
| onRefresh | Future<void> Function()? | X | 새로고침 콜백 |
| onLoadMore | VoidCallback? | X | 추가 로드 콜백 |

## 관련 컴포넌트

- [CircleItem](circle-item.md) - 동아리 아이템
- [CircleGroup](circle-group.md) - 동아리 그룹
- [CircleDetailOverlay](circle-detail-overlay.md) - 동아리 상세 오버레이
