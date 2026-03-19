import 'package:flutter/material.dart';
import 'package:usw_circle_link/const/app_theme.dart';
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
    final theme = Theme.of(context);
    final appColors = theme.extension<AppColors>()!;
    final isDark = theme.brightness == Brightness.dark;

    // 다크모드: copyWith(height: 32) 등으로 defaultStyle이 아니어도 테마 색 강제 적용
    final Color unselectedBg;
    final Color unselectedFg;
    final Color unselectedBorderColor;
    if (isDark) {
      unselectedBg = theme.dividerColor; // 어두운 회색 배경으로 버튼 영역 구분
      unselectedFg = theme.colorScheme.onSurface; // 밝은 텍스트/아이콘
      unselectedBorderColor = appColors.borderColor;
    } else {
      unselectedBg = theme.cardColor;
      unselectedFg = appColors.secondaryText;
      unselectedBorderColor = appColors.borderColor;
    }

    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: _hasSelection
            ? style.selectedBackgroundColor
            : unselectedBg,
        foregroundColor: _hasSelection
            ? style.selectedForegroundColor
            : unselectedFg,
        minimumSize: Size.zero,
        fixedSize: Size.fromHeight(style.height),
        padding: style.padding,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        side: BorderSide(
          color: _hasSelection
              ? style.selectedBorderColor
              : unselectedBorderColor,
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
                : unselectedFg,
          ),
          SizedBox(width: style.spacing),
          TextFontWidget.fontRegular(
            '필터',
            fontWeight: style.fontWeight,
            color: _hasSelection
                ? style.selectedForegroundColor
                : unselectedFg,
          ),
        ],
      ),
    );
  }
}
