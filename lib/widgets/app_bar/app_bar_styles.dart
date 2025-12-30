import 'package:flutter/material.dart';

/// AppBar 위젯의 스타일을 정의하는 클래스
class AppBarStyle {
  /// 배경색
  final Color backgroundColor;

  /// 내부 패딩
  final EdgeInsetsGeometry padding;

  /// 툴바 높이
  final double toolbarHeight;

  /// 그림자 높이
  final double elevation;

  const AppBarStyle({
    this.backgroundColor = Colors.white,
    this.padding = const EdgeInsets.symmetric(horizontal: 12),
    this.toolbarHeight = 52,
    this.elevation = 0.0,
  });

  /// 기본 스타일
  static const AppBarStyle defaultStyle = AppBarStyle();

  /// 스타일 복사 및 수정
  AppBarStyle copyWith({
    Color? backgroundColor,
    EdgeInsetsGeometry? padding,
    double? toolbarHeight,
    double? elevation,
  }) {
    return AppBarStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      padding: padding ?? this.padding,
      toolbarHeight: toolbarHeight ?? this.toolbarHeight,
      elevation: elevation ?? this.elevation,
    );
  }
}
