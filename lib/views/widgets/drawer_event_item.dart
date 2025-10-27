import 'package:flutter/material.dart';

import 'text_font_widget.dart';

Widget buildDrawerEventItem({
  required String title,
  required VoidCallback onTap,
}) {
  final radius = BorderRadius.circular(8);
  final leadingImg = Image.asset('assets/images/ghost.png');
  final trailingImg = Image.asset('assets/images/pumpkin.png');
  final gradient = LinearGradient(
      colors: [Color(0xFF3B2667), Color(0xFF9B63C3)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    child: Material(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: radius),
      clipBehavior: Clip.antiAlias, // 잉크 이펙트 라운드 처리
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: radius,
          gradient: gradient,
        ),
        child: InkWell(
          borderRadius: radius,
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            height: 56,
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.only(
                    left: 16,
                    right: 6,
                  ),
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child:
                            SizedBox(width: 32, height: 32, child: leadingImg),
                      )
                    ],
                  ),
                  title: Padding(
                    padding: title == "동아리의 밤 입장하기"
                        ? const EdgeInsets.only(left: 5, top: 7)
                        : const EdgeInsets.only(left: 10, top: 7),
                    child: TextFontWidget.fontRegular(
                      title,
                      overflow: TextOverflow.ellipsis,
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Padding(
                    padding: const EdgeInsets.only(top: 7, right: 7),
                    child: SizedBox(width: 32, height: 32, child: trailingImg),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
