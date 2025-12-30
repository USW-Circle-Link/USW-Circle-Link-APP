import 'package:flutter/material.dart';

/// RoundedEmailField 위젯의 스타일을 정의하는 클래스
class RoundedEmailFieldStyle {
  /// 기본 높이
  final double height;

  /// 수평 패딩
  final double horizontalPadding;

  /// 요소 사이 간격
  final double elementSpacing;

  /// 포커스 시 테두리 색상
  final Color focusBorderColor;

  /// 비포커스 시 테두리 색상
  final Color unfocusBorderColor;

  /// 기본 테두리 두께
  final double borderWidth;

  /// 기본 모서리 둥글기
  final double borderRadius;

  const RoundedEmailFieldStyle({
    this.height = 56.0,
    this.horizontalPadding = 12.0,
    this.elementSpacing = 10.0,
    this.focusBorderColor = const Color(0xffffB052),
    this.unfocusBorderColor = const Color(0xFFDBDBDB),
    this.borderWidth = 1,
    this.borderRadius = 0,
  });

  static const RoundedEmailFieldStyle defaultStyle = RoundedEmailFieldStyle();

  RoundedEmailFieldStyle copyWith({
    double? height,
    double? horizontalPadding,
    double? elementSpacing,
    Color? focusBorderColor,
    Color? unfocusBorderColor,
    double? borderWidth,
    double? borderRadius,
  }) {
    return RoundedEmailFieldStyle(
      height: height ?? this.height,
      horizontalPadding: horizontalPadding ?? this.horizontalPadding,
      elementSpacing: elementSpacing ?? this.elementSpacing,
      focusBorderColor: focusBorderColor ?? this.focusBorderColor,
      unfocusBorderColor: unfocusBorderColor ?? this.unfocusBorderColor,
      borderWidth: borderWidth ?? this.borderWidth,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }
}
