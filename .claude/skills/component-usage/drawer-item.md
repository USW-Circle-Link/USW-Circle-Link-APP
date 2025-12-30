# DrawerItem

드로어 메뉴 아이템 컴포넌트

## 파일 위치

- 컴포넌트: [lib/widgets/drawer_item/drawer_item.dart](../../../lib/widgets/drawer_item/drawer_item.dart)
- 스타일: [lib/widgets/drawer_item/drawer_item_styles.dart](../../../lib/widgets/drawer_item/drawer_item_styles.dart)

## Import

```dart
import 'package:usw_circle_link/widgets/drawer_item/drawer_item.dart';
```

## 사용법

### 기본 사용
```dart
buildDrawerItem(
  title: '내 정보',
  icon: Icons.person,
  iconSize: 18,
  onTap: () => context.go('/profile'),
  trailingIcon: Icons.chevron_right,
)
```

### 확장 가능한 아이템
```dart
class _MyWidgetState extends State<MyWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return buildDrawerItem(
      title: '내 정보',
      icon: Icons.person,
      iconSize: 18,
      onTap: () => setState(() => isExpanded = !isExpanded),
      trailingIcon: Icons.chevron_right,
      isExpanded: isExpanded,
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: () => context.go('/edit_profile'),
            child: Text('내 정보 수정'),
          ),
          TextButton(
            onPressed: () => context.go('/change_password'),
            child: Text('비밀번호 변경'),
          ),
        ],
      ),
    );
  }
}
```

### 커스텀 스타일
```dart
buildDrawerItem(
  title: '설정',
  icon: Icons.settings,
  onTap: () {},
  trailingIcon: Icons.chevron_right,
  style: DrawerItemStyle.defaultStyle.copyWith(
    backgroundColor: Colors.grey.shade100,
    titleColor: Colors.blue,
  ),
)
```

## 스타일 속성

| 속성 | 타입 | 기본값 | 설명 |
|------|------|--------|------|
| backgroundColor | Color | Colors.white | 배경색 |
| borderRadius | double | 15 | 모서리 둥글기 |
| padding | EdgeInsetsGeometry | horizontal: 10, vertical: 5 | 외부 패딩 |
| contentPadding | EdgeInsetsGeometry | left: 20, right: 10 | 내부 패딩 |
| height | double | 56 | 기본 높이 |
| expandedHeight | double | 104 | 확장 시 높이 |
| iconColor | Color | Colors.black | 아이콘 색상 |
| titleFontSize | double | 14 | 제목 폰트 크기 |
| titleColor | Color | Colors.black | 제목 색상 |
| titleFontWeight | FontWeight | FontWeight.w400 | 제목 폰트 굵기 |
| animationDuration | Duration | 200ms | 애니메이션 시간 |

## Props

| 속성 | 타입 | 필수 | 설명 |
|------|------|------|------|
| title | String | O | 메뉴 제목 |
| icon | IconData | O | 왼쪽 아이콘 |
| iconSize | double? | X | 아이콘 크기 |
| onTap | VoidCallback | O | 탭 콜백 |
| trailingIcon | IconData | O | 오른쪽 아이콘 |
| subtitle | Widget? | X | 확장 시 표시되는 위젯 |
| isExpanded | bool | X | 확장 상태 (기본값: false) |
| style | DrawerItemStyle | X | 스타일 설정 |

## 애니메이션

- 확장/축소 시 높이 애니메이션
- trailingIcon 90도 회전 애니메이션
- 기본 애니메이션 시간: 200ms
