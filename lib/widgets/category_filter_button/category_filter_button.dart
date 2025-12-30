import 'package:flutter/material.dart';
import '../../models/category_model.dart';
import '../../../utils/icons/main_icons_icons.dart';
import '../text_font_widget/text_font_widget.dart';
import 'category_filter_button_styles.dart';

/// 카테고리 필터 버튼 위젯
class CategoryFilterButton extends StatelessWidget {
  final List<CategoryData> selectedCategories;
  final VoidCallback onPressed;
  final CategoryFilterButtonStyle style;

  const CategoryFilterButton({
    super.key,
    required this.selectedCategories,
    required this.onPressed,
    this.style = CategoryFilterButtonStyle.defaultStyle,
  });

  bool get _hasSelection => selectedCategories.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: _hasSelection
            ? style.selectedBackgroundColor
            : style.unselectedBackgroundColor,
        foregroundColor: _hasSelection
            ? style.selectedForegroundColor
            : style.unselectedForegroundColor,
        minimumSize: Size.zero,
        fixedSize: Size.fromHeight(style.height),
        padding: style.padding,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        side: BorderSide(
          color: _hasSelection
              ? style.selectedBorderColor
              : style.unselectedBorderColor,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(style.borderRadius)),
        ),
      ),
      child: Row(
        children: [
          Icon(
            MainIcons.ic_filter,
            size: style.iconSize,
            color: _hasSelection
                ? style.selectedForegroundColor
                : style.unselectedBorderColor,
          ),
          SizedBox(width: style.spacing),
          TextFontWidget.fontRegular(
            '필터',
            fontWeight: style.fontWeight,
            color: _hasSelection
                ? style.selectedForegroundColor
                : style.unselectedBorderColor,
          ),
        ],
      ),
    );
  }
}
