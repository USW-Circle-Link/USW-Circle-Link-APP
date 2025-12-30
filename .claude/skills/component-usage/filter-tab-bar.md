# FilterTabBar

전체/모집중 필터를 위한 탭 바 컴포넌트

## 파일 위치

- 컴포넌트: [lib/widgets/filter_tab_bar/filter_tab_bar.dart](../../../lib/widgets/filter_tab_bar/filter_tab_bar.dart)
- 스타일: [lib/widgets/filter_tab_bar/filter_tab_bar_styles.dart](../../../lib/widgets/filter_tab_bar/filter_tab_bar_styles.dart)

## Import

```dart
import 'package:usw_circle_link/widgets/filter_tab_bar/filter_tab_bar.dart';
```

## 사용법

### 기본 사용
```dart
class _MyWidgetState extends State<MyWidget> {
  bool isAllSelected = true;

  @override
  Widget build(BuildContext context) {
    return FilterTabBar(
      isAllSelected: isAllSelected,
      onAllSelected: () => setState(() => isAllSelected = true),
      onRecruitingSelected: () => setState(() => isAllSelected = false),
    );
  }
}
```

### 커스텀 스타일
```dart
FilterTabBar(
  isAllSelected: isAllSelected,
  onAllSelected: onAllSelected,
  onRecruitingSelected: onRecruitingSelected,
  style: FilterTabBarStyle.defaultStyle.copyWith(
    selectedTextColor: Colors.blue,
    selectedBorderColor: Colors.blue,
  ),
)
```

## 스타일 속성

| 속성 | 타입 | 기본값 | 설명 |
|------|------|--------|------|
| selectedBorderColor | Color | Colors.black | 선택된 탭 하단 테두리 색상 |
| foregroundColor | Color | Color(0xffffB052) | 전경색 |
| padding | EdgeInsetsGeometry | EdgeInsets.symmetric(horizontal: 10, vertical: 20) | 버튼 패딩 |
| selectedTextColor | Color | Colors.black | 선택된 탭 텍스트 색상 |
| unselectedTextColor | Color | Color(0xffA8A8A8) | 미선택 탭 텍스트 색상 |
| fontSize | double | 16 | 텍스트 크기 |
| fontWeight | FontWeight | FontWeight.w700 | 텍스트 굵기 |

## Props

| 속성 | 타입 | 필수 | 설명 |
|------|------|------|------|
| isAllSelected | bool | O | '전체' 탭 선택 여부 |
| onAllSelected | VoidCallback | O | '전체' 탭 클릭 콜백 |
| onRecruitingSelected | VoidCallback | O | '모집 중' 탭 클릭 콜백 |
| style | FilterTabBarStyle | X | 스타일 설정 |
