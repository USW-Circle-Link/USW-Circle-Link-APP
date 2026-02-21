import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:usw_circle_link/const/app_theme.dart';
import 'package:usw_circle_link/models/category_model.dart';
import 'package:usw_circle_link/utils/icons/main_icons_icons.dart';
import 'package:usw_circle_link/viewmodels/category_view_model.dart';
import 'package:usw_circle_link/widgets/text_font_widget/text_font_widget.dart';

class CategoryPicker extends ConsumerStatefulWidget {
  const CategoryPicker({
    super.key,
    this.initialCategories = const [],
    this.onSelectionChanged,
  });
  final List<CategoryData> initialCategories;
  final ValueChanged<List<CategoryData>>? onSelectionChanged;

  @override
  _CategoryPickerState createState() => _CategoryPickerState();
}

class _CategoryPickerState extends ConsumerState<CategoryPicker> {
  late Set<CategoryData> selectedCategories;

  @override
  void initState() {
    super.initState();
    selectedCategories = widget.initialCategories.toSet();
  }

  void _updateSelection(CategoryData category, bool isSelected) {
    setState(() {
      if (isSelected) {
        if (selectedCategories.length < 3) {
          selectedCategories.add(category);
        }
      } else {
        selectedCategories.remove(category);
      }
    });
    widget.onSelectionChanged?.call(selectedCategories.toList());
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(categoryViewModelProvider);
    final theme = Theme.of(context);
    final appColors = theme.extension<AppColors>()!;

    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, selectedCategories.toList());
        return false;
      },
      child: Container(
        height: MediaQuery.of(context).size.height - kToolbarHeight - 50,
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(17),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            right: 48,
            left: 48,
            top: 48,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(width: 20),
                  TextFontWidget.fontRegular(
                    '나에게 맞는 동아리 추천 받기',
                    color: appColors.hintColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context, selectedCategories.toList());
                    },
                    style: IconButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    icon: SvgPicture.asset(
                      'assets/images/ic_close.svg',
                      colorFilter: ColorFilter.mode(
                        theme.iconTheme.color!,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                height: 70,
                indent: 70,
                endIndent: 70,
                color: theme.dividerColor,
              ), // 카테고리 제목
              Row(
                children: <Widget>[
                  Icon(
                    MainIcons.ic_category,
                    color: theme.iconTheme.color,
                    size: 15,
                  ),
                  SizedBox(width: 10),
                  TextFontWidget.fontRegular(
                    '관심 카테고리',
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: theme.textTheme.bodyLarge!.color,
                  )
                ],
              ),
              TextFontWidget.fontRegular(
                '* 최대 3개까지 선택해주세요.',
                color: appColors.subTextColor,
                fontSize: 12,
                fontWeight: FontWeight.w300,
              ),
              SizedBox(height: 20),
              // 카테고리 선택 리스트
              Expanded(
                child: state.when(
                  data: (data) => SingleChildScrollView(
                    child: Wrap(
                      spacing: 5,
                      children: data?.data
                              .map((category) => _buildChip(category))
                              .toList() ??
                          [],
                    ),
                  ),
                  error: (error, stackTrace) => Container(
                    alignment: Alignment.center,
                    child: TextFontWidget.fontRegular(
                      '카테고리를 불러오지 못했어요.\n잠시 후 다시 시도해주세요.',
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      textAlign: TextAlign.center,
                      color: appColors.disabledText,
                    ),
                  ),
                  loading: () => Center(
                    child: CircularProgressIndicator(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChip(CategoryData category) {
    final isSelected = selectedCategories.contains(category);
    final theme = Theme.of(context);
    final appColors = theme.extension<AppColors>()!;

    return FilterChip(
      label: Text(category.clubCategoryName),
      selected: isSelected,
      onSelected: (value) {
        _updateSelection(category, value);
      },
      showCheckmark: false,
      selectedColor: theme.colorScheme.primary,
      labelStyle: TextFontWidget.fontRegularStyle(
        color: isSelected ? Colors.white : theme.textTheme.bodyMedium!.color,
        fontWeight: FontWeight.w300,
      ),
      backgroundColor: theme.cardColor,
      elevation: null,
      shape: RoundedRectangleBorder(
        side: BorderSide(
            color: isSelected
                ? Color(0xFFFF9A21)
                : appColors.borderColor),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      padding: EdgeInsets.all(0),
    );
  }
}
