import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:usw_circle_link/viewmodels/category_view_model.dart';
import 'package:usw_circle_link/views/widgets/text_font_widget.dart';

class CategoryPicker extends ConsumerStatefulWidget {
  const CategoryPicker({
    super.key,
    this.initialGroups = const [],
  });

  final List<String> initialGroups;

  @override
  _GroupPickerState createState() => _GroupPickerState();
}

class _GroupPickerState extends ConsumerState<CategoryPicker> {
  late Set<String> selectedGroups;

  @override
  void initState() {
    selectedGroups = widget.initialGroups.toSet();
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
          context.pop(selectedGroups.toList());
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
                      context.pop(selectedGroups.toList());
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
                  SvgPicture.asset('assets/images/ic_category.svg'),
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
              state.when(
                data: (data) => Wrap(
                  spacing: 5.w,
                  children: data?.data.map((category) {
                        return _buildChip(category.clubCategory);
                      }).toList() ??
                      [],
                ),
                error: (error, stackTrace) => Text(error.toString()),
                loading: () => const Center(child: CircularProgressIndicator()),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChip(String label) {
    final isSelected = selectedGroups.contains(label);
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (value) {
        if (selectedGroups.length == 3) {
          return;
        }
        setState(() {
          value ? selectedGroups.add(label) : selectedGroups.remove(label);
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
