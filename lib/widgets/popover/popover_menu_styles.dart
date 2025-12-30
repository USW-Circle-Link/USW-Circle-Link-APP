import 'package:flutter/material.dart';

/// PopoverMenu 컴포넌트의 스타일 정의
class PopoverMenuStyle {
  /// 너비
  final double? width;

  /// 최소 너비
  final double minWidth;

  /// 최대 너비
  final double maxWidth;

  /// 패딩
  final EdgeInsetsGeometry padding;

  /// 헤더 스타일
  final PopoverMenuHeaderStyle headerStyle;

  /// 구분선 색상
  final Color? dividerColor;

  /// 구분선 두께
  final double dividerThickness;

  /// 구분선 인덴트
  final double dividerIndent;

  const PopoverMenuStyle({
    this.width,
    this.minWidth = 150,
    this.maxWidth = 300,
    this.padding = const EdgeInsets.symmetric(vertical: 8),
    this.headerStyle = const PopoverMenuHeaderStyle(),
    this.dividerColor,
    this.dividerThickness = 1,
    this.dividerIndent = 0,
  });

  /// 기본 스타일
  static const PopoverMenuStyle defaultStyle = PopoverMenuStyle();

  PopoverMenuStyle copyWith({
    double? width,
    double? minWidth,
    double? maxWidth,
    EdgeInsetsGeometry? padding,
    PopoverMenuHeaderStyle? headerStyle,
    Color? dividerColor,
    double? dividerThickness,
    double? dividerIndent,
  }) {
    return PopoverMenuStyle(
      width: width ?? this.width,
      minWidth: minWidth ?? this.minWidth,
      maxWidth: maxWidth ?? this.maxWidth,
      padding: padding ?? this.padding,
      headerStyle: headerStyle ?? this.headerStyle,
      dividerColor: dividerColor ?? this.dividerColor,
      dividerThickness: dividerThickness ?? this.dividerThickness,
      dividerIndent: dividerIndent ?? this.dividerIndent,
    );
  }
}

/// PopoverMenu 헤더 스타일
class PopoverMenuHeaderStyle {
  /// 패딩
  final EdgeInsetsGeometry padding;

  /// 폰트 크기
  final double fontSize;

  /// 폰트 굵기
  final FontWeight fontWeight;

  /// 색상
  final Color color;

  const PopoverMenuHeaderStyle({
    this.padding = const EdgeInsets.fromLTRB(16, 12, 16, 8),
    this.fontSize = 14,
    this.fontWeight = FontWeight.w700,
    this.color = const Color(0xFF353549),
  });

  PopoverMenuHeaderStyle copyWith({
    EdgeInsetsGeometry? padding,
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return PopoverMenuHeaderStyle(
      padding: padding ?? this.padding,
      fontSize: fontSize ?? this.fontSize,
      fontWeight: fontWeight ?? this.fontWeight,
      color: color ?? this.color,
    );
  }
}
