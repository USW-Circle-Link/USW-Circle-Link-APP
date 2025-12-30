import 'package:flutter/material.dart';

/// DrawerItem 위젯의 스타일을 정의하는 클래스
class DrawerItemStyle {
  /// 배경색
  final Color backgroundColor;

  /// 모서리 둥글기
  final double borderRadius;

  /// 기본 높이
  final double height;

  /// 확장된 높이
  final double expandedHeight;

  /// 아이콘 색상
  final Color iconColor;

  /// 제목 색상
  final Color titleColor;

  /// 제목 크기
  final double titleFontSize;

  /// 제목 굵기
  final FontWeight titleFontWeight;

  /// 패딩
  final EdgeInsetsGeometry padding;

  /// 콘텐츠 패딩 (EdgeInsets 타입만 지원)
  final EdgeInsets contentPadding;

  /// 애니메이션 지속시간
  final Duration animationDuration;

  const DrawerItemStyle({
    this.backgroundColor = Colors.white,
    this.borderRadius = 8,
    this.height = 56,
    this.expandedHeight = 100,
    this.iconColor = Colors.grey,
    this.titleColor = const Color(0xff353549),
    this.titleFontSize = 15,
    this.titleFontWeight = FontWeight.w400,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    this.contentPadding = const EdgeInsets.only(left: 16, right: 6),
    this.animationDuration = const Duration(milliseconds: 300),
  });

  static const DrawerItemStyle defaultStyle = DrawerItemStyle();

  DrawerItemStyle copyWith({
    Color? backgroundColor,
    double? borderRadius,
    double? height,
    double? expandedHeight,
    Color? iconColor,
    Color? titleColor,
    double? titleFontSize,
    FontWeight? titleFontWeight,
    EdgeInsetsGeometry? padding,
    EdgeInsets? contentPadding,
    Duration? animationDuration,
  }) {
    return DrawerItemStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderRadius: borderRadius ?? this.borderRadius,
      height: height ?? this.height,
      expandedHeight: expandedHeight ?? this.expandedHeight,
      iconColor: iconColor ?? this.iconColor,
      titleColor: titleColor ?? this.titleColor,
      titleFontSize: titleFontSize ?? this.titleFontSize,
      titleFontWeight: titleFontWeight ?? this.titleFontWeight,
      padding: padding ?? this.padding,
      contentPadding: contentPadding ?? this.contentPadding,
      animationDuration: animationDuration ?? this.animationDuration,
    );
  }
}
