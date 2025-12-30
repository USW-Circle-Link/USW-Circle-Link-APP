import 'package:flutter/material.dart';

/// CloudMessaging 위젯의 스타일을 정의하는 클래스
class CloudMessagingStyle {
  /// 아이템 패딩
  final EdgeInsetsGeometry padding;

  /// 텍스트 크기
  final double fontSize;

  /// 텍스트 굵기
  final FontWeight fontWeight;

  /// 닫기 아이콘 크기
  final double closeIconSize;

  /// 닫기 아이콘 색상
  final Color closeIconColor;

  /// 아이콘과 텍스트 사이 간격
  final double spacing;

  /// 확장 텍스트 상단 패딩
  final double expandedTextTopPadding;

  const CloudMessagingStyle({
    this.padding = const EdgeInsets.fromLTRB(16, 4, 0, 4),
    this.fontSize = 12,
    this.fontWeight = FontWeight.w400,
    this.closeIconSize = 16,
    this.closeIconColor = Colors.grey,
    this.spacing = 8,
    this.expandedTextTopPadding = 4,
  });

  static const CloudMessagingStyle defaultStyle = CloudMessagingStyle();

  CloudMessagingStyle copyWith({
    EdgeInsetsGeometry? padding,
    double? fontSize,
    FontWeight? fontWeight,
    double? closeIconSize,
    Color? closeIconColor,
    double? spacing,
    double? expandedTextTopPadding,
  }) {
    return CloudMessagingStyle(
      padding: padding ?? this.padding,
      fontSize: fontSize ?? this.fontSize,
      fontWeight: fontWeight ?? this.fontWeight,
      closeIconSize: closeIconSize ?? this.closeIconSize,
      closeIconColor: closeIconColor ?? this.closeIconColor,
      spacing: spacing ?? this.spacing,
      expandedTextTopPadding: expandedTextTopPadding ?? this.expandedTextTopPadding,
    );
  }
}
