import 'package:flutter/material.dart';

/// DetailAppBar 위젯의 스타일을 정의하는 클래스
class DetailAppBarStyle {
  /// AppBar 배경색
  final Color backgroundColor;

  /// AppBar 높이
  final double toolbarHeight;

  /// 수평 패딩
  final double horizontalPadding;

  /// 뒤로가기 버튼 크기
  final double backButtonSize;

  /// 제목 텍스트 크기
  final double titleFontSize;

  /// 제목 텍스트 색상
  final Color titleColor;

  /// 제목 텍스트 굵기
  final FontWeight titleFontWeight;

  const DetailAppBarStyle({
    this.backgroundColor = Colors.white,
    this.toolbarHeight = 62,
    this.horizontalPadding = 22,
    this.backButtonSize = 52,
    this.titleFontSize = 18,
    this.titleColor = const Color(0xFF111111),
    this.titleFontWeight = FontWeight.w800,
  });

  static const DetailAppBarStyle defaultStyle = DetailAppBarStyle();

  DetailAppBarStyle copyWith({
    Color? backgroundColor,
    double? toolbarHeight,
    double? horizontalPadding,
    double? backButtonSize,
    double? titleFontSize,
    Color? titleColor,
    FontWeight? titleFontWeight,
  }) {
    return DetailAppBarStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      toolbarHeight: toolbarHeight ?? this.toolbarHeight,
      horizontalPadding: horizontalPadding ?? this.horizontalPadding,
      backButtonSize: backButtonSize ?? this.backButtonSize,
      titleFontSize: titleFontSize ?? this.titleFontSize,
      titleColor: titleColor ?? this.titleColor,
      titleFontWeight: titleFontWeight ?? this.titleFontWeight,
    );
  }
}
