import 'package:flutter/material.dart';

/// Tile 컴포넌트의 스타일 정의
class TileStyle {
  /// 배경색
  final Color backgroundColor;

  /// 패딩
  final EdgeInsetsGeometry padding;

  /// 테두리 둥글기
  final double borderRadius;

  /// 테두리 색상
  final Color? borderColor;

  /// 테두리 너비
  final double borderWidth;

  /// 타이틀 폰트 크기
  final double titleFontSize;

  /// 타이틀 폰트 굵기
  final FontWeight titleFontWeight;

  /// 타이틀 색상
  final Color titleColor;

  /// 서브타이틀 폰트 크기
  final double subtitleFontSize;

  /// 서브타이틀 폰트 굵기
  final FontWeight subtitleFontWeight;

  /// 서브타이틀 색상
  final Color subtitleColor;

  /// 세부정보 폰트 크기
  final double detailsFontSize;

  /// 세부정보 색상
  final Color detailsColor;

  /// prefix와 content 사이 간격
  final double prefixSpacing;

  /// content와 suffix 사이 간격
  final double suffixSpacing;

  /// title과 subtitle 사이 간격
  final double titleSubtitleSpacing;

  /// 아이콘 크기
  final double iconSize;

  /// 아이콘 색상
  final Color iconColor;

  /// 비활성화 상태 투명도
  final double disabledOpacity;

  const TileStyle({
    this.backgroundColor = Colors.transparent,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    this.borderRadius = 0,
    this.borderColor,
    this.borderWidth = 0,
    this.titleFontSize = 15,
    this.titleFontWeight = FontWeight.w400,
    this.titleColor = const Color(0xFF353549),
    this.subtitleFontSize = 12,
    this.subtitleFontWeight = FontWeight.w400,
    this.subtitleColor = const Color(0xFF767676),
    this.detailsFontSize = 14,
    this.detailsColor = const Color(0xFF767676),
    this.prefixSpacing = 12,
    this.suffixSpacing = 8,
    this.titleSubtitleSpacing = 4,
    this.iconSize = 24,
    this.iconColor = Colors.grey,
    this.disabledOpacity = 0.5,
  });

  /// 기본 스타일
  static const TileStyle defaultStyle = TileStyle();

  /// 드로어 메뉴 아이템 스타일
  static const TileStyle drawerItemStyle = TileStyle(
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    titleFontSize: 15,
    titleFontWeight: FontWeight.w400,
    titleColor: Color(0xFF353549),
    iconColor: Colors.grey,
  );

  TileStyle copyWith({
    Color? backgroundColor,
    EdgeInsetsGeometry? padding,
    double? borderRadius,
    Color? borderColor,
    double? borderWidth,
    double? titleFontSize,
    FontWeight? titleFontWeight,
    Color? titleColor,
    double? subtitleFontSize,
    FontWeight? subtitleFontWeight,
    Color? subtitleColor,
    double? detailsFontSize,
    Color? detailsColor,
    double? prefixSpacing,
    double? suffixSpacing,
    double? titleSubtitleSpacing,
    double? iconSize,
    Color? iconColor,
    double? disabledOpacity,
  }) {
    return TileStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      padding: padding ?? this.padding,
      borderRadius: borderRadius ?? this.borderRadius,
      borderColor: borderColor ?? this.borderColor,
      borderWidth: borderWidth ?? this.borderWidth,
      titleFontSize: titleFontSize ?? this.titleFontSize,
      titleFontWeight: titleFontWeight ?? this.titleFontWeight,
      titleColor: titleColor ?? this.titleColor,
      subtitleFontSize: subtitleFontSize ?? this.subtitleFontSize,
      subtitleFontWeight: subtitleFontWeight ?? this.subtitleFontWeight,
      subtitleColor: subtitleColor ?? this.subtitleColor,
      detailsFontSize: detailsFontSize ?? this.detailsFontSize,
      detailsColor: detailsColor ?? this.detailsColor,
      prefixSpacing: prefixSpacing ?? this.prefixSpacing,
      suffixSpacing: suffixSpacing ?? this.suffixSpacing,
      titleSubtitleSpacing: titleSubtitleSpacing ?? this.titleSubtitleSpacing,
      iconSize: iconSize ?? this.iconSize,
      iconColor: iconColor ?? this.iconColor,
      disabledOpacity: disabledOpacity ?? this.disabledOpacity,
    );
  }
}
