# AppBar

커스텀 앱바 컴포넌트

## 파일 위치

- 컴포넌트: [lib/widgets/app_bar/app_bar.dart](../../../lib/widgets/app_bar/app_bar.dart)
- 스타일: [lib/widgets/app_bar/app_bar_styles.dart](../../../lib/widgets/app_bar/app_bar_styles.dart)

## Import

```dart
import 'package:usw_circle_link/widgets/app_bar/app_bar.dart';
```

## 사용법

### 기본 사용
```dart
AppBar(
  title: Text('페이지 제목'),
)
```

### 전체 옵션
```dart
AppBar(
  leading: IconButton(
    icon: Icon(Icons.menu),
    onPressed: () => Scaffold.of(context).openDrawer(),
  ),
  title: Text('동아리 목록'),
  actions: [
    IconButton(
      icon: Icon(Icons.search),
      onPressed: () {},
    ),
    IconButton(
      icon: Icon(Icons.notifications),
      onPressed: () {},
    ),
  ],
)
```

### 커스텀 스타일
```dart
AppBar(
  title: Text('제목'),
  style: AppBarStyle.defaultStyle.copyWith(
    backgroundColor: Colors.blue,
    toolbarHeight: 60,
    elevation: 2.0,
  ),
)
```

## 스타일 속성

| 속성 | 타입 | 기본값 | 설명 |
|------|------|--------|------|
| backgroundColor | Color | Colors.white | 배경색 |
| padding | EdgeInsetsGeometry | EdgeInsets.symmetric(horizontal: 12) | 내부 패딩 |
| toolbarHeight | double | 52 | 툴바 높이 |
| elevation | double | 0.0 | 그림자 높이 |

## Props

| 속성 | 타입 | 필수 | 설명 |
|------|------|------|------|
| leading | Widget? | X | 왼쪽 위젯 (보통 메뉴 버튼) |
| title | Widget? | X | 중앙 타이틀 위젯 |
| actions | List<Widget>? | X | 오른쪽 액션 버튼들 |
| style | AppBarStyle | X | 스타일 설정 |
