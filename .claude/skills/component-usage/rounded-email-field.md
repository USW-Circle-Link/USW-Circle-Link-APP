# RoundedEmailField

둥근 모서리 이메일 입력 필드 컴포넌트

## 파일 위치

- 컴포넌트: [lib/widgets/rounded_email_field/rounded_email_field.dart](../../../lib/widgets/rounded_email_field/rounded_email_field.dart)
- 스타일: [lib/widgets/rounded_email_field/rounded_email_field_styles.dart](../../../lib/widgets/rounded_email_field/rounded_email_field_styles.dart)

## Import

```dart
import 'package:usw_circle_link/widgets/rounded_email_field/rounded_email_field.dart';
```

## 사용법

### 기본 사용
```dart
RoundedEmailField(
  controller: _emailController,
  hintText: '이메일을 입력하세요',
)
```

### 유효성 검사와 함께
```dart
RoundedEmailField(
  controller: _emailController,
  hintText: '학교 이메일',
  onChanged: (value) {
    // 이메일 유효성 검사
    setState(() {
      isValidEmail = EmailValidator.validate(value);
    });
  },
)
```

## 기능

- 이메일 형식에 최적화된 키보드
- 자동 완성 지원
- 이메일 유효성 검사 힌트

## 관련 컴포넌트

- [RoundedTextField](rounded-text-field.md) - 일반 텍스트 필드
- [EmailTextField](email-text-field.md) - 이메일 텍스트 필드
- [EmailTextFieldWithButton](email-text-field-with-button.md) - 버튼 포함 이메일 필드
