# CircleCertificateDialog

동아리 인증 코드 입력 다이얼로그 컴포넌트

## 파일 위치

- 컴포넌트: [lib/widgets/circle_certificate_dialog/circle_certificate_dialog.dart](../../../lib/widgets/circle_certificate_dialog/circle_certificate_dialog.dart)
- 스타일: [lib/widgets/circle_certificate_dialog/circle_certificate_dialog_styles.dart](../../../lib/widgets/circle_certificate_dialog/circle_certificate_dialog_styles.dart)

## Import

```dart
import 'package:usw_circle_link/widgets/circle_certificate_dialog/circle_certificate_dialog.dart';
```

## 사용법

### 기본 사용
```dart
showDialog(
  context: context,
  builder: (_) => CircleCertificateDialog(),
);
```

### DialogManager를 통한 사용
```dart
await DialogManager.instance.showCircleCertificateDialog(context);
```

## 기능

### 인증 코드 입력
- 숫자 키보드 타입
- 인증코드 입력 힌트 텍스트

### 상태 표시
- **로딩 중**: "로딩중..." 텍스트, 버튼 비활성화
- **에러**: 빨간색 에러 메시지 표시
- **성공**: 녹색 "🥳🎉👏 인증 완료 🥳🎉👏" 메시지

### 버튼
- **확인**: 인증 코드 제출 (성공 시 숨김)
- **취소/입장하기**: 성공 전 "취소", 성공 후 "입장하기"

## 디자인

- 반투명 블러 배경 (BackdropFilter)
- 어두운 배경색 (rgba(25, 21, 29, 0.80))
- 둥근 모서리 (14px)

## 연동

이 컴포넌트는 `eventCertificateViewModelProvider`와 연동됩니다:

```dart
// 인증 코드 확인
ref.read(eventCertificateViewModelProvider.notifier).verify(code);

// 상태 감시
final isLoading = ref.watch(
  eventCertificateViewModelProvider.select((state) => state.isLoading)
);
final error = ref.watch(
  eventCertificateViewModelProvider.select((state) => state.error)
);
final isSuccess = ref.watch(
  eventCertificateViewModelProvider.select((state) => state.isSuccess)
);
```

## Props

이 컴포넌트는 props가 없습니다.
상태는 Riverpod Provider를 통해 관리됩니다.
