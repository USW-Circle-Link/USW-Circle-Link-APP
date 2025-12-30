import 'package:flutter/material.dart';

/// RoundedDropdown 위젯의 스타일을 정의하는 클래스
class RoundedDropdownStyle {
  /// 기본 높이
  final double height;

  /// 드롭다운 배경색
  final Color dropdownColor;

  /// 테두리 색상
  final Color borderColor;

  /// 테두리 두께
  final double borderWidth;

  /// 배경색
  final Color backgroundColor;

  /// 콘텐츠 패딩
  final EdgeInsetsGeometry contentPadding;

  /// 아이콘 색상
  final Color iconColor;

  /// 아이콘 크기
  final double iconSize;

  /// 기본 모서리 둥글기
  final double borderRadius;

  const RoundedDropdownStyle({
    this.height = 48,
    this.dropdownColor = Colors.white,
    this.borderColor = const Color(0xFFCECECE),
    this.borderWidth = 1,
    this.backgroundColor = Colors.white,
    this.contentPadding = const EdgeInsets.fromLTRB(16, 16, 16, 8),
    this.iconColor = const Color(0xFF989898),
    this.iconSize = 7,
    this.borderRadius = 0,
  });

  static const RoundedDropdownStyle defaultStyle = RoundedDropdownStyle();

  RoundedDropdownStyle copyWith({
    double? height,
    Color? dropdownColor,
    Color? borderColor,
    double? borderWidth,
    Color? backgroundColor,
    EdgeInsetsGeometry? contentPadding,
    Color? iconColor,
    double? iconSize,
    double? borderRadius,
  }) {
    return RoundedDropdownStyle(
      height: height ?? this.height,
      dropdownColor: dropdownColor ?? this.dropdownColor,
      borderColor: borderColor ?? this.borderColor,
      borderWidth: borderWidth ?? this.borderWidth,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      contentPadding: contentPadding ?? this.contentPadding,
      iconColor: iconColor ?? this.iconColor,
      iconSize: iconSize ?? this.iconSize,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }
}
