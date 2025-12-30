import 'package:flutter/material.dart';

/// 드로어 메뉴 위젯의 스타일을 정의하는 클래스
class DrawerMenuStyle {
  /// 드로어 배경색
  final Color backgroundColor;

  /// 드로어 너비
  final double width;

  /// 헤더 배경색
  final Color headerBackgroundColor;

  /// 헤더 텍스트 크기 (사용자 이름 또는 로그인 텍스트)
  final double headerFontSize;

  /// 헤더 텍스트 색상
  final Color headerColor;

  /// 헤더 텍스트 굵기
  final FontWeight headerFontWeight;

  /// 서브 텍스트 크기 ('님' 텍스트)
  final double subTextFontSize;

  /// 서브 텍스트 색상
  final Color subTextColor;

  /// 서브 텍스트 굵기
  final FontWeight subTextFontWeight;

  /// 프로필 아이콘 크기
  final double profileIconSize;

  /// 프로필 아이콘 색상
  final Color profileIconColor;

  /// 화살표 아이콘 크기
  final double arrowIconSize;

  /// 화살표 아이콘 색상
  final Color arrowIconColor;

  /// 하단 메뉴 텍스트 크기
  final double bottomMenuFontSize;

  /// 하단 메뉴 텍스트 색상
  final Color bottomMenuColor;

  /// 하단 메뉴 텍스트 굵기
  final FontWeight bottomMenuFontWeight;

  /// 하단 메뉴 수평 패딩
  final double bottomMenuHorizontalPadding;

  /// 하단 메뉴 아이템 간격
  final double bottomMenuItemSpacing;

  const DrawerMenuStyle({
    this.backgroundColor = const Color(0xffF0F2F5),
    this.width = 290,
    this.headerBackgroundColor = Colors.white,
    this.headerFontSize = 18,
    this.headerColor = Colors.black,
    this.headerFontWeight = FontWeight.w800,
    this.subTextFontSize = 14,
    this.subTextColor = const Color(0xFF767676),
    this.subTextFontWeight = FontWeight.w600,
    this.profileIconSize = 30,
    this.profileIconColor = Colors.white,
    this.arrowIconSize = 24,
    this.arrowIconColor = Colors.black,
    this.bottomMenuFontSize = 12,
    this.bottomMenuColor = Colors.black,
    this.bottomMenuFontWeight = FontWeight.w400,
    this.bottomMenuHorizontalPadding = 24,
    this.bottomMenuItemSpacing = 16,
  });

  static const DrawerMenuStyle defaultStyle = DrawerMenuStyle();

  DrawerMenuStyle copyWith({
    Color? backgroundColor,
    double? width,
    Color? headerBackgroundColor,
    double? headerFontSize,
    Color? headerColor,
    FontWeight? headerFontWeight,
    double? subTextFontSize,
    Color? subTextColor,
    FontWeight? subTextFontWeight,
    double? profileIconSize,
    Color? profileIconColor,
    double? arrowIconSize,
    Color? arrowIconColor,
    double? bottomMenuFontSize,
    Color? bottomMenuColor,
    FontWeight? bottomMenuFontWeight,
    double? bottomMenuHorizontalPadding,
    double? bottomMenuItemSpacing,
  }) {
    return DrawerMenuStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      width: width ?? this.width,
      headerBackgroundColor:
          headerBackgroundColor ?? this.headerBackgroundColor,
      headerFontSize: headerFontSize ?? this.headerFontSize,
      headerColor: headerColor ?? this.headerColor,
      headerFontWeight: headerFontWeight ?? this.headerFontWeight,
      subTextFontSize: subTextFontSize ?? this.subTextFontSize,
      subTextColor: subTextColor ?? this.subTextColor,
      subTextFontWeight: subTextFontWeight ?? this.subTextFontWeight,
      profileIconSize: profileIconSize ?? this.profileIconSize,
      profileIconColor: profileIconColor ?? this.profileIconColor,
      arrowIconSize: arrowIconSize ?? this.arrowIconSize,
      arrowIconColor: arrowIconColor ?? this.arrowIconColor,
      bottomMenuFontSize: bottomMenuFontSize ?? this.bottomMenuFontSize,
      bottomMenuColor: bottomMenuColor ?? this.bottomMenuColor,
      bottomMenuFontWeight: bottomMenuFontWeight ?? this.bottomMenuFontWeight,
      bottomMenuHorizontalPadding:
          bottomMenuHorizontalPadding ?? this.bottomMenuHorizontalPadding,
      bottomMenuItemSpacing:
          bottomMenuItemSpacing ?? this.bottomMenuItemSpacing,
    );
  }
}
