import 'package:flutter/material.dart';

/// CircleInfoTile 컴포넌트의 스타일 정의
class CircleInfoTileStyle {
  /// 전체 패딩
  final EdgeInsetsGeometry padding;

  /// 이미지 너비
  final double imageWidth;

  /// 이미지 높이
  final double imageHeight;

  /// 이미지 테두리 둥글기
  final double imageBorderRadius;

  /// 이미지 테두리 색상
  final Color imageBorderColor;

  /// 이미지와 콘텐츠 사이 간격
  final double imageContentSpacing;

  /// 동아리 이름 폰트 크기
  final double nameFontSize;

  /// 동아리 이름 폰트 굵기
  final FontWeight nameFontWeight;

  /// 동아리 이름 색상 (null이면 테마의 onSurface 사용)
  final Color? nameColor;

  /// 회장 라벨 폰트 크기
  final double leaderLabelFontSize;

  /// 회장 라벨 색상
  final Color leaderLabelColor;

  /// 회장 이름 폰트 굵기
  final FontWeight leaderNameFontWeight;

  /// 회장 이름 색상
  final Color leaderNameColor;

  /// 이름과 회장 사이 간격
  final double nameLeaderSpacing;

  /// 회장과 해시태그 사이 간격
  final double leaderHashtagSpacing;

  /// 해시태그 배경색
  final Color hashtagBackgroundColor;

  /// 해시태그 텍스트 색상
  final Color hashtagTextColor;

  /// 해시태그 폰트 크기
  final double hashtagFontSize;

  /// 해시태그 테두리 둥글기
  final double hashtagBorderRadius;

  /// 해시태그 간 간격
  final double hashtagSpacing;

  const CircleInfoTileStyle({
    this.padding = const EdgeInsets.symmetric(horizontal: 21, vertical: 0),
    this.imageWidth = 82,
    this.imageHeight = 82,
    this.imageBorderRadius = 8,
    this.imageBorderColor = const Color(0xffc4c4c4),
    this.imageContentSpacing = 16,
    this.nameFontSize = 18,
    this.nameFontWeight = FontWeight.w900,
    this.nameColor,
    this.leaderLabelFontSize = 14,
    this.leaderLabelColor = const Color(0xFF767676),
    this.leaderNameFontWeight = FontWeight.w800,
    this.leaderNameColor = const Color(0xFF353549),
    this.nameLeaderSpacing = 5,
    this.leaderHashtagSpacing = 8,
    this.hashtagBackgroundColor = const Color(0xFFC0C0C0),
    this.hashtagTextColor = Colors.white,
    this.hashtagFontSize = 12,
    this.hashtagBorderRadius = 8,
    this.hashtagSpacing = 8,
  });

  /// 기본 스타일
  static const CircleInfoTileStyle defaultStyle = CircleInfoTileStyle();

  /// 컴팩트 스타일 (circle_screen.dart 용)
  static const CircleInfoTileStyle compactStyle = CircleInfoTileStyle(
    imageWidth: 82,
    imageHeight: 82,
    imageBorderRadius: 12,
  );

  CircleInfoTileStyle copyWith({
    EdgeInsetsGeometry? padding,
    double? imageWidth,
    double? imageHeight,
    double? imageBorderRadius,
    Color? imageBorderColor,
    double? imageContentSpacing,
    double? nameFontSize,
    FontWeight? nameFontWeight,
    Color? nameColor,
    double? leaderLabelFontSize,
    Color? leaderLabelColor,
    FontWeight? leaderNameFontWeight,
    Color? leaderNameColor,
    double? nameLeaderSpacing,
    double? leaderHashtagSpacing,
    Color? hashtagBackgroundColor,
    Color? hashtagTextColor,
    double? hashtagFontSize,
    double? hashtagBorderRadius,
    double? hashtagSpacing,
  }) {
    return CircleInfoTileStyle(
      padding: padding ?? this.padding,
      imageWidth: imageWidth ?? this.imageWidth,
      imageHeight: imageHeight ?? this.imageHeight,
      imageBorderRadius: imageBorderRadius ?? this.imageBorderRadius,
      imageBorderColor: imageBorderColor ?? this.imageBorderColor,
      imageContentSpacing: imageContentSpacing ?? this.imageContentSpacing,
      nameFontSize: nameFontSize ?? this.nameFontSize,
      nameFontWeight: nameFontWeight ?? this.nameFontWeight,
      nameColor: nameColor ?? this.nameColor,
      leaderLabelFontSize: leaderLabelFontSize ?? this.leaderLabelFontSize,
      leaderLabelColor: leaderLabelColor ?? this.leaderLabelColor,
      leaderNameFontWeight: leaderNameFontWeight ?? this.leaderNameFontWeight,
      leaderNameColor: leaderNameColor ?? this.leaderNameColor,
      nameLeaderSpacing: nameLeaderSpacing ?? this.nameLeaderSpacing,
      leaderHashtagSpacing: leaderHashtagSpacing ?? this.leaderHashtagSpacing,
      hashtagBackgroundColor:
          hashtagBackgroundColor ?? this.hashtagBackgroundColor,
      hashtagTextColor: hashtagTextColor ?? this.hashtagTextColor,
      hashtagFontSize: hashtagFontSize ?? this.hashtagFontSize,
      hashtagBorderRadius: hashtagBorderRadius ?? this.hashtagBorderRadius,
      hashtagSpacing: hashtagSpacing ?? this.hashtagSpacing,
    );
  }
}
