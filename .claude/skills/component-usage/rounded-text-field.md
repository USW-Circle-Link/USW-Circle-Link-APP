# RoundedTextField

둥근 모서리 텍스트 입력 필드 컴포넌트

## 파일 위치

- 컴포넌트: [lib/widgets/rounded_text_field/rounded_text_field.dart](../../../lib/widgets/rounded_text_field/rounded_text_field.dart)
- 스타일: [lib/widgets/rounded_text_field/rounded_text_field_styles.dart](../../../lib/widgets/rounded_text_field/rounded_text_field_styles.dart)

## Import

```dart
import 'package:usw_circle_link/widgets/rounded_text_field/rounded_text_field.dart';
```

## 사용법

### 기본 사용
```dart
RoundedTextField(
  textEditController: _controller,
  hintText: '이메일을 입력하세요',
)
```

### 테두리가 있는 입력 필드
```dart
RoundedTextField(
  textEditController: _controller,
  hintText: '비밀번호 입력',
  borderWidth: 1,
  leftTopCornerRadius: 12,
  rightTopCornerRadius: 12,
  leftBottomCornerRadius: 12,
  rightBottomCornerRadius: 12,
  obscureText: true,
)
```

### 아이콘이 있는 입력 필드
```dart
RoundedTextField(
  textEditController: _controller,
  hintText: '검색어 입력',
  borderWidth: 1,
  leftTopCornerRadius: 20,
  rightTopCornerRadius: 20,
  leftBottomCornerRadius: 20,
  rightBottomCornerRadius: 20,
  prefixIcon: Padding(
    padding: EdgeInsets.only(right: 8),
    child: Icon(Icons.search, color: Colors.grey),
  ),
  suffixIcon: IconButton(
    icon: Icon(Icons.clear),
    onPressed: () => _controller.clear(),
  ),
)
```

### 배경색이 있는 입력 필드
```dart
RoundedTextField(
  textEditController: _controller,
  hintText: '입력하세요',
  backgroundColor: Color(0xFFF5F5F5),
  isBackgroundFilled: true,
  leftTopCornerRadius: 8,
  rightTopCornerRadius: 8,
  leftBottomCornerRadius: 8,
  rightBottomCornerRadius: 8,
)
```

### 애니메이션 힌트 (플로팅 라벨)
```dart
RoundedTextField(
  textEditController: _controller,
  hintText: '이름',
  isAnimatedHint: true,
  borderWidth: 1,
  leftTopCornerRadius: 8,
  rightTopCornerRadius: 8,
  leftBottomCornerRadius: 8,
  rightBottomCornerRadius: 8,
)
```

## Props

| 속성 | 타입 | 필수 | 기본값 | 설명 |
|------|------|------|--------|------|
| textEditController | TextEditingController? | X | - | 텍스트 컨트롤러 |
| height | double? | X | 56 | 필드 높이 |
| marginLeft/Top/Right/Bottom | double? | X | 0 | 외부 여백 |
| paddingLeft/Top/Right/Bottom | double? | X | 12/0 | 내부 여백 |
| leftTopCornerRadius | double? | X | 0 | 좌상단 모서리 반경 |
| rightTopCornerRadius | double? | X | 0 | 우상단 모서리 반경 |
| leftBottomCornerRadius | double? | X | 0 | 좌하단 모서리 반경 |
| rightBottomCornerRadius | double? | X | 0 | 우하단 모서리 반경 |
| borderWidth | double? | X | 0 | 테두리 두께 |
| borderColor | Color? | X | Color(0xFFDBDBDB) | 테두리 색상 |
| backgroundColor | Color? | X | - | 배경색 |
| isBackgroundFilled | bool? | X | false | 배경 채움 여부 |
| hintText | String? | X | - | 힌트 텍스트 |
| hintStyle | TextStyle? | X | - | 힌트 스타일 |
| isAnimatedHint | bool | X | false | 애니메이션 힌트 사용 |
| obscureText | bool | X | false | 비밀번호 숨김 |
| readOnly | bool | X | false | 읽기 전용 |
| maxLines | int? | X | - | 최대 줄 수 |
| textInputType | TextInputType? | X | - | 키보드 타입 |
| textAlign | TextAlign? | X | left | 텍스트 정렬 |
| prefixIcon | Widget? | X | - | 앞쪽 아이콘 |
| suffixIcon | Widget? | X | - | 뒤쪽 아이콘 |
| textInputAction | TextInputAction? | X | - | 키보드 액션 |
| onTab | Function()? | X | - | 탭 콜백 |
| onChanged | Function(String)? | X | - | 변경 콜백 |
| focusNode | FocusNode? | X | - | 포커스 노드 |
| textStyle | TextStyle? | X | - | 텍스트 스타일 |

## 포커스 시 색상 변경

기본적으로 포커스 시 테두리 색상이 `#FFB052` (브랜드 색상)으로 변경됩니다.
