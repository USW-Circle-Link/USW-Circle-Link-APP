import 'package:flutter/material.dart';

/// CategoryPicker 위젯의 스타일을 정의하는 클래스
class CategoryPickerStyle {
  /// 배경색
  final Color backgroundColor;

  /// 모서리 둥글기
  final double borderRadius;

  /// 콘텐츠 패딩
  final EdgeInsetsGeometry contentPadding;

  /// 제목 색상
  final Color titleColor;

  /// 제목 크기
  final double titleFontSize;

  /// 제목 굵기
  final FontWeight titleFontWeight;

  /// 부제목 색상
  final Color subtitleColor;

  /// 부제목 크기
  final double subtitleFontSize;

  /// 부제목 굵기
  final FontWeight subtitleFontWeight;

  /// 힌트 텍스트 색상
  final Color hintColor;

  /// 힌트 텍스트 크기
  final double hintFontSize;

  /// 힌트 텍스트 굵기
  final FontWeight hintFontWeight;

  /// 아이콘 크기
  final double iconSize;

  /// 아이콘 색상
  final Color iconColor;

  /// 선택된 칩 배경색
  final Color selectedChipBackgroundColor;

  /// 선택된 칩 테두리 색상
  final Color selectedChipBorderColor;

  /// 선택된 칩 텍스트 색상
  final Color selectedChipTextColor;

  /// 비선택 칩 배경색
  final Color unselectedChipBackgroundColor;

  /// 비선택 칩 테두리 색상
  final Color unselectedChipBorderColor;

  /// 비선택 칩 텍스트 색상
  final Color unselectedChipTextColor;

  /// 칩 모서리 둥글기
  final double chipBorderRadius;

  /// 칩 간격
  final double chipSpacing;

  const CategoryPickerStyle({
    this.backgroundColor = Colors.white,
    this.borderRadius = 17,
    this.contentPadding = const EdgeInsets.only(right: 48, left: 48, top: 48),
    this.titleColor = const Color(0xFF989898),
    this.titleFontSize = 14,
    this.titleFontWeight = FontWeight.w400,
    this.subtitleColor = const Color(0xFF111111),
    this.subtitleFontSize = 14,
    this.subtitleFontWeight = FontWeight.w700,
    this.hintColor = const Color(0xff909090),
    this.hintFontSize = 12,
    this.hintFontWeight = FontWeight.w300,
    this.iconSize = 15,
    this.iconColor = const Color(0xFF111111),
    this.selectedChipBackgroundColor = const Color(0xFFFFB052),
    this.selectedChipBorderColor = const Color(0xFFFF9A21),
    this.selectedChipTextColor = Colors.white,
    this.unselectedChipBackgroundColor = Colors.white,
    this.unselectedChipBorderColor = const Color(0xFFE5E5E5),
    this.unselectedChipTextColor = const Color(0xFF434343),
    this.chipBorderRadius = 15,
    this.chipSpacing = 5,
  });

  static const CategoryPickerStyle defaultStyle = CategoryPickerStyle();

  CategoryPickerStyle copyWith({
    Color? backgroundColor,
    double? borderRadius,
    EdgeInsetsGeometry? contentPadding,
    Color? titleColor,
    double? titleFontSize,
    FontWeight? titleFontWeight,
    Color? subtitleColor,
    double? subtitleFontSize,
    FontWeight? subtitleFontWeight,
    Color? hintColor,
    double? hintFontSize,
    FontWeight? hintFontWeight,
    double? iconSize,
    Color? iconColor,
    Color? selectedChipBackgroundColor,
    Color? selectedChipBorderColor,
    Color? selectedChipTextColor,
    Color? unselectedChipBackgroundColor,
    Color? unselectedChipBorderColor,
    Color? unselectedChipTextColor,
    double? chipBorderRadius,
    double? chipSpacing,
  }) {
    return CategoryPickerStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderRadius: borderRadius ?? this.borderRadius,
      contentPadding: contentPadding ?? this.contentPadding,
      titleColor: titleColor ?? this.titleColor,
      titleFontSize: titleFontSize ?? this.titleFontSize,
      titleFontWeight: titleFontWeight ?? this.titleFontWeight,
      subtitleColor: subtitleColor ?? this.subtitleColor,
      subtitleFontSize: subtitleFontSize ?? this.subtitleFontSize,
      subtitleFontWeight: subtitleFontWeight ?? this.subtitleFontWeight,
      hintColor: hintColor ?? this.hintColor,
      hintFontSize: hintFontSize ?? this.hintFontSize,
      hintFontWeight: hintFontWeight ?? this.hintFontWeight,
      iconSize: iconSize ?? this.iconSize,
      iconColor: iconColor ?? this.iconColor,
      selectedChipBackgroundColor: selectedChipBackgroundColor ?? this.selectedChipBackgroundColor,
      selectedChipBorderColor: selectedChipBorderColor ?? this.selectedChipBorderColor,
      selectedChipTextColor: selectedChipTextColor ?? this.selectedChipTextColor,
      unselectedChipBackgroundColor: unselectedChipBackgroundColor ?? this.unselectedChipBackgroundColor,
      unselectedChipBorderColor: unselectedChipBorderColor ?? this.unselectedChipBorderColor,
      unselectedChipTextColor: unselectedChipTextColor ?? this.unselectedChipTextColor,
      chipBorderRadius: chipBorderRadius ?? this.chipBorderRadius,
      chipSpacing: chipSpacing ?? this.chipSpacing,
    );
  }
}
