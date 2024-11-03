import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextFontWidget {
  static Widget fontRegular(
    String text, {
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    double? height,
    double? letterSpacing,
    TextOverflow? overflow,
    int? maxLines,
  }) {
    return AutoSizeText(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
        fontFamily: 'SUIT',
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
        height: height,
        letterSpacing: letterSpacing,
      ),
    );
  }

  static Widget jalnan2(
    String text, {
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
  }) {
    return AutoSizeText(
      text,
      style: TextStyle(
        fontFamily: 'Jalnan2',
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}
