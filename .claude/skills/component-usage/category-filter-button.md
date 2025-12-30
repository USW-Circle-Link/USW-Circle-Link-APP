# CategoryFilterButton

카테고리 필터 버튼 컴포넌트

## 파일 위치

- 컴포넌트: [lib/widgets/category_filter_button/category_filter_button.dart](../../../lib/widgets/category_filter_button/category_filter_button.dart)
- 스타일: [lib/widgets/category_filter_button/category_filter_button_styles.dart](../../../lib/widgets/category_filter_button/category_filter_button_styles.dart)

## Import

```dart
import 'package:usw_circle_link/widgets/category_filter_button/category_filter_button.dart';
```

## 사용법

### 기본 사용
```dart
CategoryFilterButton(
  selectedCategories: selectedCategories,
  onPressed: () => _showCategoryPicker(),
)
```

### 전체 예시
```dart
class _MyWidgetState extends State<MyWidget> {
  List<CategoryData> selectedCategories = [];

  void _showCategoryPicker() async {
    final result = await showDialog<List<CategoryData>>(
      context: context,
      builder: (_) => CategoryPicker(
        initialSelection: selectedCategories,
      ),
    );
    if (result != null) {
      setState(() => selectedCategories = result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CategoryFilterButton(
      selectedCategories: selectedCategories,
      onPressed: _showCategoryPicker,
    );
  }
}
```

## 스타일 속성

| 속성 | 타입 | 기본값 | 설명 |
|------|------|--------|------|
| selectedBackgroundColor | Color | Color(0xFFFFB052) | 선택 시 배경색 |
| unselectedBackgroundColor | Color | Colors.white | 미선택 시 배경색 |
| selectedForegroundColor | Color | Colors.white | 선택 시 전경색 |
| unselectedForegroundColor | Color | Color(0xFFFFB052) | 미선택 시 전경색 |
| selectedBorderColor | Color | Color(0xFFFF9A21) | 선택 시 테두리 색상 |
| unselectedBorderColor | Color | Color(0xFF959595) | 미선택 시 테두리 색상 |
| borderRadius | double | 12 | 모서리 둥글기 |
| iconSize | double | 18 | 필터 아이콘 크기 |

## Props

| 속성 | 타입 | 필수 | 설명 |
|------|------|------|------|
| selectedCategories | List<CategoryData> | O | 선택된 카테고리 목록 |
| onPressed | VoidCallback | O | 버튼 클릭 콜백 |
| style | CategoryFilterButtonStyle | X | 스타일 설정 |
