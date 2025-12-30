# DetailAppBar

상세 화면용 AppBar 컴포넌트

## 파일 위치

- 컴포넌트: [lib/widgets/detail_app_bar/detail_app_bar.dart](../../../lib/widgets/detail_app_bar/detail_app_bar.dart)
- 스타일: [lib/widgets/detail_app_bar/detail_app_bar_styles.dart](../../../lib/widgets/detail_app_bar/detail_app_bar_styles.dart)

## Import

```dart
import 'package:usw_circle_link/widgets/detail_app_bar/detail_app_bar.dart';
```

## 사용법

### 기본 사용 (제목 + 뒤로가기)
```dart
Scaffold(
  appBar: const DetailAppBar(title: '화면 제목'),
  body: ...,
)
```

### 뒤로가기만 (제목 없음)
```dart
Scaffold(
  appBar: const DetailAppBar(),
  body: ...,
)
```

### 커스텀 뒤로가기 동작
```dart
Scaffold(
  appBar: DetailAppBar(
    title: '동아리 소개',
    onBackPressed: () => context.go('/'),  // Navigator.pop() 대신
  ),
  body: ...,
)
```

### 우측 액션 버튼
```dart
Scaffold(
  appBar: DetailAppBar(
    title: '설정',
    actions: [
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.settings),
      ),
    ],
  ),
  body: ...,
)
```

### 커스텀 스타일
```dart
DetailAppBar(
  title: '화면 제목',
  style: DetailAppBarStyle.defaultStyle.copyWith(
    backgroundColor: Colors.blue,
    titleFontSize: 20,
  ),
)
```

## 레이아웃

### 제목이 있는 경우
```
[뒤로가기] -------- [제목] -------- [액션/빈공간]
```

### 제목이 없는 경우
```
[뒤로가기]
```

## Props

| 속성 | 타입 | 필수 | 기본값 | 설명 |
|------|------|------|--------|------|
| title | String? | X | null | 중앙 제목 텍스트 |
| onBackPressed | VoidCallback? | X | Navigator.pop() | 뒤로가기 클릭 시 콜백 |
| actions | List<Widget>? | X | null | 우측 액션 위젯 리스트 |
| style | DetailAppBarStyle | X | defaultStyle | 스타일 설정 |

## 스타일 속성 (DetailAppBarStyle)

| 속성 | 타입 | 기본값 | 설명 |
|------|------|--------|------|
| backgroundColor | Color | Colors.white | AppBar 배경색 |
| toolbarHeight | double | 62 | AppBar 높이 |
| horizontalPadding | double | 22 | 수평 패딩 |
| backButtonSize | double | 52 | 뒤로가기 버튼 크기 |
| titleFontSize | double | 18 | 제목 텍스트 크기 |
| titleColor | Color | Color(0xFF111111) | 제목 텍스트 색상 |
| titleFontWeight | FontWeight | FontWeight.w800 | 제목 텍스트 굵기 |

## 적용된 화면

- circle_list_screen.dart
- notice_list_screen.dart
- circle_screen.dart
- update_profile_screen.dart
- change_pw_screen.dart
- email_verification_screen.dart
- find_id_screen.dart
- find_pw_screen.dart
- sign_up_screen.dart
- delete_user_screen.dart
- verify_password_screen.dart
- sign_up_option_screen.dart
- policy_agree_screen.dart
- select_circle_screen.dart
- notice_detail_screen.dart
- policy_screen.dart
- application_writing_screen.dart

## 관련 컴포넌트

- [AppBar](app-bar.md) - 메인 화면용 커스텀 AppBar
