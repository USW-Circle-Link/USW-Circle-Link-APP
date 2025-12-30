# RemovableChip

삭제 가능한 칩 컴포넌트

## 파일 위치

- 컴포넌트: [lib/widgets/removable_chip/removable_chip.dart](../../../lib/widgets/removable_chip/removable_chip.dart)
- 스타일: [lib/widgets/removable_chip/removable_chip_styles.dart](../../../lib/widgets/removable_chip/removable_chip_styles.dart)

## Import

```dart
import 'package:usw_circle_link/widgets/removable_chip/removable_chip.dart';
```

## 사용법

### 기본 사용
```dart
RemovableChip(
  label: '스포츠',
  onDeleted: () => removeCategory('스포츠'),
)
```

### 커스텀 스타일
```dart
RemovableChip(
  label: '문화',
  onDeleted: () => removeCategory('문화'),
  style: RemovableChipStyle.defaultStyle.copyWith(
    backgroundColor: Colors.blue.shade50,
    borderColor: Colors.blue,
    labelColor: Colors.blue,
  ),
)
```

## 스타일 속성

| 속성 | 타입 | 기본값 | 설명 |
|------|------|--------|------|
| backgroundColor | Color | Colors.white | 배경색 |
| borderColor | Color | Color(0xFFFF9A21) | 테두리 색상 |
| borderRadius | double | 15 | 모서리 둥글기 |
| labelColor | Color | Color(0xFF434343) | 라벨 텍스트 색상 |
| labelFontWeight | FontWeight | FontWeight.w300 | 라벨 텍스트 굵기 |
| deleteIconSize | double | 16 | 삭제 아이콘 크기 |
| labelPadding | EdgeInsetsGeometry | EdgeInsets.only(left: 10) | 라벨 패딩 |
| padding | EdgeInsetsGeometry | EdgeInsets.zero | 전체 패딩 |

## Props

| 속성 | 타입 | 필수 | 설명 |
|------|------|------|------|
| label | String | O | 칩 라벨 텍스트 |
| onDeleted | VoidCallback | O | 삭제 버튼 클릭 콜백 |
| style | RemovableChipStyle | X | 스타일 설정 |
