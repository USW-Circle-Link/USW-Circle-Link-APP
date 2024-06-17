import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextFontWidget {
  static Widget fontRegular({
    required String text,
    required double fontSize,
    required Color color,
    required FontWeight fontweight,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Pretendard-Regular',
        fontSize: fontSize,
        color: color,
        fontWeight: fontweight,
      ),
    );
  }

  static Widget jalnan2({
    required String text,
    required double fontSize,
    required Color color,
    required FontWeight fontweight,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Jalnan2',
        fontSize: fontSize,
        color: color,
        fontWeight: fontweight,
      ),
    );
  }
}
