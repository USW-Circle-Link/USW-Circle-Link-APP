# EmailTextField

이메일 입력 전용 텍스트 필드 컴포넌트

## 파일 위치

- 컴포넌트: [lib/widgets/email_text_field/email_text_field.dart](../../../lib/widgets/email_text_field/email_text_field.dart)
- 스타일: [lib/widgets/email_text_field/email_text_field_styles.dart](../../../lib/widgets/email_text_field/email_text_field_styles.dart)

## Import

```dart
import 'package:usw_circle_link/widgets/email_text_field/email_text_field.dart';
```

## 사용법

### 기본 사용
```dart
EmailTextField(
  controller: _emailController,
  hintText: '이메일 입력',
)
```

## 기능

- 이메일 키보드 타입 자동 설정
- 이메일 형식 힌트
- 접두사/접미사 아이콘 지원

## 관련 컴포넌트

- [RoundedEmailField](rounded-email-field.md) - 둥근 이메일 필드
- [EmailTextFieldWithButton](email-text-field-with-button.md) - 버튼 포함 이메일 필드
- [RoundedTextField](rounded-text-field.md) - 일반 텍스트 필드
