import 'package:flutter/material.dart';

/// RoundedTextField 위젯의 스타일을 정의하는 클래스
class RoundedTextFieldStyle {
  /// 기본 높이
  final double height;

  /// 기본 패딩
  final EdgeInsetsGeometry padding;

  /// 포커스 시 테두리 색상
  final Color focusBorderColor;

  /// 비포커스 시 테두리 색상
  final Color unfocusBorderColor;

  /// 기본 테두리 두께
  final double borderWidth;

  /// 기본 배경색
  final Color? backgroundColor;

  /// 기본 모서리 둥글기
  final double borderRadius;

  const RoundedTextFieldStyle({
    this.height = 56,
    this.padding = const EdgeInsets.symmetric(horizontal: 12),
    this.focusBorderColor = const Color(0xffffB052),
    this.unfocusBorderColor = const Color(0xFFDBDBDB),
    this.borderWidth = 1,
    this.backgroundColor,
    this.borderRadius = 0,
  });

  static const RoundedTextFieldStyle defaultStyle = RoundedTextFieldStyle();

  RoundedTextFieldStyle copyWith({
    double? height,
    EdgeInsetsGeometry? padding,
    Color? focusBorderColor,
    Color? unfocusBorderColor,
    double? borderWidth,
    Color? backgroundColor,
    double? borderRadius,
  }) {
    return RoundedTextFieldStyle(
      height: height ?? this.height,
      padding: padding ?? this.padding,
      focusBorderColor: focusBorderColor ?? this.focusBorderColor,
      unfocusBorderColor: unfocusBorderColor ?? this.unfocusBorderColor,
      borderWidth: borderWidth ?? this.borderWidth,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }
}
