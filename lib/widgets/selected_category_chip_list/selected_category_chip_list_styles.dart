import 'package:flutter/material.dart';

/// SelectedCategoryChipList 위젯의 스타일을 정의하는 클래스
class SelectedCategoryChipListStyle {
  /// 배경색
  final Color backgroundColor;

  /// 왼쪽 패딩
  final double leftPadding;

  /// 컨테이너 높이
  final double height;

  /// 칩 간격
  final double chipSpacing;

  const SelectedCategoryChipListStyle({
    this.backgroundColor = Colors.white,
    this.leftPadding = 24,
    this.height = 60,
    this.chipSpacing = 10,
  });

  static const SelectedCategoryChipListStyle defaultStyle = SelectedCategoryChipListStyle();

  SelectedCategoryChipListStyle copyWith({
    Color? backgroundColor,
    double? leftPadding,
    double? height,
    double? chipSpacing,
  }) {
    return SelectedCategoryChipListStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      leftPadding: leftPadding ?? this.leftPadding,
      height: height ?? this.height,
      chipSpacing: chipSpacing ?? this.chipSpacing,
    );
  }
}
