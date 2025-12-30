# CategoryPicker

카테고리 선택 다이얼로그 컴포넌트

## 파일 위치

- 컴포넌트: [lib/widgets/category_picker/category_picker.dart](../../../lib/widgets/category_picker/category_picker.dart)
- 스타일: [lib/widgets/category_picker/category_picker_styles.dart](../../../lib/widgets/category_picker/category_picker_styles.dart)

## Import

```dart
import 'package:usw_circle_link/widgets/category_picker/category_picker.dart';
```

## 사용법

### 기본 사용
```dart
final result = await showDialog<List<CategoryData>>(
  context: context,
  builder: (_) => CategoryPicker(),
);

if (result != null) {
  setState(() => selectedCategories = result);
}
```

### 초기 선택값과 함께 사용
```dart
final result = await showDialog<List<CategoryData>>(
  context: context,
  builder: (_) => CategoryPicker(
    initialSelection: selectedCategories,
  ),
);
```

## 기능

- 전체 카테고리 목록 표시
- 다중 선택 지원
- 선택된 카테고리 시각적 표시
- 확인/취소 버튼

## 관련 컴포넌트

- [CategoryFilterButton](category-filter-button.md) - 카테고리 필터 버튼
- [SelectedCategoryChipList](selected-category-chip-list.md) - 선택된 카테고리 칩 목록
