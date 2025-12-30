import 'package:flutter/material.dart';
import '../text_font_widget/text_font_widget.dart';
import 'removable_chip_styles.dart';

/// 삭제 가능한 칩 위젯
class RemovableChip extends StatelessWidget {
  final String label;
  final VoidCallback onDeleted;
  final RemovableChipStyle style;

  const RemovableChip({
    super.key,
    required this.label,
    required this.onDeleted,
    this.style = RemovableChipStyle.defaultStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      labelPadding: style.labelPadding,
      label: Text(label),
      deleteIcon: Icon(Icons.close, size: style.deleteIconSize),
      onDeleted: onDeleted,
      labelStyle: TextFontWidget.fontRegularStyle(
        color: style.labelColor,
        fontWeight: style.labelFontWeight,
      ),
      backgroundColor: style.backgroundColor,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: style.borderColor),
        borderRadius: BorderRadius.all(Radius.circular(style.borderRadius)),
      ),
      padding: style.padding,
    );
  }
}
