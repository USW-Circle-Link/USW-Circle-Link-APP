import 'package:flutter/material.dart';
import '../../models/category_model.dart';
import '../badge/removable_badge.dart';

/// 선택된 카테고리 칩 리스트 컴포넌트
///
/// 선택된 카테고리를 가로 스크롤 가능한 배지 목록으로 표시합니다.
///
/// ```diagram
/// +----------------------------------------------------------+
/// | [#체육 X] [#음악 X] [#학술 X]  ← 가로 스크롤              |
/// +----------------------------------------------------------+
/// ```
class SelectedCategoryChipList extends StatelessWidget {
  final List<CategoryData> selectedCategories;
  final Function(CategoryData) onChipDeleted;

  const SelectedCategoryChipList({
    super.key,
    required this.selectedCategories,
    required this.onChipDeleted,
  });

  @override
  Widget build(BuildContext context) {
    if (selectedCategories.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(left: 24),
      height: 60,
      alignment: Alignment.centerLeft,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Wrap(
          spacing: 10,
          children: selectedCategories.map((category) {
            return RemovableBadge(
              label: category.clubCategoryName,
              onRemove: () => onChipDeleted(category),
            );
          }).toList(),
        ),
      ),
    );
  }
}
