import 'package:flutter/material.dart';

/// PolicyDialog 위젯의 스타일을 정의하는 클래스
class PolicyDialogStyle {
  /// 전체 패딩
  final EdgeInsetsGeometry padding;

  const PolicyDialogStyle({
    this.padding = const EdgeInsets.all(16.0),
  });

  static const PolicyDialogStyle defaultStyle = PolicyDialogStyle();

  PolicyDialogStyle copyWith({
    EdgeInsetsGeometry? padding,
  }) {
    return PolicyDialogStyle(
      padding: padding ?? this.padding,
    );
  }
}
