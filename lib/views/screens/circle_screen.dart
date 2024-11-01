import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import "package:carousel_slider/carousel_slider.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:usw_circle_link/models/application_model.dart';
import 'package:usw_circle_link/utils/dialog_manager.dart';
import 'package:usw_circle_link/viewmodels/application_view_model.dart';
import 'package:usw_circle_link/viewmodels/circle_screen_view_model.dart';
import 'package:usw_circle_link/views/widgets/text_font_widget.dart';

class CircleScreen extends ConsumerStatefulWidget {
  final int clubId;

  const CircleScreen({required this.clubId, super.key});

  @override
  ConsumerState<CircleScreen> createState() => _CircleScreenState();
}

class _CircleScreenState extends ConsumerState<CircleScreen> {
  int activeIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final clubIntroState = ref.watch(clubIntroProvider(widget.clubId));
    final applicationState = ref.watch(applicationViewModelProvider);
    ref.listen(applicationViewModelProvider, (previous, next) {
      next.when(
        data: (data) {
          switch (data?.type) {
            case ApplicationModelType.getApplication:
              break;
            case ApplicationModelType.apply:
              break;
            case ApplicationModelType.checkAvailableForApplication:
              context.go('/circle/application_writing?clubId=${widget.clubId}');
              break;
            default:
          }
        },
        error: (error, stackTrace) {
          error = error as ApplicationModelError;
          switch (error.type) {
            case ApplicationModelType.checkAvailableForApplication:
              DialogManager.instance.showAlertDialog(
                  context: context, content: '이미 지원한 동아리 또는 소속된 동아리입니다!');
              break;
            default:
          }
        },
        loading: () {},
      );
    });
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(62.h),
          child: AppBar(
            scrolledUnderElevation: 0,
            toolbarHeight: 62.h,
            centerTitle: true,
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: SizedBox(
              width: 375.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: SvgPicture.asset(
                      'assets/images/back.svg',
                      height: 36.h,
                      width: 36.w,
                    ),
                  ),
                  SizedBox(width: 78.2.w),
                  Text(
                    '동아리 소개',
                    style: TextStyle(
                      fontFamily: 'Pretendard',
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      height: 1.111.h,
                      letterSpacing: -0.45.sp,
                    ),
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: !clubIntroState.hasValue
            ? SizedBox.shrink()
            : Padding(
                padding: EdgeInsets.zero,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffFFFFFF),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  height: 116.h,
                  child: Column(
                    children: [
                      SizedBox(height: 12.h),
                      clubIntroState.value!.recruitmentStatus == "CLOSE"
                          ? CustomButton(
                              text: '모집마감', isEnabled: false, onPressed: () {})
                          : CustomButton(
                              text: '지원하기',
                              isEnabled: true,
                              onPressed: () async {
                                await ref
                                    .read(applicationViewModelProvider.notifier)
                                    .checkAvailableForApplication(
                                        clubId: widget.clubId);
                              },
                            ),
                    ],
                  ),
                ),
              ),
        body: clubIntroState.isLoading || applicationState.isLoading
            ? Center(child: CircularProgressIndicator())
            : clubIntroState.hasError
                ? Center(child: Text('동아리 정보를 불러오지 못했습니다.'))
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 250.h,
                          child: clubIntroState.value!
                                          .getNotEmptyIntroPhotoPath() !=
                                      null &&
                                  clubIntroState.value!
                                      .getNotEmptyIntroPhotoPath()!
                                      .isNotEmpty
                              ? Stack(
                                  children: [
                                    SizedBox(
                                      child: clubIntroState.value!
                                                  .getNotEmptyIntroPhotoPath() !=
                                              null
                                          ? CarouselSlider.builder(
                                              itemCount: clubIntroState.value!
                                                  .getNotEmptyIntroPhotoPath()!
                                                  .length,
                                              itemBuilder:
                                                  (context, index, realIndex) {
                                                return buildImage(
                                                    clubIntroState.value!
                                                            .getNotEmptyIntroPhotoPath()![
                                                        index],
                                                    index);
                                              },
                                              options: CarouselOptions(
                                                height: 250.h,
                                                viewportFraction: 1,
                                                onPageChanged: (index,
                                                        reason) =>
                                                    setState(() =>
                                                        activeIndex = index),
                                              ),
                                            )
                                          : Center(
                                              child: Text(
                                                '사진이 없습니다.',
                                                style: TextStyle(
                                                  fontFamily: 'Pretendard',
                                                  fontSize: 16.sp,
                                                ),
                                              ),
                                            ),
                                    ),
                                    Positioned(
                                      bottom: 16.h,
                                      right: 16.w,
                                      child: Row(
                                        children: [
                                          SizedBox(width: 10.w),
                                          Container(
                                            width: 46.w,
                                            height: 28.h,
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.black.withOpacity(0.7),
                                              borderRadius:
                                                  BorderRadius.circular(150.sp),
                                            ),
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    '${activeIndex + 1}',
                                                    style: TextStyle(
                                                      color: const Color(
                                                          0xffBFBFBF),
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontFamily: 'Pretendard',
                                                      height: 1.h,
                                                      letterSpacing: -0.3.sp,
                                                    ),
                                                  ),
                                                  Text(
                                                    ' / ${clubIntroState.value!.getNotEmptyIntroPhotoPath()!.length}',
                                                    style: TextStyle(
                                                      color: const Color(
                                                          0xffBFBFBF),
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: 'Pretendard',
                                                      height: 1.h,
                                                      letterSpacing: -0.3.sp,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              : Container(
                                  color: const Color.fromARGB(255, 36, 36, 36),
                                  child: Center(child: Text('')),
                                ),
                        ),
                        SizedBox(height: 16.h),
                        SizedBox(
                          child: Row(
                            children: [
                              SizedBox(width: 24.w),
                              SizedBox(
                                height: 100.h,
                                width: 100.w,
                                child: Image.network(
                                  clubIntroState.value!.mainPhotoPath ?? "",
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      color: const Color.fromARGB(
                                          255, 164, 164, 164),
                                      child: Center(
                                        child: Icon(
                                          Icons.person,
                                          color: const Color(0xFFFDF5EC),
                                          size: 60,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(width: 16.w),
                              SizedBox(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 10.h),
                                    Row(
                                      children: [
                                        Text(
                                          clubIntroState.value!.clubName,
                                          style: TextStyle(
                                            fontFamily: 'Pretendard',
                                            color: Colors.black,
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w600,
                                            height: 1.h,
                                            letterSpacing: -0.45.sp,
                                          ),
                                        ),
                                        SizedBox(width: 8.w),
                                        SvgPicture.asset(
                                            'assets/images/Vector10.svg'),
                                        SizedBox(width: 8.w),
                                        Text(
                                          '동아리장',
                                          style: TextStyle(
                                            fontFamily: 'Pretendard',
                                            color: const Color(0xFF767676),
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                            height: 1.h,
                                            letterSpacing: -0.35.sp,
                                          ),
                                        ),
                                        SizedBox(width: 4.w),
                                        Text(
                                          clubIntroState.value!.leaderName,
                                          style: TextStyle(
                                            fontFamily: 'Pretendard',
                                            color: const Color(0xFF353549),
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w600,
                                            height: 1.h,
                                            letterSpacing: -0.35.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20.h),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/images/phonelogo.svg',
                                          height: 16.h,
                                          width: 16.w,
                                        ),
                                        SizedBox(width: 6.w),
                                        Text(
                                          clubIntroState.value!.leaderHp,
                                          style: TextStyle(
                                            fontFamily: 'Pretendard',
                                            color: const Color(0xFF353549),
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                            height: 1.h,
                                            letterSpacing: -0.35.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 11.h),
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/Instagram_logo.png',
                                          height: 16.h,
                                          width: 16.w,
                                        ),
                                        SizedBox(width: 6.w),
                                        Text(
                                          '@${clubIntroState.value!.clubInsta}',
                                          style: TextStyle(
                                            fontFamily: 'Pretendard',
                                            color: const Color(0xFF353549),
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                            height: 1.h,
                                            letterSpacing: -0.35.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          child: Divider(
                            thickness: 0.5.h,
                          ),
                        ),
                        SizedBox(height: 24.h),
                        Row(
                          children: [
                            SizedBox(width: 24.w),
                            Text(
                              '동아리 소개',
                              style: TextStyle(
                                fontFamily: 'Pretendard',
                                color: const Color(0xFF353549),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                height: 1.h,
                                letterSpacing: -0.8.sp,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.h),
                        Container(
                          alignment: Alignment.topLeft,
                          height: 154.h,
                          padding: EdgeInsets.fromLTRB(24.sp, 0, 24.sp, 0),
                          child: Text(
                            clubIntroState.value!.introContent,
                            style: TextStyle(
                              fontFamily: 'Pretendard',
                              color: const Color(0xFF111111),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              height: 1.h,
                              letterSpacing: -0.35.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
      ),
    );
  }

  Widget buildImage(String imageUrl, int index) => Container(
        color: Colors.grey,
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Center(
                child: TextFontWidget.fontRegular(
                    text: '이미지 준비중 ...',
                    fontSize: 14.sp,
                    color: Colors.white,
                    fontweight: FontWeight.w600));
          },
        ),
      );
}

class CustomButton extends StatefulWidget {
  final String text;
  final bool isEnabled;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.isEnabled,
    required this.onPressed,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: 327,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: widget.isEnabled ? const Color(0xffffB052) : Colors.grey,
      ),
      child: TextButton(
        onPressed: widget.isEnabled ? widget.onPressed : null,
        child: Text(
          widget.text,
          style: TextStyle(
            color: const Color(0xffffffff),
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontFamily: 'Pretendard',
            height: 1.111,
          ),
        ),
      ),
    );
  }
}
