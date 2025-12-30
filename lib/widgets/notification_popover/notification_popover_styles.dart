import 'package:flutter/material.dart';

/// NotificationPopover 컴포넌트의 스타일 정의
class NotificationPopoverStyle {
  /// 너비
  final double width;

  /// 높이
  final double height;

  /// 배경색
  final Color backgroundColor;

  /// 테두리 둥글기
  final double borderRadius;

  /// 헤더 패딩
  final EdgeInsetsGeometry headerPadding;

  /// 헤더 폰트 크기
  final double headerFontSize;

  /// 헤더 폰트 굵기
  final FontWeight headerFontWeight;

  /// 헤더 색상
  final Color headerColor;

  /// 아이템 패딩
  final EdgeInsetsGeometry itemPadding;

  /// 아이템 폰트 크기
  final double itemFontSize;

  /// 아이템 색상
  final Color itemColor;

  /// 닫기 아이콘 크기
  final double closeIconSize;

  /// 닫기 아이콘 색상
  final Color closeIconColor;

  /// 빈 상태 메시지 색상
  final Color emptyMessageColor;

  const NotificationPopoverStyle({
    this.width = 208,
    this.height = 220,
    this.backgroundColor = Colors.white,
    this.borderRadius = 16,
    this.headerPadding = const EdgeInsets.only(top: 16),
    this.headerFontSize = 14,
    this.headerFontWeight = FontWeight.w800,
    this.headerColor = const Color(0xFF353549),
    this.itemPadding = const EdgeInsets.fromLTRB(16, 4, 0, 4),
    this.itemFontSize = 12,
    this.itemColor = const Color(0xFF353549),
    this.closeIconSize = 16,
    this.closeIconColor = Colors.grey,
    this.emptyMessageColor = const Color(0xFF767676),
  });

  /// 기본 스타일
  static const NotificationPopoverStyle defaultStyle =
      NotificationPopoverStyle();

  NotificationPopoverStyle copyWith({
    double? width,
    double? height,
    Color? backgroundColor,
    double? borderRadius,
    EdgeInsetsGeometry? headerPadding,
    double? headerFontSize,
    FontWeight? headerFontWeight,
    Color? headerColor,
    EdgeInsetsGeometry? itemPadding,
    double? itemFontSize,
    Color? itemColor,
    double? closeIconSize,
    Color? closeIconColor,
    Color? emptyMessageColor,
  }) {
    return NotificationPopoverStyle(
      width: width ?? this.width,
      height: height ?? this.height,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderRadius: borderRadius ?? this.borderRadius,
      headerPadding: headerPadding ?? this.headerPadding,
      headerFontSize: headerFontSize ?? this.headerFontSize,
      headerFontWeight: headerFontWeight ?? this.headerFontWeight,
      headerColor: headerColor ?? this.headerColor,
      itemPadding: itemPadding ?? this.itemPadding,
      itemFontSize: itemFontSize ?? this.itemFontSize,
      itemColor: itemColor ?? this.itemColor,
      closeIconSize: closeIconSize ?? this.closeIconSize,
      closeIconColor: closeIconColor ?? this.closeIconColor,
      emptyMessageColor: emptyMessageColor ?? this.emptyMessageColor,
    );
  }
}
