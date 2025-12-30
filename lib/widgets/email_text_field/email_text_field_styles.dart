import 'package:flutter/material.dart';

/// EmailTextField 위젯의 스타일을 정의하는 클래스
class EmailTextFieldStyle {
  /// 힌트 텍스트
  final String hintText;

  /// suffix 텍스트
  final String suffixText;

  /// 텍스트 크기
  final double fontSize;

  /// 텍스트 색상
  final Color textColor;

  /// 비활성 텍스트 색상
  final Color inactiveTextColor;

  /// 텍스트 굵기
  final FontWeight fontWeight;

  const EmailTextFieldStyle({
    this.hintText = '포털 이메일 입력',
    this.suffixText = '@suwon.ac.kr',
    this.fontSize = 16.0,
    this.textColor = const Color(0xFF6F6F6F),
    this.inactiveTextColor = const Color(0xFFB8B8B8),
    this.fontWeight = FontWeight.w300,
  });

  static const EmailTextFieldStyle defaultStyle = EmailTextFieldStyle();

  EmailTextFieldStyle copyWith({
    String? hintText,
    String? suffixText,
    double? fontSize,
    Color? textColor,
    Color? inactiveTextColor,
    FontWeight? fontWeight,
  }) {
    return EmailTextFieldStyle(
      hintText: hintText ?? this.hintText,
      suffixText: suffixText ?? this.suffixText,
      fontSize: fontSize ?? this.fontSize,
      textColor: textColor ?? this.textColor,
      inactiveTextColor: inactiveTextColor ?? this.inactiveTextColor,
      fontWeight: fontWeight ?? this.fontWeight,
    );
  }
}
