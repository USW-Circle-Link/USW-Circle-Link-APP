import 'package:flutter/material.dart';
import '../text_font_widget/text_font_widget.dart';
import 'tile_styles.dart';

/// 타일 컨테이너를 빌드하는 유틸리티 함수
///
/// [style]에 따라 배경색, 테두리, 모서리 둥글기를 적용합니다.
Widget buildTileContainer({
  required Widget child,
  required TileStyle style,
}) {
  if (style.borderRadius == 0 && style.borderColor == null) {
    return Container(
      color: style.backgroundColor,
      child: child,
    );
  }

  return Container(
    decoration: BoxDecoration(
      color: style.backgroundColor,
      borderRadius: BorderRadius.circular(style.borderRadius),
      border: style.borderColor != null
          ? Border.all(color: style.borderColor!, width: style.borderWidth)
          : null,
    ),
    child: child,
  );
}

/// 범용 타일 레이아웃 컴포넌트
///
/// 드로어 메뉴, 리스트 아이템 등에서 사용할 수 있는 범용 레이아웃입니다.
///
/// LTR locale 기준:
/// ```diagram
/// -----------------------------------------------------
/// | [prefix] [title]           [details] [suffix]     |
/// |          [subtitle]                               |
/// -----------------------------------------------------
/// ```
///
/// 사용 예시:
/// ```dart
/// Tile(
///   prefix: Icon(Icons.person),
///   title: Text('내 정보'),
///   suffix: Icon(Icons.chevron_right),
///   onTap: () => navigateToProfile(),
/// )
/// ```
class Tile extends StatelessWidget {
  /// 왼쪽에 표시되는 위젯 (아이콘 등)
  final Widget? prefix;

  /// 메인 타이틀 (필수)
  final Widget title;

  /// 타이틀 아래에 표시되는 서브타이틀
  final Widget? subtitle;

  /// 우측에 표시되는 세부 정보
  final Widget? details;

  /// 가장 우측에 표시되는 위젯 (화살표 아이콘 등)
  final Widget? suffix;

  /// 탭 이벤트 콜백
  final VoidCallback? onTap;

  /// 롱 프레스 이벤트 콜백
  final VoidCallback? onLongPress;

  /// 활성화 상태
  final bool enabled;

  /// 스타일
  final TileStyle style;

  const Tile({
    super.key,
    required this.title,
    this.prefix,
    this.subtitle,
    this.details,
    this.suffix,
    this.onTap,
    this.onLongPress,
    this.enabled = true,
    this.style = TileStyle.defaultStyle,
  });

  /// Raw 버전 생성자 - 커스텀 콘텐츠 레이아웃
  ///
  /// ```diagram
  /// ----------------------------------------
  /// | [prefix] [child]                     |
  /// ----------------------------------------
  /// ```
  ///
  /// [RawTile] 위젯을 사용하세요.
  /// ```dart
  /// RawTile(
  ///   prefix: Icon(Icons.person),
  ///   child: Text('커스텀 콘텐츠'),
  /// )
  /// ```

  @override
  Widget build(BuildContext context) {
    final content = Opacity(
      opacity: enabled ? 1.0 : style.disabledOpacity,
      child: Padding(
        padding: style.padding,
        child: Row(
          children: [
            if (prefix != null) ...[
              IconTheme(
                data: IconThemeData(
                  size: style.iconSize,
                  color: style.iconColor,
                ),
                child: prefix!,
              ),
              SizedBox(width: style.prefixSpacing),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  DefaultTextStyle(
                    style: TextFontWidget.fontRegularStyle(
                      fontSize: style.titleFontSize,
                      fontWeight: style.titleFontWeight,
                      color: style.titleColor,
                    ),
                    child: title,
                  ),
                  if (subtitle != null) ...[
                    SizedBox(height: style.titleSubtitleSpacing),
                    DefaultTextStyle(
                      style: TextFontWidget.fontRegularStyle(
                        fontSize: style.subtitleFontSize,
                        fontWeight: style.subtitleFontWeight,
                        color: style.subtitleColor,
                      ),
                      child: subtitle!,
                    ),
                  ],
                ],
              ),
            ),
            if (details != null) ...[
              SizedBox(width: style.suffixSpacing),
              DefaultTextStyle(
                style: TextFontWidget.fontRegularStyle(
                  fontSize: style.detailsFontSize,
                  color: style.detailsColor,
                ),
                child: details!,
              ),
            ],
            if (suffix != null) ...[
              SizedBox(width: style.suffixSpacing),
              IconTheme(
                data: IconThemeData(
                  size: style.iconSize,
                  color: style.iconColor,
                ),
                child: suffix!,
              ),
            ],
          ],
        ),
      ),
    );

    if (onTap == null && onLongPress == null) {
      return buildTileContainer(child: content, style: style);
    }

    return buildTileContainer(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: enabled ? onTap : null,
          onLongPress: enabled ? onLongPress : null,
          borderRadius: BorderRadius.circular(style.borderRadius),
          child: content,
        ),
      ),
      style: style,
    );
  }
}

/// Raw 타일 - 커스텀 레이아웃을 위한 컴포넌트
///
/// ```diagram
/// ----------------------------------------
/// | [prefix] [child]                     |
/// ----------------------------------------
/// ```
class RawTile extends StatelessWidget {
  final Widget child;
  final Widget? prefix;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final bool enabled;
  final TileStyle style;

  const RawTile({
    super.key,
    required this.child,
    this.prefix,
    this.onTap,
    this.onLongPress,
    this.enabled = true,
    this.style = TileStyle.defaultStyle,
  });

  @override
  Widget build(BuildContext context) {
    final content = Opacity(
      opacity: enabled ? 1.0 : style.disabledOpacity,
      child: Padding(
        padding: style.padding,
        child: Row(
          children: [
            if (prefix != null) ...[
              IconTheme(
                data: IconThemeData(
                  size: style.iconSize,
                  color: style.iconColor,
                ),
                child: prefix!,
              ),
              SizedBox(width: style.prefixSpacing),
            ],
            Expanded(child: child),
          ],
        ),
      ),
    );

    if (onTap == null && onLongPress == null) {
      return buildTileContainer(child: content, style: style);
    }

    return buildTileContainer(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: enabled ? onTap : null,
          onLongPress: enabled ? onLongPress : null,
          borderRadius: BorderRadius.circular(style.borderRadius),
          child: content,
        ),
      ),
      style: style,
    );
  }
}
