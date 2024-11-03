import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import "package:carousel_slider/carousel_slider.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:usw_circle_link/models/application_model.dart';
import 'package:usw_circle_link/utils/dialog_manager.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';
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
      logger.d(next);
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
              switch (error.code) {
                case "USR-F401":
                  DialogManager.instance.showAlertDialog(
                      context: context,
                      content: '로그인 후 이용해 주시기 바랍니다!',
                      onLeftButtonPressed: () => context.go('/login'));
                  break;
                default:
                  DialogManager.instance.showAlertDialog(
                      context: context, content: '이미 지원한 동아리 또는 소속된 동아리입니다!');
              }
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
                  TextFontWidget.fontRegular(
                    '동아리 소개',
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w800,
                    height: 1.111.h,
                    letterSpacing: -0.45.sp,
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
                ? Center(
                    child: TextFontWidget.fontRegular(
                      '동아리 정보를 불러오지 못했습니다.',
                    ),
                  )
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
                                              child: TextFontWidget.fontRegular(
                                                '사진이 없습니다.',
                                                fontSize: 16.sp,
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
                                                  TextFontWidget.fontRegular(
                                                    '${activeIndex + 1}',
                                                    color:
                                                        const Color(0xffBFBFBF),
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w700,
                                                    height: 1.h,
                                                    letterSpacing: -0.3.sp,
                                                  ),
                                                  TextFontWidget.fontRegular(
                                                    ' / ${clubIntroState.value!.getNotEmptyIntroPhotoPath()!.length}',
                                                    color:
                                                        const Color(0xffBFBFBF),
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w500,
                                                    height: 1.h,
                                                    letterSpacing: -0.3.sp,
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
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
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
                                        SizedBox(
                                          width: 200.w,
                                          child: TextFontWidget.fontRegular(
                                            clubIntroState.value!.clubName,
                                            overflow: TextOverflow.ellipsis,
                                            color: Colors.black,
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w900,
                                            height: 1.h,
                                            letterSpacing: -0.45.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5.h),
                                    Row(
                                      children: [
                                        TextFontWidget.fontRegular(
                                          '동아리장',
                                          color: const Color(0xFF767676),
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          height: 1.h,
                                          letterSpacing: -0.35.sp,
                                        ),
                                        SizedBox(width: 4.w),
                                        SizedBox(
                                          width: 140.w,
                                          child: TextFontWidget.fontRegular(
                                            clubIntroState.value!.leaderName,
                                            overflow: TextOverflow.ellipsis,
                                            color: const Color(0xFF353549),
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w800,
                                            height: 1.h,
                                            letterSpacing: -0.35.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10.h),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/images/phonelogo.svg',
                                          height: 16.h,
                                          width: 16.w,
                                        ),
                                        SizedBox(width: 6.w),
                                        SizedBox(
                                          width: 180.w,
                                          child: InkWell(
                                            onTap: () {
                                              Clipboard.setData(ClipboardData(
                                                  text: clubIntroState
                                                      .value!.leaderHp));
                                            },
                                            child: TextFontWidget.fontRegular(
                                              clubIntroState.value!.leaderHp,
                                              overflow: TextOverflow.ellipsis,
                                              color: const Color(0xFF353549),
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400,
                                              height: 1.h,
                                              letterSpacing: -0.35.sp,
                                            ),
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
                                        SizedBox(
                                          width: 180.w,
                                          child: InkWell(
                                            onTap: () {
                                              Clipboard.setData(ClipboardData(
                                                  text: clubIntroState
                                                      .value!.clubInsta));
                                            },
                                            child: TextFontWidget.fontRegular(
                                              '@${clubIntroState.value!.clubInsta}',
                                              overflow: TextOverflow.ellipsis,
                                              color: const Color(0xFF353549),
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400,
                                              height: 1.h,
                                              letterSpacing: -0.35.sp,
                                            ),
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
                            TextFontWidget.fontRegular(
                              '동아리 소개',
                              color: const Color(0xFF353549),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w800,
                              height: 1.h,
                              letterSpacing: -0.8.sp,
                            ),
                          ],
                        ),
                        SizedBox(height: 12.h),
                        Container(
                          alignment: Alignment.topLeft,
                          height: 154.h,
                          padding: EdgeInsets.fromLTRB(24.sp, 0, 24.sp, 0),
                          child: Html(data: clubIntroState.value!.introContent),
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
                child: TextFontWidget.fontRegular('이미지 준비중 ...',
                    fontSize: 14.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w500));
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
        child: TextFontWidget.fontRegular(
          widget.text,
          color: const Color(0xffffffff),
          fontSize: 18,
          fontWeight: FontWeight.w800,
          height: 1.111,
        ),
      ),
    );
  }
}
