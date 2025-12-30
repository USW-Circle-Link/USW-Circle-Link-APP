import 'package:flutter/material.dart';

/// Popover 앵커 위치
enum PopoverAnchor {
  topLeft,
  topCenter,
  topRight,
  bottomLeft,
  bottomCenter,
  bottomRight,
  centerLeft,
  centerRight,
}

extension PopoverAnchorExtension on PopoverAnchor {
  Alignment toAlignment() {
    switch (this) {
      case PopoverAnchor.topLeft:
        return Alignment.topLeft;
      case PopoverAnchor.topCenter:
        return Alignment.topCenter;
      case PopoverAnchor.topRight:
        return Alignment.topRight;
      case PopoverAnchor.bottomLeft:
        return Alignment.bottomLeft;
      case PopoverAnchor.bottomCenter:
        return Alignment.bottomCenter;
      case PopoverAnchor.bottomRight:
        return Alignment.bottomRight;
      case PopoverAnchor.centerLeft:
        return Alignment.centerLeft;
      case PopoverAnchor.centerRight:
        return Alignment.centerRight;
    }
  }
}

/// Popover 컴포넌트의 스타일 정의
class PopoverStyle {
  /// 배경색
  final Color backgroundColor;

  /// 테두리 둥글기
  final double borderRadius;

  /// 테두리 색상
  final Color? borderColor;

  /// 테두리 너비
  final double borderWidth;

  /// 그림자 색상
  final Color shadowColor;

  /// 그림자 블러
  final double shadowBlur;

  /// 그림자 오프셋
  final Offset shadowOffset;

  /// 배리어(배경 오버레이) 색상
  final Color? barrierColor;

  /// 자식과의 간격
  final double spacing;

  /// 애니메이션 지속 시간
  final Duration animationDuration;

  const PopoverStyle({
    this.backgroundColor = Colors.white,
    this.borderRadius = 16,
    this.borderColor,
    this.borderWidth = 0,
    this.shadowColor = const Color(0x1A000000),
    this.shadowBlur = 10,
    this.shadowOffset = const Offset(0, 4),
    this.barrierColor,
    this.spacing = 8,
    this.animationDuration = const Duration(milliseconds: 200),
  });

  /// 기본 스타일
  static const PopoverStyle defaultStyle = PopoverStyle();

  /// 어두운 배경 오버레이가 있는 스타일
  static PopoverStyle withBarrier = PopoverStyle(
    barrierColor: Colors.black.withValues(alpha: 0.5),
  );

  PopoverStyle copyWith({
    Color? backgroundColor,
    double? borderRadius,
    Color? borderColor,
    double? borderWidth,
    Color? shadowColor,
    double? shadowBlur,
    Offset? shadowOffset,
    Color? barrierColor,
    double? spacing,
    Duration? animationDuration,
  }) {
    return PopoverStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderRadius: borderRadius ?? this.borderRadius,
      borderColor: borderColor ?? this.borderColor,
      borderWidth: borderWidth ?? this.borderWidth,
      shadowColor: shadowColor ?? this.shadowColor,
      shadowBlur: shadowBlur ?? this.shadowBlur,
      shadowOffset: shadowOffset ?? this.shadowOffset,
      barrierColor: barrierColor ?? this.barrierColor,
      spacing: spacing ?? this.spacing,
      animationDuration: animationDuration ?? this.animationDuration,
    );
  }
}
