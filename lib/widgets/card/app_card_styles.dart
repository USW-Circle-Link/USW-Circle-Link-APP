import 'package:flutter/material.dart';

/// AppCard 컴포넌트의 스타일 정의
class AppCardStyle {
  /// 배경색
  final Color backgroundColor;

  /// 패딩
  final EdgeInsetsGeometry padding;

  /// 마진
  final EdgeInsetsGeometry margin;

  /// 테두리 둥글기
  final double borderRadius;

  /// 테두리 색상
  final Color? borderColor;

  /// 테두리 너비
  final double borderWidth;

  /// 그림자 색상
  final Color? shadowColor;

  /// 그림자 블러
  final double shadowBlur;

  /// 그림자 오프셋
  final Offset shadowOffset;

  /// 그림자 퍼짐
  final double shadowSpread;

  /// 높이
  final double? elevation;

  const AppCardStyle({
    this.backgroundColor = Colors.white,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
    this.borderRadius = 8,
    this.borderColor,
    this.borderWidth = 0,
    this.shadowColor,
    this.shadowBlur = 0,
    this.shadowOffset = Offset.zero,
    this.shadowSpread = 0,
    this.elevation,
  });

  /// 기본 스타일
  static const AppCardStyle defaultStyle = AppCardStyle();

  /// 드로어 메뉴 카드 스타일
  static const AppCardStyle drawerCardStyle = AppCardStyle(
    backgroundColor: Colors.white,
    borderRadius: 8,
    margin: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
  );

  /// 리스트 아이템 카드 스타일
  static const AppCardStyle listItemStyle = AppCardStyle(
    backgroundColor: Colors.white,
    borderRadius: 8,
    padding: EdgeInsets.symmetric(vertical: 14, horizontal: 21),
  );

  /// 그림자가 있는 카드 스타일
  static AppCardStyle elevatedStyle({double elevation = 2}) => AppCardStyle(
        backgroundColor: Colors.white,
        borderRadius: 8,
        shadowColor: Colors.black.withValues(alpha: 0.1),
        shadowBlur: elevation * 2,
        shadowOffset: Offset(0, elevation),
        shadowSpread: 0,
      );

  AppCardStyle copyWith({
    Color? backgroundColor,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    double? borderRadius,
    Color? borderColor,
    double? borderWidth,
    Color? shadowColor,
    double? shadowBlur,
    Offset? shadowOffset,
    double? shadowSpread,
    double? elevation,
  }) {
    return AppCardStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      padding: padding ?? this.padding,
      margin: margin ?? this.margin,
      borderRadius: borderRadius ?? this.borderRadius,
      borderColor: borderColor ?? this.borderColor,
      borderWidth: borderWidth ?? this.borderWidth,
      shadowColor: shadowColor ?? this.shadowColor,
      shadowBlur: shadowBlur ?? this.shadowBlur,
      shadowOffset: shadowOffset ?? this.shadowOffset,
      shadowSpread: shadowSpread ?? this.shadowSpread,
      elevation: elevation ?? this.elevation,
    );
  }
}
