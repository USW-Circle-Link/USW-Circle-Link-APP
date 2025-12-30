import 'package:flutter/material.dart';

/// NotificationOverlay 위젯의 스타일을 정의하는 클래스
class NotificationOverlayStyle {
  /// 배경 오버레이 색상
  final Color overlayBackgroundColor;

  /// 컨테이너 너비
  final double containerWidth;

  /// 컨테이너 높이
  final double containerHeight;

  /// 컨테이너 모서리 둥글기
  final double borderRadius;

  /// 컨테이너 배경색
  final Color backgroundColor;

  /// 컨테이너 상단 위치
  final double topPosition;

  /// 컨테이너 오른쪽 위치
  final double rightPosition;

  /// 제목 상단 패딩
  final double titleTopPadding;

  /// 제목 크기
  final double titleFontSize;

  /// 제목 굵기
  final FontWeight titleFontWeight;

  const NotificationOverlayStyle({
    this.overlayBackgroundColor = Colors.black54,
    this.containerWidth = 208,
    this.containerHeight = 220,
    this.borderRadius = 16,
    this.backgroundColor = Colors.white,
    this.topPosition = kToolbarHeight - 10,
    this.rightPosition = 24,
    this.titleTopPadding = 16,
    this.titleFontSize = 14,
    this.titleFontWeight = FontWeight.w800,
  });

  static const NotificationOverlayStyle defaultStyle = NotificationOverlayStyle();

  NotificationOverlayStyle copyWith({
    Color? overlayBackgroundColor,
    double? containerWidth,
    double? containerHeight,
    double? borderRadius,
    Color? backgroundColor,
    double? topPosition,
    double? rightPosition,
    double? titleTopPadding,
    double? titleFontSize,
    FontWeight? titleFontWeight,
  }) {
    return NotificationOverlayStyle(
      overlayBackgroundColor: overlayBackgroundColor ?? this.overlayBackgroundColor,
      containerWidth: containerWidth ?? this.containerWidth,
      containerHeight: containerHeight ?? this.containerHeight,
      borderRadius: borderRadius ?? this.borderRadius,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      topPosition: topPosition ?? this.topPosition,
      rightPosition: rightPosition ?? this.rightPosition,
      titleTopPadding: titleTopPadding ?? this.titleTopPadding,
      titleFontSize: titleFontSize ?? this.titleFontSize,
      titleFontWeight: titleFontWeight ?? this.titleFontWeight,
    );
  }
}
