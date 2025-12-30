# PolicyDialog

약관 다이얼로그 컴포넌트

## 파일 위치

- 컴포넌트: [lib/widgets/policy_dialog/policy_dialog.dart](../../../lib/widgets/policy_dialog/policy_dialog.dart)
- 스타일: [lib/widgets/policy_dialog/policy_dialog_styles.dart](../../../lib/widgets/policy_dialog/policy_dialog_styles.dart)

## Import

```dart
import 'package:usw_circle_link/widgets/policy_dialog/policy_dialog.dart';
```

## 사용법

### 기본 사용
```dart
showDialog(
  context: context,
  builder: (_) => PolicyDialog(
    title: '이용약관',
    content: termsOfServiceText,
  ),
);
```

### 개인정보 처리 방침
```dart
showDialog(
  context: context,
  builder: (_) => PolicyDialog(
    title: '개인정보 처리 방침',
    content: privacyPolicyText,
  ),
);
```

## 기능

- 긴 텍스트 스크롤 지원
- 제목과 내용 분리
- 닫기 버튼

## Props

| 속성 | 타입 | 필수 | 설명 |
|------|------|------|------|
| title | String | O | 약관 제목 |
| content | String | O | 약관 내용 |

## 관련 컴포넌트

- [AlertTextDialog](alert-text-dialog.md) - 일반 알림 다이얼로그
