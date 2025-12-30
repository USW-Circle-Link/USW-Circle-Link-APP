import 'package:flutter/material.dart';

/// FilterTabBar 위젯의 스타일을 정의하는 클래스
class FilterTabBarStyle {
  /// 선택된 탭의 하단 테두리 색상
  final Color selectedBorderColor;

  /// 버튼 전경색 (ripple effect)
  final Color foregroundColor;

  /// 버튼 패딩
  final EdgeInsetsGeometry padding;

  /// 선택된 탭의 텍스트 색상
  final Color selectedTextColor;

  /// 선택되지 않은 탭의 텍스트 색상
  final Color unselectedTextColor;

  /// 텍스트 크기
  final double fontSize;

  /// 텍스트 굵기
  final FontWeight fontWeight;

  const FilterTabBarStyle({
    this.selectedBorderColor = Colors.black,
    this.foregroundColor = const Color(0xffffB052),
    this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
    this.selectedTextColor = Colors.black,
    this.unselectedTextColor = const Color(0xffA8A8A8),
    this.fontSize = 16,
    this.fontWeight = FontWeight.w700,
  });

  /// 기본 스타일
  static const FilterTabBarStyle defaultStyle = FilterTabBarStyle();

  /// 스타일 복사 및 수정
  FilterTabBarStyle copyWith({
    Color? selectedBorderColor,
    Color? foregroundColor,
    EdgeInsetsGeometry? padding,
    Color? selectedTextColor,
    Color? unselectedTextColor,
    double? fontSize,
    FontWeight? fontWeight,
  }) {
    return FilterTabBarStyle(
      selectedBorderColor: selectedBorderColor ?? this.selectedBorderColor,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      padding: padding ?? this.padding,
      selectedTextColor: selectedTextColor ?? this.selectedTextColor,
      unselectedTextColor: unselectedTextColor ?? this.unselectedTextColor,
      fontSize: fontSize ?? this.fontSize,
      fontWeight: fontWeight ?? this.fontWeight,
    );
  }
}
