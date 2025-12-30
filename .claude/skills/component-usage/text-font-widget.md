# TextFontWidget

텍스트 폰트 헬퍼 유틸리티

## 파일 위치

- 컴포넌트: [lib/widgets/text_font_widget/text_font_widget.dart](../../../lib/widgets/text_font_widget/text_font_widget.dart)

## Import

```dart
import 'package:usw_circle_link/widgets/text_font_widget/text_font_widget.dart';
```

## 사용법

### fontRegular (SUIT 폰트)

기본 SUIT 폰트를 사용한 텍스트 위젯

```dart
// 기본 사용
TextFontWidget.fontRegular('텍스트')

// 전체 옵션
TextFontWidget.fontRegular(
  '동아리 이름',
  fontSize: 16,
  color: Colors.black,
  fontWeight: FontWeight.w600,
  textAlign: TextAlign.center,
  height: 1.5,
  letterSpacing: 0.5,
  overflow: TextOverflow.ellipsis,
  maxLines: 2,
  textDecoration: TextDecoration.underline,
  decorationColor: Colors.blue,
)
```

### jalnan2 (Jalnan2 폰트)

Jalnan2 폰트를 사용한 텍스트 위젯 (주로 제목용)

```dart
TextFontWidget.jalnan2(
  '동구라미',
  fontSize: 24,
  color: Colors.black,
  fontWeight: FontWeight.bold,
)
```

### fontRegularStyle (TextStyle 반환)

TextStyle만 필요할 때 사용

```dart
// TextField의 style에 사용
TextField(
  style: TextFontWidget.fontRegularStyle(
    fontSize: 14,
    color: Colors.black,
  ),
)

// Text 위젯에 직접 사용
Text(
  '텍스트',
  style: TextFontWidget.fontRegularStyle(
    fontSize: 16,
    color: Colors.grey,
    fontWeight: FontWeight.w500,
  ),
)
```

## 메서드 목록

### fontRegular

| 파라미터 | 타입 | 필수 | 설명 |
|----------|------|------|------|
| text | String | O | 표시할 텍스트 |
| fontSize | double? | X | 폰트 크기 |
| color | Color? | X | 텍스트 색상 |
| fontWeight | FontWeight? | X | 폰트 굵기 |
| textAlign | TextAlign? | X | 텍스트 정렬 |
| height | double? | X | 줄 높이 |
| letterSpacing | double? | X | 자간 |
| overflow | TextOverflow? | X | 오버플로우 처리 |
| maxLines | int? | X | 최대 줄 수 |
| textScaleFactor | double? | X | 텍스트 스케일 |
| textDecoration | TextDecoration? | X | 텍스트 데코레이션 |
| decorationColor | Color? | X | 데코레이션 색상 |

### jalnan2

| 파라미터 | 타입 | 필수 | 설명 |
|----------|------|------|------|
| text | String | O | 표시할 텍스트 |
| fontSize | double? | X | 폰트 크기 |
| color | Color? | X | 텍스트 색상 |
| fontWeight | FontWeight? | X | 폰트 굵기 |

### fontRegularStyle

| 파라미터 | 타입 | 필수 | 설명 |
|----------|------|------|------|
| fontSize | double? | X | 폰트 크기 |
| color | Color? | X | 텍스트 색상 |
| fontWeight | FontWeight? | X | 폰트 굵기 |
| textAlign | TextAlign? | X | 텍스트 정렬 |
| height | double? | X | 줄 높이 |
| letterSpacing | double? | X | 자간 |
| overflow | TextOverflow? | X | 오버플로우 처리 |
| maxLines | int? | X | 최대 줄 수 |

## 사용되는 폰트

| 폰트 이름 | 메서드 | 용도 |
|-----------|--------|------|
| SUIT | fontRegular, fontRegularStyle | 본문, 일반 텍스트 |
| Jalnan2 | jalnan2 | 제목, 강조 텍스트 |
