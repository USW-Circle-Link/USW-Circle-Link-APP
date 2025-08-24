import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:usw_circle_link/models/circle_list_model.dart';
import 'package:usw_circle_link/viewmodels/select_circle_view_model.dart';
import 'package:usw_circle_link/views/widgets/text_font_widget.dart';
import 'package:usw_circle_link/utils/extensions.dart';

class SelectCircleScreen extends ConsumerStatefulWidget {
  const SelectCircleScreen({Key? key}) : super(key: key);

  @override
  _SelectCircleScreenState createState() => _SelectCircleScreenState();
}

class _SelectCircleScreenState extends ConsumerState<SelectCircleScreen> {
  final List<CircleListData> selectedCircles = [];

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(selectCircleViewModelProvider);

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,
          titleSpacing: 0.0,
          title: Padding(
            padding: EdgeInsets.only(left: 22.w, right: 22.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 52.w,
                  height: 52.h,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: SvgPicture.asset(
                      'assets/images/ic_back_arrow.svg',
                    ),
                  ),
                ),
                TextFontWidget.fontRegular(
                  '기존 동아리 회원 가입',
                  fontSize: 18.sp,
                  color: Color(0xFF111111),
                  fontWeight: FontWeight.w800,
                ),
                SizedBox(width: 52.w, height: 52.h)
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: state.when(
            data: (data) {
              final circles = data?.data.getSortedListWithValidImage() ?? [];
              return Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 32.w, vertical: 10.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextFontWidget.fontRegular(
                              textAlign: TextAlign.center,
                              '현재 소속되어 있는 동아리를\n모두 선택해 주세요.',
                              fontSize: 16.sp,
                              color: Color(0xFFA1A1A1),
                              fontWeight: FontWeight.w400,
                            ),
                            SizedBox(height: 20.h),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.w),
                              child: GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 20.w,
                                  mainAxisSpacing: 10.h,
                                  childAspectRatio: 0.69,
                                ),
                                itemCount: circles.length,
                                itemBuilder: (context, index) {
                                  final circle = circles[index];
                                  final isSelected =
                                      selectedCircles.contains(circle);

                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (isSelected) {
                                          selectedCircles.remove(circle);
                                        } else {
                                          selectedCircles.add(circle);
                                        }
                                      });
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: LayoutBuilder(
                                              builder: (context, constraints) {
                                            final borderRadius =
                                                BorderRadius.circular(8.r);
                                            return Stack(
                                              children: [
                                                Container(
                                                  alignment: Alignment.center,
                                                  constraints: BoxConstraints(
                                                    minHeight:
                                                        constraints.maxHeight,
                                                    maxHeight:
                                                        constraints.maxHeight,
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius: borderRadius,
                                                    child: circle.mainPhoto
                                                                ?.isValidUrl ??
                                                            false
                                                        ? Image.network(
                                                            circle.mainPhoto!,
                                                            fit: BoxFit.cover,
                                                            errorBuilder:
                                                                (BuildContext
                                                                        context,
                                                                    Object
                                                                        exception,
                                                                    StackTrace?
                                                                        stackTrace) {
                                                              return Container(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/circle_default_image.png',
                                                                ),
                                                              );
                                                            },
                                                          )
                                                        : Center(
                                                            child: Image.asset(
                                                              'assets/images/circle_default_image.png',
                                                            ),
                                                          ),
                                                  ),
                                                ),
                                                Container(
                                                  constraints: BoxConstraints(
                                                    minHeight:
                                                        constraints.maxHeight,
                                                    maxHeight:
                                                        constraints.maxHeight,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: isSelected
                                                        ? const Color(
                                                                0xffffB052)
                                                            .withOpacity(0.2)
                                                        : Colors.transparent,
                                                    border: Border.all(
                                                      color: isSelected
                                                          ? const Color(
                                                              0xffffB052)
                                                          : Color(0xFFB8B8B8),
                                                    ),
                                                    borderRadius: borderRadius,
                                                  ),
                                                ),
                                              ],
                                            );
                                          }),
                                        ),
                                        SizedBox(height: 8.h),
                                        TextFontWidget.fontRegular(
                                          circle.clubName,
                                          fontSize: 16.sp,
                                          color: isSelected
                                              ? const Color(0xffffB052)
                                              : Colors.black,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    margin: EdgeInsets.only(bottom: 10.h),
                    child: SizedBox(
                      width: double.infinity,
                      height: 56.h,
                      child: OutlinedButton(
                        onPressed: selectedCircles.isEmpty
                            ? null
                            : () {
                                context.push(
                                  '/login/sign_up_option/policy_agree/select_circle/sign_up',
                                  extra: selectedCircles,
                                );
                              },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: selectedCircles.isEmpty
                              ? Colors.grey
                              : const Color(0xffffB052),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          side: BorderSide.none,
                        ),
                        child: TextFontWidget.fontRegular(
                          '다음',
                          fontSize: 18.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
            error: (error, stackTrace) => Center(
                child: TextFontWidget.fontRegular(
              '동아리 목록을 불러오지 못했어요.\n잠시 후 다시 시도해주세요.',
              textAlign: TextAlign.center,
              fontSize: 14.sp,
              color: Color(0xFFA1A1A1),
              fontWeight: FontWeight.w400,
            )),
            loading: () => Center(child: CircularProgressIndicator()),
          ),
        ),
      ),
    );
  }
}

extension on List<CircleListData> {
  List<CircleListData> getSortedListWithValidImage() {
    final validImageList = where((element) =>
        element.mainPhoto != null && element.mainPhoto!.isValidUrl).toList();
    final invalidImageList = where((element) =>
        element.mainPhoto == null || !element.mainPhoto!.isValidUrl).toList();
    return [...validImageList, ...invalidImageList];
  }
}
