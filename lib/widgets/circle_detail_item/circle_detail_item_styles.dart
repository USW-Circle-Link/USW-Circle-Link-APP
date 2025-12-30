import 'package:flutter/material.dart';

/// CircleDetailItem 위젯의 스타일을 정의하는 클래스
class CircleDetailItemStyle {
  /// 컨테이너 너비
  final double containerWidth;

  /// 컨테이너 배경색
  final Color backgroundColor;

  /// 컨테이너 모서리 둥글기
  final double borderRadius;

  /// 컨텐츠 패딩 (vertical)
  final double paddingVertical;

  /// 컨텐츠 패딩 (horizontal)
  final double paddingHorizontal;

  /// 이미지 높이
  final double imageHeight;

  /// 이미지 너비
  final double imageWidth;

  /// 이미지 테두리 색상
  final Color imageBorderColor;

  /// 이름 색상
  final Color nameColor;

  /// 이름 크기
  final double nameFontSize;

  /// 이름 굵기
  final FontWeight nameFontWeight;

  /// 부제목 색상
  final Color subtitleColor;

  /// 부제목 크기
  final double subtitleFontSize;

  /// 부제목 굵기
  final FontWeight subtitleFontWeight;

  /// 리더 이름 색상
  final Color leaderNameColor;

  /// 리더 이름 굵기
  final FontWeight leaderNameFontWeight;

  /// 상태 배지 모서리 둥글기
  final double statusBadgeRadius;

  /// 상태 텍스트 크기
  final double statusFontSize;

  /// 상태 텍스트 굵기
  final FontWeight statusFontWeight;

  /// 아이템 간 간격
  final double itemSpacing;

  const CircleDetailItemStyle({
    this.containerWidth = 375,
    this.backgroundColor = const Color(0xffFFFFFF),
    this.borderRadius = 8,
    this.paddingVertical = 14,
    this.paddingHorizontal = 21,
    this.imageHeight = 80,
    this.imageWidth = 67,
    this.imageBorderColor = const Color(0xffc4c4c4),
    this.nameColor = Colors.black,
    this.nameFontSize = 18,
    this.nameFontWeight = FontWeight.w900,
    this.subtitleColor = const Color(0xFF767676),
    this.subtitleFontSize = 14,
    this.subtitleFontWeight = FontWeight.w400,
    this.leaderNameColor = const Color(0xFF353549),
    this.leaderNameFontWeight = FontWeight.w800,
    this.statusBadgeRadius = 16,
    this.statusFontSize = 10,
    this.statusFontWeight = FontWeight.w800,
    this.itemSpacing = 12,
  });

  static const CircleDetailItemStyle defaultStyle = CircleDetailItemStyle();

  CircleDetailItemStyle copyWith({
    double? containerWidth,
    Color? backgroundColor,
    double? borderRadius,
    double? paddingVertical,
    double? paddingHorizontal,
    double? imageHeight,
    double? imageWidth,
    Color? imageBorderColor,
    Color? nameColor,
    double? nameFontSize,
    FontWeight? nameFontWeight,
    Color? subtitleColor,
    double? subtitleFontSize,
    FontWeight? subtitleFontWeight,
    Color? leaderNameColor,
    FontWeight? leaderNameFontWeight,
    double? statusBadgeRadius,
    double? statusFontSize,
    FontWeight? statusFontWeight,
    double? itemSpacing,
  }) {
    return CircleDetailItemStyle(
      containerWidth: containerWidth ?? this.containerWidth,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderRadius: borderRadius ?? this.borderRadius,
      paddingVertical: paddingVertical ?? this.paddingVertical,
      paddingHorizontal: paddingHorizontal ?? this.paddingHorizontal,
      imageHeight: imageHeight ?? this.imageHeight,
      imageWidth: imageWidth ?? this.imageWidth,
      imageBorderColor: imageBorderColor ?? this.imageBorderColor,
      nameColor: nameColor ?? this.nameColor,
      nameFontSize: nameFontSize ?? this.nameFontSize,
      nameFontWeight: nameFontWeight ?? this.nameFontWeight,
      subtitleColor: subtitleColor ?? this.subtitleColor,
      subtitleFontSize: subtitleFontSize ?? this.subtitleFontSize,
      subtitleFontWeight: subtitleFontWeight ?? this.subtitleFontWeight,
      leaderNameColor: leaderNameColor ?? this.leaderNameColor,
      leaderNameFontWeight: leaderNameFontWeight ?? this.leaderNameFontWeight,
      statusBadgeRadius: statusBadgeRadius ?? this.statusBadgeRadius,
      statusFontSize: statusFontSize ?? this.statusFontSize,
      statusFontWeight: statusFontWeight ?? this.statusFontWeight,
      itemSpacing: itemSpacing ?? this.itemSpacing,
    );
  }
}
