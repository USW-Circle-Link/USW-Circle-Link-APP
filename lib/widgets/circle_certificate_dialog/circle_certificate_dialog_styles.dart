import 'package:flutter/material.dart';

/// CircleCertificateDialog 위젯의 스타일을 정의하는 클래스
class CircleCertificateDialogStyle {
  /// 다이얼로그 배경색
  final Color backgroundColor;

  /// 다이얼로그 너비
  final double width;

  /// 다이얼로그 모서리 둥글기
  final double borderRadius;

  /// 블러 강도
  final double blurSigma;

  /// 헤더 패딩
  final EdgeInsetsGeometry headerPadding;

  /// 헤더 테두리 색상
  final Color headerBorderColor;

  /// 헤더 텍스트 크기
  final double headerFontSize;

  /// 헤더 텍스트 색상
  final Color headerTextColor;

  /// 헤더 텍스트 굵기
  final FontWeight headerFontWeight;

  /// 입력 필드 너비
  final double inputWidth;

  /// 입력 필드 높이
  final double inputHeight;

  /// 입력 필드 모서리 둥글기
  final double inputBorderRadius;

  /// 입력 필드 배경색
  final Color inputBackgroundColor;

  /// 입력 텍스트 색상
  final Color inputTextColor;

  /// 힌트 텍스트 색상
  final Color hintTextColor;

  /// 입력 텍스트 크기
  final double inputFontSize;

  /// 버튼 너비
  final double buttonWidth;

  /// 버튼 높이
  final double buttonHeight;

  /// 버튼 모서리 둥글기
  final double buttonBorderRadius;

  /// 확인 버튼 배경색
  final Color confirmButtonBackgroundColor;

  /// 확인 버튼 텍스트 색상
  final Color confirmButtonTextColor;

  /// 취소 버튼 테두리 색상
  final Color cancelButtonBorderColor;

  /// 취소 버튼 텍스트 색상
  final Color cancelButtonTextColor;

  /// 성공 메시지 색상
  final Color successColor;

  /// 에러 메시지 색상
  final Color errorColor;

  const CircleCertificateDialogStyle({
    this.backgroundColor = const Color.fromRGBO(25, 21, 29, 0.80),
    this.width = 273,
    this.borderRadius = 14,
    this.blurSigma = 11,
    this.headerPadding = const EdgeInsets.all(16),
    this.headerBorderColor = const Color.fromRGBO(60, 60, 67, 0.36),
    this.headerFontSize = 17,
    this.headerTextColor = Colors.white,
    this.headerFontWeight = FontWeight.w400,
    this.inputWidth = 209,
    this.inputHeight = 35,
    this.inputBorderRadius = 12,
    this.inputBackgroundColor = Colors.black54,
    this.inputTextColor = Colors.white,
    this.hintTextColor = const Color(0xFFA0A0A0),
    this.inputFontSize = 16,
    this.buttonWidth = 100,
    this.buttonHeight = 40,
    this.buttonBorderRadius = 8,
    this.confirmButtonBackgroundColor = Colors.white,
    this.confirmButtonTextColor = Colors.black,
    this.cancelButtonBorderColor = Colors.white54,
    this.cancelButtonTextColor = Colors.white,
    this.successColor = Colors.greenAccent,
    this.errorColor = Colors.redAccent,
  });

  static const CircleCertificateDialogStyle defaultStyle = CircleCertificateDialogStyle();

  CircleCertificateDialogStyle copyWith({
    Color? backgroundColor,
    double? width,
    double? borderRadius,
    double? blurSigma,
    EdgeInsetsGeometry? headerPadding,
    Color? headerBorderColor,
    double? headerFontSize,
    Color? headerTextColor,
    FontWeight? headerFontWeight,
    double? inputWidth,
    double? inputHeight,
    double? inputBorderRadius,
    Color? inputBackgroundColor,
    Color? inputTextColor,
    Color? hintTextColor,
    double? inputFontSize,
    double? buttonWidth,
    double? buttonHeight,
    double? buttonBorderRadius,
    Color? confirmButtonBackgroundColor,
    Color? confirmButtonTextColor,
    Color? cancelButtonBorderColor,
    Color? cancelButtonTextColor,
    Color? successColor,
    Color? errorColor,
  }) {
    return CircleCertificateDialogStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      width: width ?? this.width,
      borderRadius: borderRadius ?? this.borderRadius,
      blurSigma: blurSigma ?? this.blurSigma,
      headerPadding: headerPadding ?? this.headerPadding,
      headerBorderColor: headerBorderColor ?? this.headerBorderColor,
      headerFontSize: headerFontSize ?? this.headerFontSize,
      headerTextColor: headerTextColor ?? this.headerTextColor,
      headerFontWeight: headerFontWeight ?? this.headerFontWeight,
      inputWidth: inputWidth ?? this.inputWidth,
      inputHeight: inputHeight ?? this.inputHeight,
      inputBorderRadius: inputBorderRadius ?? this.inputBorderRadius,
      inputBackgroundColor: inputBackgroundColor ?? this.inputBackgroundColor,
      inputTextColor: inputTextColor ?? this.inputTextColor,
      hintTextColor: hintTextColor ?? this.hintTextColor,
      inputFontSize: inputFontSize ?? this.inputFontSize,
      buttonWidth: buttonWidth ?? this.buttonWidth,
      buttonHeight: buttonHeight ?? this.buttonHeight,
      buttonBorderRadius: buttonBorderRadius ?? this.buttonBorderRadius,
      confirmButtonBackgroundColor: confirmButtonBackgroundColor ?? this.confirmButtonBackgroundColor,
      confirmButtonTextColor: confirmButtonTextColor ?? this.confirmButtonTextColor,
      cancelButtonBorderColor: cancelButtonBorderColor ?? this.cancelButtonBorderColor,
      cancelButtonTextColor: cancelButtonTextColor ?? this.cancelButtonTextColor,
      successColor: successColor ?? this.successColor,
      errorColor: errorColor ?? this.errorColor,
    );
  }
}
