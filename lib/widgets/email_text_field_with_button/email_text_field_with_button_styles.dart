import 'package:flutter/material.dart';

/// EmailTextFieldWithButton 위젯의 스타일을 정의하는 클래스
class EmailTextFieldWithButtonStyle {
  /// 밑줄 색상
  final Color underlineColor;

  /// 밑줄 두께
  final double underlineWidth;

  /// 버튼과 텍스트 필드 사이 간격
  final double buttonSpacing;

  /// 버튼 모서리 둥글기
  final double buttonBorderRadius;

  /// 버튼 텍스트 크기
  final double buttonFontSize;

  /// 버튼 텍스트 굵기
  final FontWeight buttonFontWeight;

  /// 활성 버튼 텍스트 색상
  final Color activeButtonTextColor;

  /// 비활성 버튼 텍스트 색상
  final Color inactiveButtonTextColor;

  const EmailTextFieldWithButtonStyle({
    this.underlineColor = const Color(0xFFB8B8B8),
    this.underlineWidth = 1.0,
    this.buttonSpacing = 10.0,
    this.buttonBorderRadius = 4.0,
    this.buttonFontSize = 12.0,
    this.buttonFontWeight = FontWeight.w400,
    this.activeButtonTextColor = Colors.white,
    this.inactiveButtonTextColor = const Color(0xFFB8B8B8),
  });

  static const EmailTextFieldWithButtonStyle defaultStyle = EmailTextFieldWithButtonStyle();

  EmailTextFieldWithButtonStyle copyWith({
    Color? underlineColor,
    double? underlineWidth,
    double? buttonSpacing,
    double? buttonBorderRadius,
    double? buttonFontSize,
    FontWeight? buttonFontWeight,
    Color? activeButtonTextColor,
    Color? inactiveButtonTextColor,
  }) {
    return EmailTextFieldWithButtonStyle(
      underlineColor: underlineColor ?? this.underlineColor,
      underlineWidth: underlineWidth ?? this.underlineWidth,
      buttonSpacing: buttonSpacing ?? this.buttonSpacing,
      buttonBorderRadius: buttonBorderRadius ?? this.buttonBorderRadius,
      buttonFontSize: buttonFontSize ?? this.buttonFontSize,
      buttonFontWeight: buttonFontWeight ?? this.buttonFontWeight,
      activeButtonTextColor: activeButtonTextColor ?? this.activeButtonTextColor,
      inactiveButtonTextColor: inactiveButtonTextColor ?? this.inactiveButtonTextColor,
    );
  }
}
