import 'package:flutter/material.dart';

/// NoticeList 위젯의 스타일을 정의하는 클래스
class NoticeListStyle {
  /// 구분선 두께
  final double dividerThickness;

  /// 첫 번째 아이템 상단 여백
  final double firstItemTopMargin;

  /// 수평 패딩
  final double horizontalPadding;

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

  /// 제목과 부제목 사이 간격
  final double titleSubtitleSpacing;

  const NoticeListStyle({
    this.dividerThickness = 1,
    this.firstItemTopMargin = 16,
    this.horizontalPadding = 16,
    this.titleColor = const Color(0xFF000000),
    this.titleFontSize = 18,
    this.titleFontWeight = FontWeight.w800,
    this.subtitleColor = const Color(0xFF767676),
    this.subtitleFontSize = 14,
    this.subtitleFontWeight = FontWeight.w400,
    this.titleSubtitleSpacing = 20,
  });

  static const NoticeListStyle defaultStyle = NoticeListStyle();

  NoticeListStyle copyWith({
    double? dividerThickness,
    double? firstItemTopMargin,
    double? horizontalPadding,
    Color? titleColor,
    double? titleFontSize,
    FontWeight? titleFontWeight,
    Color? subtitleColor,
    double? subtitleFontSize,
    FontWeight? subtitleFontWeight,
    double? titleSubtitleSpacing,
  }) {
    return NoticeListStyle(
      dividerThickness: dividerThickness ?? this.dividerThickness,
      firstItemTopMargin: firstItemTopMargin ?? this.firstItemTopMargin,
      horizontalPadding: horizontalPadding ?? this.horizontalPadding,
      titleColor: titleColor ?? this.titleColor,
      titleFontSize: titleFontSize ?? this.titleFontSize,
      titleFontWeight: titleFontWeight ?? this.titleFontWeight,
      subtitleColor: subtitleColor ?? this.subtitleColor,
      subtitleFontSize: subtitleFontSize ?? this.subtitleFontSize,
      subtitleFontWeight: subtitleFontWeight ?? this.subtitleFontWeight,
      titleSubtitleSpacing: titleSubtitleSpacing ?? this.titleSubtitleSpacing,
    );
  }
}
