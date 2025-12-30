import 'package:flutter/material.dart' hide Badge;
import '../text_font_widget/text_font_widget.dart';
import 'badge_styles.dart';

/// 배지 상태 정의
///
/// 지원 상태를 나타내는 배지에 사용됩니다.
/// ```
/// +--------+
/// |  합격  |  (파란 배경)
/// +--------+
/// ```
enum BadgeStatus {
  wait('WAIT', Color(0xffBFBFBF), '대기 중'),
  pass('PASS', Color(0xff8282FF), '합격'),
  fail('FAIL', Color(0xffFF8282), '불합격');

  final String code;
  final Color color;
  final String text;

  const BadgeStatus(this.code, this.color, this.text);

  /// 코드로 상태 찾기
  factory BadgeStatus.fromCode(String? code) {
    if (code == null) {
      throw ArgumentError('BadgeStatus code cannot be null');
    }
    return BadgeStatus.values.firstWhere(
      (status) => status.code == code,
      orElse: () => throw ArgumentError('Invalid BadgeStatus code: $code'),
    );
  }

  /// 코드로 상태 찾기 (없으면 null 반환)
  static BadgeStatus? tryFromCode(String? code) {
    if (code == null) return null;
    try {
      return BadgeStatus.values.firstWhere(
        (status) => status.code == code,
      );
    } catch (_) {
      return null;
    }
  }
}

/// 상태 표시용 배지 컴포넌트
///
/// ```
/// 상태 배지:
/// +--------+
/// |  WAIT  |  (회색 배경, 흰 텍스트)
/// +--------+
/// ```
///
/// 사용 예시:
/// ```dart
/// // 직접 라벨 지정
/// Badge(label: '합격')
///
/// // 상태로 생성
/// Badge.status(status: BadgeStatus.pass)
/// ```
class Badge extends StatelessWidget {
  final String label;
  final BadgeStyle style;

  const Badge({
    super.key,
    required this.label,
    this.style = BadgeStyle.defaultStyle,
  });

  /// 상태 기반 팩토리 생성자
  factory Badge.status({
    Key? key,
    required BadgeStatus status,
    BadgeStyle? style,
  }) {
    final statusStyle = switch (status) {
      BadgeStatus.wait => BadgeStyle.waitStyle,
      BadgeStatus.pass => BadgeStyle.passStyle,
      BadgeStatus.fail => BadgeStyle.failStyle,
    };

    return Badge(
      key: key,
      label: status.text,
      style: style ?? statusStyle,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: style.padding,
      decoration: BoxDecoration(
        color: style.backgroundColor,
        borderRadius: BorderRadius.circular(style.borderRadius),
      ),
      child: TextFontWidget.fontRegular(
        label,
        color: style.textColor,
        fontSize: style.fontSize,
        fontWeight: style.fontWeight,
        height: 1,
        letterSpacing: style.letterSpacing,
      ),
    );
  }
}
