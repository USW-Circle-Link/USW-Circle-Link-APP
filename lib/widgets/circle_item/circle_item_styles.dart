import 'package:flutter/material.dart';

/// CircleItem 위젯의 스타일을 정의하는 클래스
class CircleItemStyle {
  /// 아이템 너비
  final double width;

  /// 이미지 높이
  final double imageHeight;

  /// 이미지 모서리 둥글기
  final double imageBorderRadius;

  /// 테두리 색상
  final Color borderColor;

  /// 테두리 너비
  final double borderWidth;

  /// 제목 크기
  final double titleFontSize;

  /// 제목 굵기
  final FontWeight titleFontWeight;

  /// 해시태그 크기
  final double hashtagFontSize;

  /// 해시태그 굵기
  final FontWeight hashtagFontWeight;

  /// 해시태그 모서리 둥글기
  final double hashtagBorderRadius;

  /// 아이템 간 간격
  final double spacing;

  const CircleItemStyle({
    this.width = 143,
    this.imageHeight = 143,
    this.imageBorderRadius = 10,
    this.borderColor = const Color(0xFFDEDEDE),
    this.borderWidth = 1,
    this.titleFontSize = 14,
    this.titleFontWeight = FontWeight.w600,
    this.hashtagFontSize = 12,
    this.hashtagFontWeight = FontWeight.w300,
    this.hashtagBorderRadius = 6,
    this.spacing = 8,
  });

  static const CircleItemStyle defaultStyle = CircleItemStyle();

  CircleItemStyle copyWith({
    double? width,
    double? imageHeight,
    double? imageBorderRadius,
    Color? borderColor,
    double? borderWidth,
    double? titleFontSize,
    FontWeight? titleFontWeight,
    double? hashtagFontSize,
    FontWeight? hashtagFontWeight,
    double? hashtagBorderRadius,
    double? spacing,
  }) {
    return CircleItemStyle(
      width: width ?? this.width,
      imageHeight: imageHeight ?? this.imageHeight,
      imageBorderRadius: imageBorderRadius ?? this.imageBorderRadius,
      borderColor: borderColor ?? this.borderColor,
      borderWidth: borderWidth ?? this.borderWidth,
      titleFontSize: titleFontSize ?? this.titleFontSize,
      titleFontWeight: titleFontWeight ?? this.titleFontWeight,
      hashtagFontSize: hashtagFontSize ?? this.hashtagFontSize,
      hashtagFontWeight: hashtagFontWeight ?? this.hashtagFontWeight,
      hashtagBorderRadius: hashtagBorderRadius ?? this.hashtagBorderRadius,
      spacing: spacing ?? this.spacing,
    );
  }
}
