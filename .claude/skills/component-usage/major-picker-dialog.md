# MajorPickerDialog

학과 선택 다이얼로그 컴포넌트

## 파일 위치

- 컴포넌트: [lib/widgets/major_picker_dialog/major_picker_dialog.dart](../../../lib/widgets/major_picker_dialog/major_picker_dialog.dart)
- 스타일: [lib/widgets/major_picker_dialog/major_picker_dialog_styles.dart](../../../lib/widgets/major_picker_dialog/major_picker_dialog_styles.dart)

## Import

```dart
import 'package:usw_circle_link/widgets/major_picker_dialog/major_picker_dialog.dart';
```

## 사용법

### 기본 사용
```dart
final result = await showDialog<MajorData>(
  context: context,
  builder: (_) => MajorPickerDialog(),
);

if (result != null) {
  setState(() => selectedMajor = result);
}
```

### 초기 선택값과 함께
```dart
final result = await showDialog<MajorData>(
  context: context,
  builder: (_) => MajorPickerDialog(
    initialMajor: selectedMajor,
  ),
);
```

## 기능

- 학과 목록 표시
- 검색 기능
- 단일 선택
- 확인/취소 버튼

## 관련 컴포넌트

- [AlertTextDialog](alert-text-dialog.md) - 일반 알림 다이얼로그
