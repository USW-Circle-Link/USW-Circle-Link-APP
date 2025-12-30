# EmailTextFieldWithButton

버튼이 포함된 이메일 입력 필드 컴포넌트

## 파일 위치

- 컴포넌트: [lib/widgets/email_text_field_with_button/email_text_field_with_button.dart](../../../lib/widgets/email_text_field_with_button/email_text_field_with_button.dart)
- 스타일: [lib/widgets/email_text_field_with_button/email_text_field_with_button_styles.dart](../../../lib/widgets/email_text_field_with_button/email_text_field_with_button_styles.dart)

## Import

```dart
import 'package:usw_circle_link/widgets/email_text_field_with_button/email_text_field_with_button.dart';
```

## 사용법

### 기본 사용
```dart
EmailTextFieldWithButton(
  controller: _emailController,
  hintText: '이메일 입력',
  buttonText: '인증',
  onButtonPressed: () => sendVerificationEmail(),
)
```

### 인증 코드 발송 예시
```dart
EmailTextFieldWithButton(
  controller: _emailController,
  hintText: '학교 이메일 입력',
  buttonText: isEmailSent ? '재발송' : '인증',
  isButtonEnabled: isValidEmail && !isSending,
  onButtonPressed: () async {
    setState(() => isSending = true);
    await sendVerificationCode(_emailController.text);
    setState(() {
      isSending = false;
      isEmailSent = true;
    });
  },
)
```

## 기능

- 이메일 입력 필드와 버튼 통합
- 버튼 활성화/비활성화 상태
- 로딩 상태 표시

## Props

| 속성 | 타입 | 필수 | 설명 |
|------|------|------|------|
| controller | TextEditingController | O | 텍스트 컨트롤러 |
| hintText | String? | X | 힌트 텍스트 |
| buttonText | String | O | 버튼 텍스트 |
| onButtonPressed | VoidCallback | O | 버튼 클릭 콜백 |
| isButtonEnabled | bool | X | 버튼 활성화 여부 |

## 관련 컴포넌트

- [EmailTextField](email-text-field.md) - 이메일 텍스트 필드
- [RoundedEmailField](rounded-email-field.md) - 둥근 이메일 필드
