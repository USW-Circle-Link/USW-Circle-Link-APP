# DrawerMenu

드로어 메뉴 컴포넌트 (로그인/비로그인 상태 통합)

## 파일 위치

- 컴포넌트: [lib/widgets/drawer_menu/drawer_menu.dart](../../../lib/widgets/drawer_menu/drawer_menu.dart)
- 스타일: [lib/widgets/drawer_menu/drawer_menu_styles.dart](../../../lib/widgets/drawer_menu/drawer_menu_styles.dart)

## Import

```dart
import 'package:usw_circle_link/widgets/drawer_menu/drawer_menu.dart';
```

## 사용법

### 기본 사용
```dart
Scaffold(
  drawer: DrawerMenu(
    userState: userState.isAuthorized ? userState : null,
  ),
  body: ...,
)
```

### 전체 예시
```dart
class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
      drawer: DrawerMenu(
        userState: userState.state.isAuthorized ? userState.state : null,
      ),
      body: ...,
    );
  }
}
```

### 커스텀 스타일
```dart
DrawerMenu(
  userState: userState,
  style: DrawerMenuStyle.defaultStyle.copyWith(
    backgroundColor: Colors.white,
    width: 300,
  ),
)
```

## 상태별 동작

### 로그인 상태 (`userState != null`)

**헤더 영역:**
- 프로필 아이콘
- 사용자 이름 + "님"

**메뉴 항목:**
1. **내 정보** (확장 가능)
   - 내 정보 수정 → `/update_profile`
   - 비밀번호 변경 → `/change_pw`
2. **나의 소속 동아리** → `/circle_list/my_circles`
3. **나의 지원 현황** → `/circle_list/my_applications`
4. **공지 사항** → `/notices`

**하단 메뉴:**
- 문의하기 (외부 링크)
- 로그아웃
- 이용약관
- 개인정보 처리 방침

### 비로그인 상태 (`userState == null`)

**헤더 영역:**
- 프로필 아이콘
- "로그인" 텍스트 + 화살표 (클릭 시 `/login`으로 이동)

**메뉴 항목:**
- 모든 메뉴 클릭 시 `/login`으로 이동
- 단, **공지 사항**은 로그인 없이 접근 가능

**하단 메뉴:**
- 문의하기 (외부 링크)
- 이용약관
- 개인정보 처리 방침

## 스타일 속성 (DrawerMenuStyle)

| 속성 | 타입 | 기본값 | 설명 |
|------|------|--------|------|
| backgroundColor | Color | Color(0xffF0F2F5) | 드로어 배경색 |
| width | double | 290 | 드로어 너비 |
| headerBackgroundColor | Color | Colors.white | 헤더 배경색 |
| headerFontSize | double | 18 | 헤더 텍스트 크기 |
| headerColor | Color | Colors.black | 헤더 텍스트 색상 |
| headerFontWeight | FontWeight | FontWeight.w800 | 헤더 텍스트 굵기 |
| subTextFontSize | double | 14 | '님' 텍스트 크기 |
| subTextColor | Color | Color(0xFF767676) | '님' 텍스트 색상 |
| subTextFontWeight | FontWeight | FontWeight.w600 | '님' 텍스트 굵기 |
| profileIconSize | double | 30 | 프로필 아이콘 크기 |
| profileIconColor | Color | Colors.white | 프로필 아이콘 색상 |
| arrowIconSize | double | 24 | 화살표 아이콘 크기 |
| arrowIconColor | Color | Colors.black | 화살표 아이콘 색상 |
| bottomMenuFontSize | double | 12 | 하단 메뉴 텍스트 크기 |
| bottomMenuColor | Color | Colors.black | 하단 메뉴 텍스트 색상 |
| bottomMenuFontWeight | FontWeight | FontWeight.w400 | 하단 메뉴 텍스트 굵기 |
| bottomMenuHorizontalPadding | double | 24 | 하단 메뉴 수평 패딩 |
| bottomMenuItemSpacing | double | 16 | 하단 메뉴 아이템 간격 |

## Props

| 속성 | 타입 | 필수 | 설명 |
|------|------|------|------|
| userState | UserState? | X | 사용자 상태 (null이면 비로그인 상태) |
| style | DrawerMenuStyle | X | 스타일 설정 |

## 관련 컴포넌트

- [DrawerItem](drawer-item.md) - 드로어 메뉴 아이템
- [DrawerEventItem](drawer-event-item.md) - 드로어 이벤트 아이템
