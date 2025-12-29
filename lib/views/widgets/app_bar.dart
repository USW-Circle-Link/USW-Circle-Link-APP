import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';

class AppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppBar({
    Key? key,
    this.leading,
    this.title,
    this.actions,
  }) : super(key: key);

  final Widget? leading;
  final Widget? title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: material.AppBar(
          scrolledUnderElevation: 0,
          toolbarHeight: 52,
          centerTitle: true,
          elevation: 0.0,
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
