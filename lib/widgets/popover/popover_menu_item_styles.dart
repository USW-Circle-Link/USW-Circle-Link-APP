import 'package:flutter/material.dart';

/// PopoverMenuItem 컴포넌트의 스타일 정의
class PopoverMenuItemStyle {
  /// 패딩
  final EdgeInsetsGeometry padding;

  /// 아이콘 크기
  final double iconSize;

  /// 아이콘 색상
  final Color iconColor;

  /// 라벨 폰트 크기
  final double labelFontSize;

  /// 라벨 폰트 굵기
  final FontWeight labelFontWeight;

  /// 라벨 색상
  final Color labelColor;

  /// 아이콘과 라벨 사이 간격
  final double spacing;

  /// 호버/프레스 시 배경색
  final Color? hoverColor;

  const PopoverMenuItemStyle({
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    this.iconSize = 18,
    this.iconColor = const Color(0xFF353549),
    this.labelFontSize = 14,
    this.labelFontWeight = FontWeight.w400,
    this.labelColor = const Color(0xFF353549),
    this.spacing = 12,
    this.hoverColor,
  });

  /// 기본 스타일
  static const PopoverMenuItemStyle defaultStyle = PopoverMenuItemStyle();

  PopoverMenuItemStyle copyWith({
    EdgeInsetsGeometry? padding,
    double? iconSize,
    Color? iconColor,
    double? labelFontSize,
    FontWeight? labelFontWeight,
    Color? labelColor,
    double? spacing,
    Color? hoverColor,
  }) {
    return PopoverMenuItemStyle(
      padding: padding ?? this.padding,
      iconSize: iconSize ?? this.iconSize,
      iconColor: iconColor ?? this.iconColor,
      labelFontSize: labelFontSize ?? this.labelFontSize,
      labelFontWeight: labelFontWeight ?? this.labelFontWeight,
      labelColor: labelColor ?? this.labelColor,
      spacing: spacing ?? this.spacing,
      hoverColor: hoverColor ?? this.hoverColor,
    );
  }
}
