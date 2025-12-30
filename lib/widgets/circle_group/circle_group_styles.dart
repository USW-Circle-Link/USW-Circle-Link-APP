import 'package:flutter/material.dart';

/// CircleGroup 위젯의 스타일을 정의하는 클래스
class CircleGroupStyle {
  /// 배경색
  final Color backgroundColor;

  /// 컨테이너 여백 (bottom)
  final double marginBottom;

  /// 컨테이너 패딩 (top, bottom)
  final double paddingVertical;

  /// 제목 왼쪽 여백
  final double titleLeftPadding;

  /// 제목 크기
  final double titleFontSize;

  /// 제목 색상
  final Color titleColor;

  /// 제목 굵기
  final FontWeight titleFontWeight;

  /// 제목과 리스트 사이 간격
  final double titleListSpacing;

  /// 리스트 높이
  final double listHeight;

  /// 리스트 왼쪽 패딩
  final double listLeftPadding;

  /// 리스트 오른쪽 패딩
  final double listRightPadding;

  const CircleGroupStyle({
    this.backgroundColor = Colors.white,
    this.marginBottom = 10,
    this.paddingVertical = 16,
    this.titleLeftPadding = 24,
    this.titleFontSize = 16,
    this.titleColor = Colors.black,
    this.titleFontWeight = FontWeight.w700,
    this.titleListSpacing = 8,
    this.listHeight = 204,
    this.listLeftPadding = 24,
    this.listRightPadding = 16,
  });

  static const CircleGroupStyle defaultStyle = CircleGroupStyle();

  CircleGroupStyle copyWith({
    Color? backgroundColor,
    double? marginBottom,
    double? paddingVertical,
    double? titleLeftPadding,
    double? titleFontSize,
    Color? titleColor,
    FontWeight? titleFontWeight,
    double? titleListSpacing,
    double? listHeight,
    double? listLeftPadding,
    double? listRightPadding,
  }) {
    return CircleGroupStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      marginBottom: marginBottom ?? this.marginBottom,
      paddingVertical: paddingVertical ?? this.paddingVertical,
      titleLeftPadding: titleLeftPadding ?? this.titleLeftPadding,
      titleFontSize: titleFontSize ?? this.titleFontSize,
      titleColor: titleColor ?? this.titleColor,
      titleFontWeight: titleFontWeight ?? this.titleFontWeight,
      titleListSpacing: titleListSpacing ?? this.titleListSpacing,
      listHeight: listHeight ?? this.listHeight,
      listLeftPadding: listLeftPadding ?? this.listLeftPadding,
      listRightPadding: listRightPadding ?? this.listRightPadding,
    );
  }
}
