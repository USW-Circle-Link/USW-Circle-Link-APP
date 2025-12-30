# CircleGroup

동아리 그룹 컴포넌트 (카테고리별 그룹화)

## 파일 위치

- 컴포넌트: [lib/widgets/circle_group/circle_group.dart](../../../lib/widgets/circle_group/circle_group.dart)
- 스타일: [lib/widgets/circle_group/circle_group_styles.dart](../../../lib/widgets/circle_group/circle_group_styles.dart)

## Import

```dart
import 'package:usw_circle_link/widgets/circle_group/circle_group.dart';
```

## 사용법

### 기본 사용
```dart
CircleGroup(
  categoryName: '스포츠',
  circles: sportsCircles,
  onItemTap: (circle) => _showCircleDetail(circle),
)
```

### 전체 예시
```dart
ListView(
  children: categories.map((category) {
    final categoryCircles = circles
      .where((c) => c.category == category.name)
      .toList();

    return CircleGroup(
      categoryName: category.name,
      circles: categoryCircles,
      onItemTap: _showCircleDetail,
      onSeeMore: () => _navigateToCategory(category),
    );
  }).toList(),
)
```

## 기능

- 카테고리별 동아리 그룹 표시
- 카테고리 헤더
- 가로 스크롤 동아리 목록
- "더보기" 버튼

## Props

| 속성 | 타입 | 필수 | 설명 |
|------|------|------|------|
| categoryName | String | O | 카테고리 이름 |
| circles | List<CircleData> | O | 동아리 목록 |
| onItemTap | Function(CircleData) | O | 아이템 탭 콜백 |
| onSeeMore | VoidCallback? | X | 더보기 버튼 콜백 |
| style | CircleGroupStyle | X | 스타일 설정 |

## 관련 컴포넌트

- [CircleList](circle-list.md) - 동아리 목록
- [CircleItem](circle-item.md) - 동아리 아이템
