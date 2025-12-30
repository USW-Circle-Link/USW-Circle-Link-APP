import 'package:flutter/material.dart';
import '../text_font_widget/text_font_widget.dart';
import 'popover_menu_item_styles.dart';

/// Popover 메뉴 아이템 컴포넌트
///
/// 아이콘과 라벨로 구성된 메뉴 아이템입니다.
///
/// ```diagram
/// +-------------------+
/// | [Icon] [Label]    |
/// +-------------------+
/// ```
///
/// 사용 예시:
/// ```dart
/// PopoverMenuItem(
///   icon: Icon(Icons.room),
///   label: '동아리실',
///   trailing: Text('2층 201호'),
///   onTap: () => print('Tapped'),
/// )
/// ```
class PopoverMenuItem extends StatelessWidget {
  /// 왼쪽 아이콘
  final Widget? icon;

  /// 메뉴 라벨
  final String label;

  /// 오른쪽에 표시될 추가 위젯
  final Widget? trailing;

  /// 탭 이벤트 콜백
  final VoidCallback? onTap;

  /// 스타일
  final PopoverMenuItemStyle style;

  const PopoverMenuItem({
    super.key,
    required this.label,
    this.icon,
    this.trailing,
    this.onTap,
    this.style = PopoverMenuItemStyle.defaultStyle,
  });

  @override
  Widget build(BuildContext context) {
    final content = Padding(
      padding: style.padding,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            IconTheme(
              data: IconThemeData(
                size: style.iconSize,
                color: style.iconColor,
              ),
              child: icon!,
            ),
            SizedBox(width: style.spacing),
          ],
          Expanded(
            child: TextFontWidget.fontRegular(
              label,
              fontSize: style.labelFontSize,
              fontWeight: style.labelFontWeight,
              color: style.labelColor,
            ),
          ),
          if (trailing != null) ...[
            SizedBox(width: style.spacing),
            trailing!,
          ],
        ],
      ),
    );

    if (onTap == null) {
      return content;
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        hoverColor: style.hoverColor,
        child: content,
      ),
    );
  }
}
