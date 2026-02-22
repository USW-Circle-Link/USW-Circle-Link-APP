import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';
import 'app_bar_styles.dart';

/// 커스텀 AppBar 위젯
class AppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppBar({
    Key? key,
    this.leading,
    this.title,
    this.actions,
    this.style = AppBarStyle.defaultStyle,
  }) : super(key: key);

  final Widget? leading;
  final Widget? title;
  final List<Widget>? actions;
  final AppBarStyle style;

  @override
  Widget build(BuildContext context) {
    final effectiveBgColor = style == AppBarStyle.defaultStyle
        ? Theme.of(context).appBarTheme.backgroundColor ?? style.backgroundColor
        : style.backgroundColor;

    return Container(
      decoration: BoxDecoration(
        color: effectiveBgColor,
      ),
      child: Padding(
        padding: style.padding,
        child: material.AppBar(
          scrolledUnderElevation: 0,
          toolbarHeight: style.toolbarHeight,
          centerTitle: true,
          elevation: style.elevation,
          leading: leading,
          title: title,
          actions: actions,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
