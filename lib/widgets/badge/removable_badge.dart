import 'package:flutter/material.dart';
import '../text_font_widget/text_font_widget.dart';
import 'removable_badge_styles.dart';

/// 삭제 가능한 배지 컴포넌트
///
/// 필터링에 사용되는 배지로, X 버튼을 눌러 삭제할 수 있습니다.
///
/// ```
/// 필터 배지:
/// +-------------+
/// | #체육   [X] |  (오렌지 테두리)
/// +-------------+
/// ```
///
/// 사용 예시:
/// ```dart
/// RemovableBadge(
///   label: '#체육',
///   onRemove: () => handleRemove(),
/// )
/// ```
class RemovableBadge extends StatelessWidget {
  /// 배지에 표시될 라벨
  final String label;

  /// 삭제 버튼 클릭 시 호출되는 콜백
  final VoidCallback onRemove;

  /// 배지 스타일
  final RemovableBadgeStyle style;

  const RemovableBadge({
    super.key,
    required this.label,
    required this.onRemove,
    this.style = RemovableBadgeStyle.defaultStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      labelPadding: style.labelPadding,
      label: Text(label),
      deleteIcon: Icon(
        Icons.close,
        size: style.deleteIconSize,
        color: style.deleteIconColor,
      ),
      onDeleted: onRemove,
      labelStyle: TextFontWidget.fontRegularStyle(
        color: style.labelColor,
        fontSize: style.labelFontSize,
        fontWeight: style.labelFontWeight,
      ),
      backgroundColor: style.backgroundColor,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: style.borderColor,
          width: style.borderWidth,
        ),
        borderRadius: BorderRadius.all(Radius.circular(style.borderRadius)),
      ),
      padding: style.padding,
    );
  }
}
