import 'package:flutter/material.dart';

import '../card/app_card.dart';
import '../card/app_card_styles.dart';
import '../tile/tile.dart';
import '../tile/tile_styles.dart';
import 'drawer_item_styles.dart';

/// 드로어 메뉴 아이템 컴포넌트
///
/// AppCard + Tile 조합으로 구성된 드로어 메뉴 아이템입니다.
/// 확장/축소 기능을 지원합니다.
///
/// ```diagram
/// +--------------------------------------------------+
/// | [icon] [title]                      [trailing>]  |
/// +--------------------------------------------------+
/// |        [subtitle - 확장 시에만 표시]               |
/// +--------------------------------------------------+
/// ```
///
/// 사용 예시:
/// ```dart
/// DrawerItem(
///   title: '내 정보',
///   icon: Icons.person,
///   trailingIcon: Icons.chevron_right,
///   onTap: () => navigateToProfile(),
/// )
///
/// // 확장 가능한 아이템
/// DrawerItem(
///   title: '내 정보',
///   icon: Icons.person,
///   trailingIcon: Icons.chevron_right,
///   isExpanded: isExpanded,
///   subtitle: Row(...),
///   onTap: () => toggleExpanded(),
/// )
/// ```
class DrawerItem extends StatelessWidget {
  /// 타이틀
  final String title;

  /// 아이콘
  final IconData icon;

  /// prefix 아이콘 크기
  final double? iconSize;

  /// 트레일링 아이콘 (보통 chevron_right)
  final IconData trailingIcon;

  /// suffix 아이콘 크기
  final double? trailingIconSize;

  /// 확장 시 표시되는 서브타이틀 위젯
  final Widget? subtitle;

  /// 확장 상태 여부
  final bool isExpanded;

  /// 탭 이벤트 콜백
  final VoidCallback onTap;

  /// 스타일
  final DrawerItemStyle style;

  const DrawerItem({
    super.key,
    required this.title,
    required this.icon,
    this.iconSize,
    required this.trailingIcon,
    this.trailingIconSize,
    this.subtitle,
    this.isExpanded = false,
    required this.onTap,
    this.style = DrawerItemStyle.defaultStyle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveBg = style == DrawerItemStyle.defaultStyle
        ? theme.cardColor
        : style.backgroundColor;
    final effectiveTitleColor = style == DrawerItemStyle.defaultStyle
        ? theme.textTheme.bodyLarge!.color!
        : style.titleColor;
    final effectiveIconColor = style == DrawerItemStyle.defaultStyle
        ? theme.colorScheme.onSurfaceVariant
        : style.iconColor;

    return Padding(
      padding: style.padding,
      child: AppCard(
        style: AppCardStyle(
          backgroundColor: effectiveBg,
          borderRadius: style.borderRadius,
        ),
        onTap: onTap,
        child: AnimatedContainer(
          duration: style.animationDuration,
          curve: Curves.easeInOut,
          height: isExpanded ? style.expandedHeight : style.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Tile(
                prefix: Icon(icon, size: iconSize, color: effectiveIconColor),
                title: Text(title),
                suffix: AnimatedRotation(
                  duration: style.animationDuration,
                  turns: isExpanded ? 0.25 : 0,
                  child: Icon(trailingIcon, size: trailingIconSize, color: effectiveIconColor),
                ),
                style: TileStyle(
                  padding: EdgeInsets.only(
                    left: style.contentPadding.left,
                    right: isExpanded ? 15 : style.contentPadding.right,
                    top: 12,
                    bottom: 12,
                  ),
                  titleFontSize: style.titleFontSize,
                  titleColor: effectiveTitleColor,
                  titleFontWeight: style.titleFontWeight,
                  iconSize: iconSize ?? 18,
                  iconColor: effectiveIconColor,
                  backgroundColor: Colors.transparent,
                ),
              ),
              if (isExpanded && subtitle != null)
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    child: subtitle,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 레거시 지원을 위한 함수형 빌더
///
/// [DrawerItem] 위젯 사용을 권장합니다.
Widget buildDrawerItem({
  required String title,
  required IconData icon,
  double? iconSize,
  required VoidCallback onTap,
  required IconData trailingIcon,
  double? trailingIconSize,
  Widget? subtitle,
  bool isExpanded = false,
  DrawerItemStyle style = DrawerItemStyle.defaultStyle,
}) {
  return DrawerItem(
    title: title,
    icon: icon,
    iconSize: iconSize,
    trailingIcon: trailingIcon,
    trailingIconSize: trailingIconSize,
    subtitle: subtitle,
    isExpanded: isExpanded,
    onTap: onTap,
    style: style,
  );
}
