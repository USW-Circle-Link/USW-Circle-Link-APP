import 'package:flutter/material.dart';

import '../text_font_widget/text_font_widget.dart';

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

  // 2025-10-30 일 15:00 시부터 버튼 보이게
  final now = DateTime.now();
  final eventDate = DateTime(2025, 10, 30, 15, 0);
  if (!now.isAfter(eventDate)) {
    // return const SizedBox.shrink();
  }

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
          child: ListTile(
            minTileHeight: 56,
            titleAlignment: ListTileTitleAlignment.center,
            contentPadding: EdgeInsets.only(
              left: 6,
              right: 6,
            ),
            leading: SizedBox(width: 32, height: 32, child: leadingImg),
            title: TextFontWidget.fontRegular(
              title,
              overflow: TextOverflow.ellipsis,
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
            ),
            trailing: SizedBox(width: 32, height: 32, child: trailingImg),
          ),
        ),
      ),
    ),
  );
}
