import 'package:flutter/material.dart';

/// RemovableBadge 컴포넌트의 스타일 정의
///
/// 필터링에 사용되는 삭제 가능한 배지의 스타일입니다.
class RemovableBadgeStyle {
  /// 배경색
  final Color backgroundColor;

  /// 테두리 색상
  final Color borderColor;

  /// 테두리 너비
  final double borderWidth;

  /// 테두리 둥글기
  final double borderRadius;

  /// 라벨 색상
  final Color labelColor;

  /// 라벨 폰트 크기
  final double labelFontSize;

  /// 라벨 굵기
  final FontWeight labelFontWeight;

  /// 삭제 아이콘 크기
  final double deleteIconSize;

  /// 삭제 아이콘 색상
  final Color deleteIconColor;

  /// 라벨 패딩
  final EdgeInsetsGeometry labelPadding;

  /// 전체 패딩
  final EdgeInsetsGeometry padding;

  /// 아이콘과 라벨 사이 간격
  final double spacing;

  const RemovableBadgeStyle({
    this.backgroundColor = Colors.white,
    this.borderColor = const Color(0xFFFF9A21),
    this.borderWidth = 1,
    this.borderRadius = 15,
    this.labelColor = const Color(0xFF434343),
    this.labelFontSize = 12,
    this.labelFontWeight = FontWeight.w400,
    this.deleteIconSize = 16,
    this.deleteIconColor = const Color(0xFF434343),
    this.labelPadding = const EdgeInsets.only(left: 10),
    this.padding = EdgeInsets.zero,
    this.spacing = 4,
  });

  /// 기본 스타일 (오렌지 테두리)
  static const RemovableBadgeStyle defaultStyle = RemovableBadgeStyle();

  /// 회색 테두리 스타일
  static const RemovableBadgeStyle grayStyle = RemovableBadgeStyle(
    borderColor: Color(0xFFCECECE),
  );

  RemovableBadgeStyle copyWith({
    Color? backgroundColor,
    Color? borderColor,
    double? borderWidth,
    double? borderRadius,
    Color? labelColor,
    double? labelFontSize,
    FontWeight? labelFontWeight,
    double? deleteIconSize,
    Color? deleteIconColor,
    EdgeInsetsGeometry? labelPadding,
    EdgeInsetsGeometry? padding,
    double? spacing,
  }) {
    return RemovableBadgeStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderColor: borderColor ?? this.borderColor,
      borderWidth: borderWidth ?? this.borderWidth,
      borderRadius: borderRadius ?? this.borderRadius,
      labelColor: labelColor ?? this.labelColor,
      labelFontSize: labelFontSize ?? this.labelFontSize,
      labelFontWeight: labelFontWeight ?? this.labelFontWeight,
      deleteIconSize: deleteIconSize ?? this.deleteIconSize,
      deleteIconColor: deleteIconColor ?? this.deleteIconColor,
      labelPadding: labelPadding ?? this.labelPadding,
      padding: padding ?? this.padding,
      spacing: spacing ?? this.spacing,
    );
  }
}
