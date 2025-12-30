import 'package:flutter/material.dart';

/// CircleDetailOverlay 위젯의 스타일을 정의하는 클래스
class CircleDetailOverlayStyle {
  /// 오버레이 너비
  final double width;

  /// 오버레이 높이
  final double height;

  /// 최대 너비
  final double maxWidth;

  /// 최소 높이
  final double minHeight;

  /// 배경색
  final Color backgroundColor;

  /// 그림자 색상
  final Color shadowColor;

  /// 그림자 흐림 정도
  final double shadowBlurRadius;

  /// 그림자 오프셋
  final Offset shadowOffset;

  /// 헤더 높이
  final double headerHeight;

  /// 헤더 제목 크기
  final double headerTitleFontSize;

  /// 헤더 제목 굵기
  final FontWeight headerTitleFontWeight;

  /// 행 높이
  final double rowHeight;

  /// 테두리 색상
  final Color borderColor;

  /// 테두리 두께
  final double borderWidth;

  /// 내용 패딩
  final double contentPadding;

  /// 내용 크기
  final double contentFontSize;

  /// 내용 굵기
  final FontWeight contentFontWeight;

  /// 활성 링크 색상
  final Color activeLinkColor;

  /// 비활성 링크 색상
  final Color inactiveLinkColor;

  /// 닫기 아이콘 크기
  final double closeIconSize;

  /// 닫기 아이콘 색상
  final Color closeIconColor;

  const CircleDetailOverlayStyle({
    this.width = 195,
    this.height = 142,
    this.maxWidth = 300,
    this.minHeight = 100,
    this.backgroundColor = Colors.white,
    this.shadowColor = Colors.black26,
    this.shadowBlurRadius = 6,
    this.shadowOffset = const Offset(0, 2),
    this.headerHeight = 43,
    this.headerTitleFontSize = 13,
    this.headerTitleFontWeight = FontWeight.w700,
    this.rowHeight = 33,
    this.borderColor = const Color(0xFF767676),
    this.borderWidth = 0.5,
    this.contentPadding = 10,
    this.contentFontSize = 12,
    this.contentFontWeight = FontWeight.w400,
    this.activeLinkColor = const Color(0xff6EA4EF),
    this.inactiveLinkColor = const Color(0xff9A9A9A),
    this.closeIconSize = 20,
    this.closeIconColor = Colors.grey,
  });

  static const CircleDetailOverlayStyle defaultStyle = CircleDetailOverlayStyle();

  CircleDetailOverlayStyle copyWith({
    double? width,
    double? height,
    double? maxWidth,
    double? minHeight,
    Color? backgroundColor,
    Color? shadowColor,
    double? shadowBlurRadius,
    Offset? shadowOffset,
    double? headerHeight,
    double? headerTitleFontSize,
    FontWeight? headerTitleFontWeight,
    double? rowHeight,
    Color? borderColor,
    double? borderWidth,
    double? contentPadding,
    double? contentFontSize,
    FontWeight? contentFontWeight,
    Color? activeLinkColor,
    Color? inactiveLinkColor,
    double? closeIconSize,
    Color? closeIconColor,
  }) {
    return CircleDetailOverlayStyle(
      width: width ?? this.width,
      height: height ?? this.height,
      maxWidth: maxWidth ?? this.maxWidth,
      minHeight: minHeight ?? this.minHeight,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      shadowColor: shadowColor ?? this.shadowColor,
      shadowBlurRadius: shadowBlurRadius ?? this.shadowBlurRadius,
      shadowOffset: shadowOffset ?? this.shadowOffset,
      headerHeight: headerHeight ?? this.headerHeight,
      headerTitleFontSize: headerTitleFontSize ?? this.headerTitleFontSize,
      headerTitleFontWeight: headerTitleFontWeight ?? this.headerTitleFontWeight,
      rowHeight: rowHeight ?? this.rowHeight,
      borderColor: borderColor ?? this.borderColor,
      borderWidth: borderWidth ?? this.borderWidth,
      contentPadding: contentPadding ?? this.contentPadding,
      contentFontSize: contentFontSize ?? this.contentFontSize,
      contentFontWeight: contentFontWeight ?? this.contentFontWeight,
      activeLinkColor: activeLinkColor ?? this.activeLinkColor,
      inactiveLinkColor: inactiveLinkColor ?? this.inactiveLinkColor,
      closeIconSize: closeIconSize ?? this.closeIconSize,
      closeIconColor: closeIconColor ?? this.closeIconColor,
    );
  }
}
