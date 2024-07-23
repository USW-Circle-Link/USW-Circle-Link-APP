import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyCircleScreen extends StatefulWidget {
  const MyCircleScreen({super.key});

  @override
  State<MyCircleScreen> createState() => _MyCircleScreenState();
}

class _MyCircleScreenState extends State<MyCircleScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => Scaffold(
        backgroundColor: const Color(0xffF0F2F5),
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(62.h),
          child: AppBar(
            scrolledUnderElevation: 0,
            toolbarHeight: 62.h,
            centerTitle: true,
            elevation: 0.0,
            backgroundColor: const Color(0xffFFFFFF),
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
                  SizedBox(width: 62.25.w),
                  Text(
                    '나의 소속 동아리',
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 24.h,),
              CircleList(
                  CircleLeader: '홍길동',
                  CircleName: 'FLAG',
                  ImageUrl: 'assets/images/flaglogo.png',
                  KakaoId: '@Kakao',
                  PhoneNumber: '010-1234-5678',
                ),
              CircleList(
                CircleLeader: '홍길동',
                CircleName: 'FLAG',
                ImageUrl: 'assets/images/flaglogo.png',
                KakaoId: '@Kakao',
                PhoneNumber: '010-1234-5678',
              ),
              CircleList(
                CircleLeader: '홍길동',
                CircleName: 'FLAG',
                ImageUrl: 'assets/images/flaglogo.png',
                KakaoId: '@Kakao',
                PhoneNumber: '010-1234-5678',
              ),
              CircleList(
                CircleLeader: '홍길동',
                CircleName: 'FLAG',
                ImageUrl: 'assets/images/flaglogo.png',
                KakaoId: '@Kakao',
                PhoneNumber: '010-1234-5678',
              ),
              CircleList(
                CircleLeader: '홍길동',
                CircleName: 'FLAG',
                ImageUrl: 'assets/images/flaglogo.png',
                KakaoId: '@Kakao',
                PhoneNumber: '010-1234-5678',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CircleList extends StatelessWidget {
  final String CircleName;
  final String ImageUrl;
  final String CircleLeader;
  final String PhoneNumber;
  final String KakaoId;

  const CircleList({
    required this.CircleLeader,
    required this.CircleName,
    required this.ImageUrl,
    required this.KakaoId,
    required this.PhoneNumber,
  });
//test
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            height: 132.h,
            width: 327.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.sp),
              color: const Color(0xffFFFFFF),
            ),
            child: Row(
              children: [
                Container(
                  height: 100.sp,
                  width: 100.sp,
                  margin: EdgeInsets.all(16.sp),
                  child: Image.asset(ImageUrl,),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 26.h,),
                    Row(
                      children: [
                        Text(
                          CircleName,
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
                          CircleLeader,
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          'assets/images/phonelogo.svg',
                          height: 16.h,
                          width: 16.w,
                        ),
                        SizedBox(width: 6.w),
                        Text(
                          PhoneNumber,
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/kakaologo.png',
                        ),
                        SizedBox(width: 6.w),
                        Text(
                          KakaoId,
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
              ],
            ),
          ),
          SizedBox(height: 12.h,)
        ],
      ),
    );
  }
}
