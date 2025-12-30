import 'package:flutter/material.dart';
import '../text_font_widget/text_font_widget.dart';
import 'filter_tab_bar_styles.dart';

/// 전체/모집 중 필터 탭 바 위젯
class FilterTabBar extends StatelessWidget {
  final bool isAllSelected;
  final VoidCallback onAllSelected;
  final VoidCallback onRecruitingSelected;
  final FilterTabBarStyle style;

  const FilterTabBar({
    super.key,
    required this.isAllSelected,
    required this.onAllSelected,
    required this.onRecruitingSelected,
    this.style = FilterTabBarStyle.defaultStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildTabButton(
          label: '전체',
          isSelected: isAllSelected,
          onPressed: onAllSelected,
        ),
        _buildTabButton(
          label: '모집 중',
          isSelected: !isAllSelected,
          onPressed: onRecruitingSelected,
        ),
      ],
    );
  }

  Widget _buildTabButton({
    required String label,
    required bool isSelected,
    required VoidCallback onPressed,
  }) {
    return DecoratedBox(
      decoration: isSelected
          ? BoxDecoration(
              border: Border(bottom: BorderSide(color: style.selectedBorderColor)),
            )
          : const BoxDecoration(),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: style.foregroundColor,
          padding: style.padding,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        ),
        child: TextFontWidget.fontRegular(
          label,
          fontSize: style.fontSize,
          color: isSelected ? style.selectedTextColor : style.unselectedTextColor,
          fontWeight: style.fontWeight,
        ),
      ),
    );
  }
}
