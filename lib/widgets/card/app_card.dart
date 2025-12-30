import 'package:flutter/material.dart';
import 'app_card_styles.dart';

/// 범용 카드 컨테이너 컴포넌트
///
/// 콘텐츠를 감싸는 카드 형태의 컨테이너입니다.
///
/// ```diagram
/// +---------------------------------------------------+
/// |              [child content]                      |
/// +---------------------------------------------------+
/// ```
///
/// 사용 예시:
/// ```dart
/// AppCard(
///   child: Tile(
///     prefix: Icon(Icons.person),
///     title: Text('내 정보'),
///   ),
///   onTap: () => navigateToProfile(),
/// )
/// ```
class AppCard extends StatelessWidget {
  /// 카드 내부에 표시될 콘텐츠
  final Widget child;

  /// 탭 이벤트 콜백
  final VoidCallback? onTap;

  /// 롱 프레스 이벤트 콜백
  final VoidCallback? onLongPress;

  /// 스타일
  final AppCardStyle style;

  const AppCard({
    super.key,
    required this.child,
    this.onTap,
    this.onLongPress,
    this.style = AppCardStyle.defaultStyle,
  });

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      color: style.backgroundColor,
      borderRadius: BorderRadius.circular(style.borderRadius),
      border: style.borderColor != null
          ? Border.all(color: style.borderColor!, width: style.borderWidth)
          : null,
      boxShadow: style.shadowColor != null
          ? [
              BoxShadow(
                color: style.shadowColor!,
                blurRadius: style.shadowBlur,
                offset: style.shadowOffset,
                spreadRadius: style.shadowSpread,
              ),
            ]
          : null,
    );

    Widget content = Container(
      margin: style.margin,
      padding: style.padding,
      decoration: decoration,
      child: child,
    );

    if (onTap != null || onLongPress != null) {
      content = Container(
        margin: style.margin,
        decoration: decoration,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            onLongPress: onLongPress,
            borderRadius: BorderRadius.circular(style.borderRadius),
            child: Padding(
              padding: style.padding,
              child: child,
            ),
          ),
        ),
      );
    }

    return content;
  }
}
