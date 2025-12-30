import 'package:flutter/material.dart';

/// AlertTextDialog 위젯의 스타일을 정의하는 클래스
class AlertTextDialogStyle {
  /// 다이얼로그 배경색
  final Color backgroundColor;

  /// 다이얼로그 모서리 둥글기
  final double borderRadius;

  /// 제목 색상
  final Color titleColor;

  /// 제목 크기
  final double titleFontSize;

  /// 제목 굵기
  final FontWeight titleFontWeight;

  /// 내용 색상
  final Color contentColor;

  /// 내용 크기
  final double contentFontSize;

  /// 내용 굵기
  final FontWeight contentFontWeight;

  /// 구분선 색상
  final Color dividerColor;

  /// 버튼 기본 색상
  final Color buttonColor;

  /// 버튼 높이
  final double buttonHeight;

  /// 패딩
  final EdgeInsetsGeometry padding;

  const AlertTextDialogStyle({
    this.backgroundColor = Colors.white,
    this.borderRadius = 15,
    this.titleColor = const Color(0xFF000000),
    this.titleFontSize = 18,
    this.titleFontWeight = FontWeight.w800,
    this.contentColor = const Color(0xFF767676),
    this.contentFontSize = 14,
    this.contentFontWeight = FontWeight.w400,
    this.dividerColor = const Color(0xFFCECECE),
    this.buttonColor = const Color(0xFF0085FF),
    this.buttonHeight = 56,
    this.padding = const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
  });

  static const AlertTextDialogStyle defaultStyle = AlertTextDialogStyle();

  AlertTextDialogStyle copyWith({
    Color? backgroundColor,
    double? borderRadius,
    Color? titleColor,
    double? titleFontSize,
    FontWeight? titleFontWeight,
    Color? contentColor,
    double? contentFontSize,
    FontWeight? contentFontWeight,
    Color? dividerColor,
    Color? buttonColor,
    double? buttonHeight,
    EdgeInsetsGeometry? padding,
  }) {
    return AlertTextDialogStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderRadius: borderRadius ?? this.borderRadius,
      titleColor: titleColor ?? this.titleColor,
      titleFontSize: titleFontSize ?? this.titleFontSize,
      titleFontWeight: titleFontWeight ?? this.titleFontWeight,
      contentColor: contentColor ?? this.contentColor,
      contentFontSize: contentFontSize ?? this.contentFontSize,
      contentFontWeight: contentFontWeight ?? this.contentFontWeight,
      dividerColor: dividerColor ?? this.dividerColor,
      buttonColor: buttonColor ?? this.buttonColor,
      buttonHeight: buttonHeight ?? this.buttonHeight,
      padding: padding ?? this.padding,
    );
  }
}
