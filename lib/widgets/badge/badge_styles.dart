import 'package:flutter/material.dart';

/// Badge 컴포넌트의 스타일 정의
class BadgeStyle {
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final double? height;
  final double letterSpacing;

  const BadgeStyle({
    this.backgroundColor = const Color(0xffBFBFBF),
    this.textColor = Colors.white,
    this.fontSize = 10,
    this.fontWeight = FontWeight.w800,
    this.borderRadius = 16,
    this.padding = const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    this.height,
    this.letterSpacing = -0.6,
  });

  static const BadgeStyle defaultStyle = BadgeStyle();

  /// 상태별 기본 스타일
  static const BadgeStyle waitStyle = BadgeStyle(
    backgroundColor: Color(0xffBFBFBF),
  );

  static const BadgeStyle passStyle = BadgeStyle(
    backgroundColor: Color(0xff8282FF),
  );

  static const BadgeStyle failStyle = BadgeStyle(
    backgroundColor: Color(0xffFF8282),
  );

  BadgeStyle copyWith({
    Color? backgroundColor,
    Color? textColor,
    double? fontSize,
    FontWeight? fontWeight,
    double? borderRadius,
    EdgeInsetsGeometry? padding,
    double? height,
    double? letterSpacing,
  }) {
    return BadgeStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
      fontSize: fontSize ?? this.fontSize,
      fontWeight: fontWeight ?? this.fontWeight,
      borderRadius: borderRadius ?? this.borderRadius,
      padding: padding ?? this.padding,
      height: height ?? this.height,
      letterSpacing: letterSpacing ?? this.letterSpacing,
    );
  }
}
