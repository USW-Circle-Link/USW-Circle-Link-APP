import 'package:flutter/material.dart';

import 'text_font_widget.dart';

Widget buildDrawerItem({
  required String title,
  required IconData icon,
  double? iconSize,
  required VoidCallback onTap,
  required IconData trailingIcon,
  Widget? subtitle,
  bool isExpanded = false,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    child: Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: AnimatedContainer(
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          height: isExpanded ? 100 : 56,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                contentPadding: EdgeInsets.only(
                  left: 16,
                  right: isExpanded ? 15 : 6,
                ),
                leading: Icon(icon, size: iconSize, color: Colors.grey),
                title: TextFontWidget.fontRegular(
                  title,
                  overflow: TextOverflow.ellipsis,
                  fontSize: 15,
                  color: const Color(0xff353549),
                  fontWeight: FontWeight.w400,
                ),
                trailing: AnimatedRotation(
                  duration: const Duration(milliseconds: 300),
                  turns: isExpanded ? 0.25 : 0,
                  child: Icon(trailingIcon, color: Colors.grey),
                ),
              ),
              if (isExpanded && subtitle != null)
                Expanded(
                  child: Container(
                    width: double.infinity,
                    child: subtitle,
                  ),
                ),
            ],
          ),
        ),
      ),
    ),
  );
}
