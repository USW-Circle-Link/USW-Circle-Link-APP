import 'package:flutter/material.dart';

/// CategoryFilterButton 위젯의 스타일을 정의하는 클래스
class CategoryFilterButtonStyle {
  /// 선택된 상태의 배경색
  final Color selectedBackgroundColor;

  /// 선택되지 않은 상태의 배경색
  final Color unselectedBackgroundColor;

  /// 선택된 상태의 전경색
  final Color selectedForegroundColor;

  /// 선택되지 않은 상태의 전경색
  final Color unselectedForegroundColor;

  /// 선택된 상태의 테두리 색상
  final Color selectedBorderColor;

  /// 선택되지 않은 상태의 테두리 색상
  final Color unselectedBorderColor;

  /// 테두리 둥글기
  final double borderRadius;

  /// 버튼 패딩
  final EdgeInsetsGeometry padding;

  /// 아이콘 크기
  final double iconSize;

  /// 아이콘과 텍스트 사이 간격
  final double spacing;

  /// 텍스트 굵기
  final FontWeight fontWeight;

  /// 버튼 높이
  final double height;

  const CategoryFilterButtonStyle({
    this.selectedBackgroundColor = const Color(0xFFFFB052),
    this.unselectedBackgroundColor = Colors.white,
    this.selectedForegroundColor = Colors.white,
    this.unselectedForegroundColor = const Color(0xFFFFB052),
    this.selectedBorderColor = const Color(0xFFFF9A21),
    this.unselectedBorderColor = const Color(0xFF959595),
    this.borderRadius = 12,
    this.padding = const EdgeInsets.symmetric(horizontal: 8),
    this.iconSize = 18,
    this.spacing = 4,
    this.fontWeight = FontWeight.w500,
    this.height = 40,
  });

  /// 기본 스타일
  static const CategoryFilterButtonStyle defaultStyle = CategoryFilterButtonStyle();

  /// 스타일 복사 및 수정
  CategoryFilterButtonStyle copyWith({
    Color? selectedBackgroundColor,
    Color? unselectedBackgroundColor,
    Color? selectedForegroundColor,
    Color? unselectedForegroundColor,
    Color? selectedBorderColor,
    Color? unselectedBorderColor,
    double? borderRadius,
    EdgeInsetsGeometry? padding,
    double? iconSize,
    double? spacing,
    FontWeight? fontWeight,
    double? height,
  }) {
    return CategoryFilterButtonStyle(
      selectedBackgroundColor: selectedBackgroundColor ?? this.selectedBackgroundColor,
      unselectedBackgroundColor: unselectedBackgroundColor ?? this.unselectedBackgroundColor,
      selectedForegroundColor: selectedForegroundColor ?? this.selectedForegroundColor,
      unselectedForegroundColor: unselectedForegroundColor ?? this.unselectedForegroundColor,
      selectedBorderColor: selectedBorderColor ?? this.selectedBorderColor,
      unselectedBorderColor: unselectedBorderColor ?? this.unselectedBorderColor,
      borderRadius: borderRadius ?? this.borderRadius,
      padding: padding ?? this.padding,
      iconSize: iconSize ?? this.iconSize,
      spacing: spacing ?? this.spacing,
      fontWeight: fontWeight ?? this.fontWeight,
      height: height ?? this.height,
    );
  }
}
