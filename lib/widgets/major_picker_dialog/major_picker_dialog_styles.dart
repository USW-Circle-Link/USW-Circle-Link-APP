import 'package:flutter/material.dart';

/// MajorPickerDialog 위젯의 스타일을 정의하는 클래스
class MajorPickerDialogStyle {
  /// 다이얼로그 배경색
  final Color backgroundColor;

  /// 다이얼로그 모서리 둥글기
  final double borderRadius;

  /// 다이얼로그 수평 패딩
  final double horizontalPadding;

  /// 다이얼로그 수직 패딩
  final double verticalPadding;

  /// 드롭다운 상단 여백
  final double dropdownTopMargin;

  /// 드롭다운 수평 여백
  final double dropdownHorizontalMargin;

  /// 드롭다운 모서리 둥글기
  final double dropdownBorderRadius;

  /// 드롭다운 테두리 색상
  final Color dropdownBorderColor;

  /// 드롭다운 텍스트 색상
  final Color dropdownTextColor;

  /// 드롭다운 텍스트 크기
  final double dropdownFontSize;

  /// 드롭다운 텍스트 굵기
  final FontWeight dropdownFontWeight;

  /// 힌트 텍스트 색상
  final Color hintTextColor;

  /// 드롭다운 간 간격
  final double dropdownSpacing;

  /// 구분선 색상
  final Color dividerColor;

  /// 확인 버튼 텍스트 색상
  final Color confirmButtonColor;

  /// 확인 버튼 텍스트 크기
  final double confirmButtonFontSize;

  /// 확인 버튼 텍스트 굵기
  final FontWeight confirmButtonFontWeight;

  /// 확인 버튼 높이
  final double confirmButtonHeight;

  const MajorPickerDialogStyle({
    this.backgroundColor = Colors.white,
    this.borderRadius = 15,
    this.horizontalPadding = 24,
    this.verticalPadding = 24,
    this.dropdownTopMargin = 32,
    this.dropdownHorizontalMargin = 16,
    this.dropdownBorderRadius = 8,
    this.dropdownBorderColor = const Color(0xFFCECECE),
    this.dropdownTextColor = const Color(0xFF000000),
    this.dropdownFontSize = 14,
    this.dropdownFontWeight = FontWeight.w400,
    this.hintTextColor = const Color(0xFF767676),
    this.dropdownSpacing = 8,
    this.dividerColor = const Color(0xFFCECECE),
    this.confirmButtonColor = const Color(0xFF0085FF),
    this.confirmButtonFontSize = 18,
    this.confirmButtonFontWeight = FontWeight.w800,
    this.confirmButtonHeight = 50,
  });

  static const MajorPickerDialogStyle defaultStyle = MajorPickerDialogStyle();

  MajorPickerDialogStyle copyWith({
    Color? backgroundColor,
    double? borderRadius,
    double? horizontalPadding,
    double? verticalPadding,
    double? dropdownTopMargin,
    double? dropdownHorizontalMargin,
    double? dropdownBorderRadius,
    Color? dropdownBorderColor,
    Color? dropdownTextColor,
    double? dropdownFontSize,
    FontWeight? dropdownFontWeight,
    Color? hintTextColor,
    double? dropdownSpacing,
    Color? dividerColor,
    Color? confirmButtonColor,
    double? confirmButtonFontSize,
    FontWeight? confirmButtonFontWeight,
    double? confirmButtonHeight,
  }) {
    return MajorPickerDialogStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderRadius: borderRadius ?? this.borderRadius,
      horizontalPadding: horizontalPadding ?? this.horizontalPadding,
      verticalPadding: verticalPadding ?? this.verticalPadding,
      dropdownTopMargin: dropdownTopMargin ?? this.dropdownTopMargin,
      dropdownHorizontalMargin: dropdownHorizontalMargin ?? this.dropdownHorizontalMargin,
      dropdownBorderRadius: dropdownBorderRadius ?? this.dropdownBorderRadius,
      dropdownBorderColor: dropdownBorderColor ?? this.dropdownBorderColor,
      dropdownTextColor: dropdownTextColor ?? this.dropdownTextColor,
      dropdownFontSize: dropdownFontSize ?? this.dropdownFontSize,
      dropdownFontWeight: dropdownFontWeight ?? this.dropdownFontWeight,
      hintTextColor: hintTextColor ?? this.hintTextColor,
      dropdownSpacing: dropdownSpacing ?? this.dropdownSpacing,
      dividerColor: dividerColor ?? this.dividerColor,
      confirmButtonColor: confirmButtonColor ?? this.confirmButtonColor,
      confirmButtonFontSize: confirmButtonFontSize ?? this.confirmButtonFontSize,
      confirmButtonFontWeight: confirmButtonFontWeight ?? this.confirmButtonFontWeight,
      confirmButtonHeight: confirmButtonHeight ?? this.confirmButtonHeight,
    );
  }
}
