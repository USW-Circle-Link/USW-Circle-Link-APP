import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:usw_circle_link/const/data.dart';
import 'package:usw_circle_link/models/category_model.dart';
import 'package:usw_circle_link/utils/icons/main_icons_icons.dart';
import 'package:usw_circle_link/viewmodels/category_view_model.dart';
import 'package:usw_circle_link/views/widgets/text_font_widget.dart';

class CategoryPicker extends ConsumerStatefulWidget {
  const CategoryPicker({
    super.key,
    this.initialCategories = const [],
  });

  final List<CategoryData> initialCategories;

  @override
  _CategoryPickerState createState() => _CategoryPickerState();
}

class _CategoryPickerState extends ConsumerState<CategoryPicker> {
  late Set<CategoryData> selectedCategories;

  @override
  void initState() {
    selectedCategories = widget.initialCategories.toSet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(categoryViewModelProvider);
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          // dissmiss 나 뒤로가기
          context.pop(selectedCategories.toList());
        }
      },
      child: Container(
        height: MediaQuery.of(context).size.height - kToolbarHeight - 50.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(17.r),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            right: 48.w,
            left: 48.w,
            top: 48.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(width: 20.w),
                  TextFontWidget.fontRegular(
                    '나에게 맞는 동아리 추천 받기',
                    color: Color(0xFF989898),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  IconButton(
                    onPressed: () {
                      context.pop(selectedCategories.toList());
                    },
                    style: IconButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    icon: SvgPicture.asset(
                      'assets/images/ic_close.svg',
                    ),
                  ),
                ],
              ),
              Divider(
                height: 70.h,
                indent: 70.w,
                endIndent: 70.w,
              ),
              Row(
                children: <Widget>[
                  Icon(
                    MainIcons.ic_category,
                    color: Color(0xFF111111),
                    size: 15.sp,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  TextFontWidget.fontRegular(
                    '관심 카테고리',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  )
                ],
              ),
              TextFontWidget.fontRegular(
                '* 최대 3개까지 선택해주세요.',
                color: Color(0xff909090),
                fontSize: 12.sp,
                fontWeight: FontWeight.w300,
              ),
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                child: state.when(
                  data: (data) => SingleChildScrollView(
                    child: Wrap(
                      spacing: 5.w,
                      children: data?.data.map((category) {
                            return _buildChip(category);
                          }).toList() ??
                          [],
                    ),
                  ),
                  error: (error, stackTrace) => Container(
                    alignment: Alignment.center,
                    child: TextFontWidget.fontRegular(
                      '카테고리를 불러오지 못했어요.\n잠시 후 다시 시도해주세요.',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w300,
                      textAlign: TextAlign.center,
                      color: Color(0xFFA1A1A1),
                    ),
                  ),
                  loading: () => const Center(
                      child: CircularProgressIndicator(
                    color: accentColor,
                  )),
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
    return FilterChip(
      label: Text(category.clubCategoryName),
      selected: isSelected,
      onSelected: (value) {
        if (selectedCategories.length == 3 && !isSelected) {
          return;
        }
        setState(() {
          value
              ? selectedCategories.add(category)
              : selectedCategories.remove(category);
        });
      },
      showCheckmark: false,
      selectedColor: Color(0xFFFFB052),
      labelStyle: TextFontWidget.fontRegularStyle(
        color: isSelected ? Colors.white : Color(0xFF434343),
        fontWeight: FontWeight.w300,
      ),
      backgroundColor: Colors.white,
      elevation: null,
      shape: RoundedRectangleBorder(
        side: BorderSide(
            color: isSelected ? Color(0xFFFF9A21) : Color(0xFFE5E5E5)),
        borderRadius: BorderRadius.all(Radius.circular(15.r)),
      ),
      padding: EdgeInsets.all(0),
    );
  }
}
