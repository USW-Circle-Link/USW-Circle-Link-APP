import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CircleScreen extends StatefulWidget {
  const CircleScreen({super.key});

  @override
  State<CircleScreen> createState() => _CircleScreenState();
}

class _CircleScreenState extends State<CircleScreen> {
  int activeIndex = 0;

  final List<String> images = [
    'assets/images/circleimage.png',
    'assets/images/circleimage.png',
    'assets/images/circleimage.png',
    'assets/images/circleimage.png',
    'assets/images/circleimage.png',
  ];

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(62.h),
          child: AppBar(
            toolbarHeight: 62.h,
            centerTitle: true,
            elevation: 0.0,
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
        bottomNavigationBar: Padding(
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
                CustomButton(text: '지원하기', onPressed: () {}),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  CarouselSlider.builder(
                    itemCount: images.length,
                    itemBuilder: (context, index, realIndex) {
                      final imageUrl = images[index];
                      return buildImage(imageUrl, index);
                    },
                    options: CarouselOptions(
                      height: 250.h,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) =>
                          setState(() => activeIndex = index),
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
                            color: Colors.black.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(150.sp),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${activeIndex + 1}',
                                  style: TextStyle(
                                    color: const Color(0xffBFBFBF),
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Pretendard',
                                    height: 1.h,
                                    letterSpacing: -0.3.sp,
                                  ),
                                ),
                            Text(
                              ' / ${images.length}',
                              style: TextStyle(
                                color: const Color(0xffBFBFBF),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Pretendard',
                                height: 1.h,
                                letterSpacing: -0.3.sp,
                              ),
                            ),

                              ],
                            )
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Container(
                height: 100.h,
                child: Row(
                  children: [
                    SizedBox(width: 24.w),
                    Image.asset('assets/images/circlelogo.png'),
                    SizedBox(width: 16.w),
                    Container(
                      width: 160,
                      child: Column(
                        children: [
                          SizedBox(height: 10.h),
                          Container(
                            child: Row(
                              children: [
                                Text(
                                  '굴리세',
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
                                SvgPicture.asset('assets/images/Vector10.svg'),
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
                                  '홍길동',
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
                          ),
                          SizedBox(height: 20.h),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  'assets/images/phonelogo.svg',
                                  height: 16.h,
                                  width: 16.w,
                                ),
                                SizedBox(width: 6.w),
                                Text(
                                  '010-1234-5678',
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
                          ),
                          SizedBox(height: 11.h),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/images/kakaologo.png',
                                  height: 16.h,
                                  width: 16.w,
                                ),
                                SizedBox(width: 6.w),
                                Text(
                                  '@kakao',
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
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              SvgPicture.asset('assets/images/Vector15.svg'),
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
                  '동아리 소개 동아리 소개 동아리 소개 동아리 소개 동아리 소개 동아리 소개 동아리 소개 동아리 소개 동아리 소개 동아리 소개 동아리 소개 동아리 소개 동아리 소개 동아리 소개 동아리 소개 동아리 소개 동아리 소개 동아리 소개 동아리 소개 동아리 소개 동아리 소개 동아리 소개 동아리 소개 동아리 소개 동아리 소개 동아리 소개 동아리 소개 동아리 소개 동아리 소개 동아리 소개 동아리 소개 동아리 소개 동아리 소개 동아리 소개 동아리 소개 동아리 소개 동아리 소개 동아리 소개 동아리 소개 동아리 소개',
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
    child: Image.asset(
      imageUrl,
      fit: BoxFit.cover,
    ),
  );


}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.sp,
      width: 327.sp,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.sp),
        color: const Color(0xff4F5BD0),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: const Color(0xffffffff),
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            fontFamily: 'Pretendard',
            height: 1.111.sp,
          ),
        ),
      ),
    );
  }
}
