import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// TextFontWidget 사용방법
/// 이 위젯은 font family 별로 static 메소드를 제공합니다.
/// 추가적인 style 옵션은 함수의 파라미터로 전달하면 됩니다.
/// 만약에 style 옵션이 없으면 아래 파라미터에 Optional 파라미터로 추가하고
/// return 되는 AutoSizeText 위젯에 추가해주시면 됩니다.
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

  static TextStyle fontRegularStyle({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    double? height,
    double? letterSpacing,
    TextOverflow? overflow,
    int? maxLines,
  }) {
    return TextStyle(
      fontFamily: 'SUIT',
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      height: height,
      letterSpacing: letterSpacing,
    );
  }
}
