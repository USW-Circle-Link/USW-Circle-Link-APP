# AlertTextDialog

알림 다이얼로그 컴포넌트

## 파일 위치

- 컴포넌트: [lib/widgets/alert_text_dialog/alert_text_dialog.dart](../../../lib/widgets/alert_text_dialog/alert_text_dialog.dart)
- 스타일: [lib/widgets/alert_text_dialog/alert_text_dialog_styles.dart](../../../lib/widgets/alert_text_dialog/alert_text_dialog_styles.dart)

## Import

```dart
import 'package:usw_circle_link/widgets/alert_text_dialog/alert_text_dialog.dart';
```

## 사용법

### 확인 버튼만 있는 다이얼로그
```dart
showDialog(
  context: context,
  builder: (_) => AlertTextDialog(
    title: '알림',
    content: '처리가 완료되었습니다.',
    leftButtonText: '확인',
  ),
);
```

### 확인/취소 버튼이 있는 다이얼로그
```dart
showDialog(
  context: context,
  builder: (_) => AlertTextDialog(
    title: '로그아웃',
    content: '정말 로그아웃 하시겠습니까?',
    leftButtonText: '취소',
    rightButtonText: '확인',
    onRightButtonPressed: () => logout(),
  ),
);
```

### 뒤로가기 방지
```dart
AlertTextDialog(
  title: '처리 중',
  content: '잠시만 기다려주세요.',
  leftButtonText: '확인',
  canPop: false,
  onPopInvoked: () => print('뒤로가기 시도'),
)
```

### 커스텀 버튼 스타일
```dart
AlertTextDialog(
  title: '삭제',
  content: '정말 삭제하시겠습니까?',
  leftButtonText: '취소',
  rightButtonText: '삭제',
  rightButtonTextStyle: TextStyle(
    color: Colors.red,
    fontWeight: FontWeight.bold,
  ),
)
```

## 스타일 속성

| 속성 | 타입 | 기본값 | 설명 |
|------|------|--------|------|
| backgroundColor | Color | Colors.white | 다이얼로그 배경색 |
| borderRadius | double | 14 | 모서리 둥글기 |
| padding | EdgeInsetsGeometry | all(24) | 내용 영역 패딩 |
| titleColor | Color | Colors.black | 제목 색상 |
| titleFontSize | double | 17 | 제목 폰트 크기 |
| titleFontWeight | FontWeight | FontWeight.w600 | 제목 폰트 굵기 |
| contentColor | Color | Color(0xFF767676) | 내용 색상 |
| contentFontSize | double | 13 | 내용 폰트 크기 |
| contentFontWeight | FontWeight | FontWeight.w400 | 내용 폰트 굵기 |
| dividerColor | Color | Color(0xFFE5E5EA) | 구분선 색상 |
| buttonColor | Color | Color(0xFF007AFF) | 버튼 텍스트 색상 |
| buttonHeight | double | 44 | 버튼 높이 |

## Props

| 속성 | 타입 | 필수 | 설명 |
|------|------|------|------|
| title | String? | X | 다이얼로그 제목 |
| content | String? | X | 다이얼로그 내용 |
| leftButtonText | String? | X | 왼쪽 버튼 텍스트 |
| rightButtonText | String? | X | 오른쪽 버튼 텍스트 |
| onLeftButtonPressed | VoidCallback? | X | 왼쪽 버튼 콜백 |
| onRightButtonPressed | VoidCallback? | X | 오른쪽 버튼 콜백 |
| leftButtonTextStyle | TextStyle? | X | 왼쪽 버튼 텍스트 스타일 |
| rightButtonTextStyle | TextStyle? | X | 오른쪽 버튼 텍스트 스타일 |
| canPop | bool | X | 뒤로가기 허용 여부 (기본값: true) |
| onPopInvoked | VoidCallback? | X | 뒤로가기 시도 콜백 |
| style | AlertTextDialogStyle | X | 스타일 설정 |
