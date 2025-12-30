# SelectedCategoryChipList

선택된 카테고리 칩 목록 컴포넌트

## 파일 위치

- 컴포넌트: [lib/widgets/selected_category_chip_list/selected_category_chip_list.dart](../../../lib/widgets/selected_category_chip_list/selected_category_chip_list.dart)
- 스타일: [lib/widgets/selected_category_chip_list/selected_category_chip_list_styles.dart](../../../lib/widgets/selected_category_chip_list/selected_category_chip_list_styles.dart)

## Import

```dart
import 'package:usw_circle_link/widgets/selected_category_chip_list/selected_category_chip_list.dart';
```

## 사용법

### 기본 사용
```dart
SelectedCategoryChipList(
  selectedCategories: selectedCategories,
  onChipDeleted: (category) {
    setState(() {
      selectedCategories.remove(category);
    });
  },
)
```

### 전체 예시
```dart
class _FilterScreenState extends State<FilterScreen> {
  List<CategoryData> selectedCategories = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 필터 버튼
        CategoryFilterButton(
          selectedCategories: selectedCategories,
          onPressed: _showCategoryPicker,
        ),

        // 선택된 카테고리 칩 목록
        SelectedCategoryChipList(
          selectedCategories: selectedCategories,
          onChipDeleted: (category) {
            setState(() {
              selectedCategories.remove(category);
            });
          },
        ),

        // 동아리 목록
        Expanded(
          child: CircleList(
            categories: selectedCategories,
          ),
        ),
      ],
    );
  }
}
```

## 동작

- 선택된 카테고리가 없으면 빈 위젯(`SizedBox.shrink()`) 반환
- 가로 스크롤 가능한 칩 목록 표시
- 각 칩은 `RemovableChip` 컴포넌트 사용

## 스타일

| 속성 | 값 | 설명 |
|------|-----|------|
| Container 높이 | 60 | 고정 높이 |
| Container 배경 | Colors.white | 흰색 배경 |
| 왼쪽 패딩 | 24 | 왼쪽 여백 |
| 칩 간격 | 10 | 칩 사이 간격 |

## Props

| 속성 | 타입 | 필수 | 설명 |
|------|------|------|------|
| selectedCategories | List<CategoryData> | O | 선택된 카테고리 목록 |
| onChipDeleted | Function(CategoryData) | O | 칩 삭제 콜백 |

## 관련 컴포넌트

- [RemovableChip](removable-chip.md) - 개별 칩 컴포넌트
- [CategoryFilterButton](category-filter-button.md) - 카테고리 필터 버튼
- [CategoryPicker](category-picker.md) - 카테고리 선택 다이얼로그
