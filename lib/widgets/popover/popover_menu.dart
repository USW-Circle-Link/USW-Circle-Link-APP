import 'package:flutter/material.dart';
import '../text_font_widget/text_font_widget.dart';
import 'popover_menu_item.dart';
import 'popover_menu_styles.dart';

/// Popover 메뉴 컴포넌트
///
/// 헤더와 메뉴 아이템 목록으로 구성된 메뉴입니다.
///
/// ```diagram
/// +-------------------+
/// |     [Header]      |
/// +-------------------+
/// | [Icon] [Label]    |
/// | [Icon] [Label]    |
/// | [Icon] [Label]    |
/// +-------------------+
/// ```
///
/// 사용 예시:
/// ```dart
/// PopoverMenu(
///   header: Text('동아리 정보'),
///   items: [
///     PopoverMenuItem(
///       icon: Icon(Icons.room),
///       label: '동아리실',
///       trailing: Text('2층 201호'),
///     ),
///     PopoverMenuItem(
///       icon: Icon(Icons.phone),
///       label: '연락처',
///       trailing: Text('010-1234-5678'),
///     ),
///   ],
/// )
/// ```
class PopoverMenu extends StatelessWidget {
  /// 메뉴 헤더 (선택적)
  final Widget? header;

  /// 메뉴 아이템 목록
  final List<PopoverMenuItem> items;

  /// 닫기 콜백
  final VoidCallback? onClose;

  /// 스타일
  final PopoverMenuStyle style;

  const PopoverMenu({
    super.key,
    required this.items,
    this.header,
    this.onClose,
    this.style = PopoverMenuStyle.defaultStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: style.minWidth,
        maxWidth: style.maxWidth,
      ),
      child: SizedBox(
        width: style.width,
        child: Padding(
          padding: style.padding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (header != null) ...[
                Padding(
                  padding: style.headerStyle.padding,
                  child: DefaultTextStyle(
                    style: TextFontWidget.fontRegularStyle(
                      fontSize: style.headerStyle.fontSize,
                      fontWeight: style.headerStyle.fontWeight,
                      color: style.headerStyle.color,
                    ),
                    child: header!,
                  ),
                ),
                if (style.dividerColor != null)
                  Divider(
                    color: style.dividerColor,
                    thickness: style.dividerThickness,
                    indent: style.dividerIndent,
                    endIndent: style.dividerIndent,
                  ),
              ],
              ...items,
            ],
          ),
        ),
      ),
    );
  }
}
