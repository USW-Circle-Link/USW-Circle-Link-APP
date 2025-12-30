import 'package:flutter/material.dart';

/// DrawerEventItem 위젯의 스타일을 정의하는 클래스
class DrawerEventItemStyle {
  /// 모서리 둥글기
  final double borderRadius;

  /// 그라데이션 시작 색상
  final Color gradientStartColor;

  /// 그라데이션 끝 색상
  final Color gradientEndColor;

  /// 패딩
  final EdgeInsetsGeometry padding;

  /// 타일 높이
  final double minTileHeight;

  /// 타일 콘텐츠 패딩
  final EdgeInsetsGeometry contentPadding;

  /// 이미지 크기
  final double imageSize;

  /// 제목 색상
  final Color titleColor;

  /// 제목 크기
  final double titleFontSize;

  /// 제목 굵기
  final FontWeight titleFontWeight;

  const DrawerEventItemStyle({
    this.borderRadius = 8,
    this.gradientStartColor = const Color(0xFF3B2667),
    this.gradientEndColor = const Color(0xFF9B63C3),
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    this.minTileHeight = 56,
    this.contentPadding = const EdgeInsets.only(left: 6, right: 6),
    this.imageSize = 32,
    this.titleColor = Colors.white,
    this.titleFontSize = 15,
    this.titleFontWeight = FontWeight.bold,
  });

  static const DrawerEventItemStyle defaultStyle = DrawerEventItemStyle();

  DrawerEventItemStyle copyWith({
    double? borderRadius,
    Color? gradientStartColor,
    Color? gradientEndColor,
    EdgeInsetsGeometry? padding,
    double? minTileHeight,
    EdgeInsetsGeometry? contentPadding,
    double? imageSize,
    Color? titleColor,
    double? titleFontSize,
    FontWeight? titleFontWeight,
  }) {
    return DrawerEventItemStyle(
      borderRadius: borderRadius ?? this.borderRadius,
      gradientStartColor: gradientStartColor ?? this.gradientStartColor,
      gradientEndColor: gradientEndColor ?? this.gradientEndColor,
      padding: padding ?? this.padding,
      minTileHeight: minTileHeight ?? this.minTileHeight,
      contentPadding: contentPadding ?? this.contentPadding,
      imageSize: imageSize ?? this.imageSize,
      titleColor: titleColor ?? this.titleColor,
      titleFontSize: titleFontSize ?? this.titleFontSize,
      titleFontWeight: titleFontWeight ?? this.titleFontWeight,
    );
  }
}
