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
import 'package:usw_circle_link/viewmodels/sign_up_view_model.dart';
import 'package:usw_circle_link/views/widgets/circle_detail_overlay.dart';
import 'package:usw_circle_link/views/widgets/text_font_widget.dart';

class newCircleScreen extends ConsumerStatefulWidget {
  final int clubId;

  const newCircleScreen({required this.clubId, super.key});

  @override
  ConsumerState<newCircleScreen> createState() => _newCircleScreenState();
}

class _newCircleScreenState extends ConsumerState<newCircleScreen> {
  final GlobalKey _iconKey = GlobalKey();
  OverlayEntry? _overlayEntry;
  int activeIndex = 0;

  void _showOverlay(String circleRoom, String leaderHp, String clubInsta) {
    final RenderBox renderBox = _iconKey.currentContext!.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);
    final Size size = renderBox.size;

    _overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          GestureDetector(
            onTap: _removeOverlay,
            child: Container(
              color: Colors.transparent,
            ),
          ),
          Positioned(
            top: offset.dy + size.height,
            left: offset.dx - 150,
            child: Material(
              color: Colors.transparent,
              child: CircleDetailOverlay(
                circleRoom: circleRoom.isNotEmpty ? circleRoom : "정보 없음",
                leaderHp: leaderHp.isNotEmpty ? leaderHp : "정보 없음",
                clubInsta: clubInsta.isNotEmpty ? clubInsta : "정보 없음",
                onClose: _removeOverlay,
              ),
            ),
          ),
        ],
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

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
                                    fontWeight: FontWeight.w500,
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
              Container(
                width: 375.w,
                height: 122.h,
                child: Row(
                  children: [
                    SizedBox(
                      width: 31.w,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          height: 82.h,
                          width: 82.w,
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xffc4c4c4)),
                            borderRadius: BorderRadius.circular(12.r),
                            image: clubIntroState.value!.mainPhotoPath != null
                                ? DecorationImage(
                              image: NetworkImage(clubIntroState.value!.mainPhotoPath!),
                              fit: BoxFit.cover,
                            )
                                : null,
                            color: const Color.fromARGB(255, 164, 164, 164),
                          ),
                          child: clubIntroState.value!.mainPhotoPath == null
                              ? Center(
                            child: Icon(
                              Icons.person,
                              color: const Color.fromARGB(255, 255, 255, 255),
                              size: 60,
                            ),
                          )
                              : null,
                        ),
                      ],
                    ),
                    SizedBox(width: 16.w,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 24.h,),
                        SizedBox(
                          width: 188.w,
                          child: TextFontWidget.fontRegular(
                            clubIntroState.value!.clubName,
                            overflow: TextOverflow.ellipsis,
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w800,
                            height: 1.h,
                            letterSpacing: -0.45.sp,
                          ),
                        ),
                        SizedBox(height: 7.h,),
                        Row(
                          children: [
                            TextFontWidget.fontRegular(
                              '동아리 회장',
                              color: const Color(0xFF767676),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
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
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
                                height: 1.h,
                                letterSpacing: -0.35.sp,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 9.h,),
                        Row(
                          children: [
                            Container(
                              height: 22.h,
                              width: 73.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: const Color(0xffC0C0C0),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(height: 6.h,),
                        IconButton(
                          key: _iconKey,
                          onPressed: () {
                            if (_overlayEntry == null) {
                              _showOverlay("임시", clubIntroState.value!.leaderHp, clubIntroState.value!.clubInsta );
                            } else {
                              _removeOverlay();
                            }
                          },
                          icon: Icon(Icons.more_vert),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 187.w,
                    height: 46.h,
                    color: Colors.amber,
                  ),
                  Container(
                    height: 46.h,
                    width: 188.w,
                    color: Colors.grey,
                  ),
                ],
              )
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
                fontWeight: FontWeight.w800));
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
