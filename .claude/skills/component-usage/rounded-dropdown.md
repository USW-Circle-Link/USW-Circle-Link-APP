# RoundedDropdown

둥근 모서리 드롭다운 컴포넌트

## 파일 위치

- 컴포넌트: [lib/widgets/rounded_dropdown/rounded_dropdown.dart](../../../lib/widgets/rounded_dropdown/rounded_dropdown.dart)
- 스타일: [lib/widgets/rounded_dropdown/rounded_dropdown_styles.dart](../../../lib/widgets/rounded_dropdown/rounded_dropdown_styles.dart)

## Import

```dart
import 'package:usw_circle_link/widgets/rounded_dropdown/rounded_dropdown.dart';
```

## 사용법

### 기본 사용
```dart
RoundedDropdown<String>(
  items: ['옵션1', '옵션2', '옵션3'],
  value: selectedValue,
  onChanged: (value) => setState(() => selectedValue = value),
  hintText: '선택하세요',
)
```

### 객체 리스트와 함께
```dart
RoundedDropdown<CategoryData>(
  items: categories,
  value: selectedCategory,
  onChanged: (category) => setState(() => selectedCategory = category),
  itemBuilder: (category) => Text(category.name),
  hintText: '카테고리 선택',
)
```

## 기능

- 둥근 모서리 디자인
- 제네릭 타입 지원
- 커스텀 아이템 빌더
- 힌트 텍스트 지원

## Props

| 속성 | 타입 | 필수 | 설명 |
|------|------|------|------|
| items | List<T> | O | 드롭다운 아이템 목록 |
| value | T? | X | 현재 선택된 값 |
| onChanged | Function(T?) | O | 값 변경 콜백 |
| hintText | String? | X | 힌트 텍스트 |
| itemBuilder | Widget Function(T)? | X | 아이템 빌더 |

## 관련 컴포넌트

- [RoundedTextField](rounded-text-field.md) - 둥근 텍스트 필드
