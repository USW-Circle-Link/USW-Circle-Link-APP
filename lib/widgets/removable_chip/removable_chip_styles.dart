import 'package:flutter/material.dart';

/// RemovableChip 위젯의 스타일을 정의하는 클래스
class RemovableChipStyle {
  /// 배경색
  final Color backgroundColor;

  /// 테두리 색상
  final Color borderColor;

  /// 테두리 둥글기
  final double borderRadius;

  /// 라벨 색상
  final Color labelColor;

  /// 라벨 굵기
  final FontWeight labelFontWeight;

  /// 삭제 아이콘 크기
  final double deleteIconSize;

  /// 라벨 패딩
  final EdgeInsetsGeometry labelPadding;

  /// 칩 패딩
  final EdgeInsetsGeometry padding;

  const RemovableChipStyle({
    this.backgroundColor = Colors.white,
    this.borderColor = const Color(0xFFFF9A21),
    this.borderRadius = 15,
    this.labelColor = const Color(0xFF434343),
    this.labelFontWeight = FontWeight.w300,
    this.deleteIconSize = 16,
    this.labelPadding = const EdgeInsets.only(left: 10),
    this.padding = EdgeInsets.zero,
  });

  /// 기본 스타일
  static const RemovableChipStyle defaultStyle = RemovableChipStyle();

  /// 스타일 복사 및 수정
  RemovableChipStyle copyWith({
    Color? backgroundColor,
    Color? borderColor,
    double? borderRadius,
    Color? labelColor,
    FontWeight? labelFontWeight,
    double? deleteIconSize,
    EdgeInsetsGeometry? labelPadding,
    EdgeInsetsGeometry? padding,
  }) {
    return RemovableChipStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderColor: borderColor ?? this.borderColor,
      borderRadius: borderRadius ?? this.borderRadius,
      labelColor: labelColor ?? this.labelColor,
      labelFontWeight: labelFontWeight ?? this.labelFontWeight,
      deleteIconSize: deleteIconSize ?? this.deleteIconSize,
      labelPadding: labelPadding ?? this.labelPadding,
      padding: padding ?? this.padding,
    );
  }
}
