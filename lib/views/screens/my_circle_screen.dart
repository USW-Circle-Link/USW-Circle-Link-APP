import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:usw_circle_link/viewmodels/my_circle_view_model.dart';
import 'package:usw_circle_link/views/widgets/text_font_widget.dart';

class MyCircleScreen extends ConsumerWidget {
  const MyCircleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final circlesAsyncValue = ref.watch(MyCircleListProvider);

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
        body: circlesAsyncValue.when(
          data: (circles) => ListView.builder(
            itemCount: circles.length,
            itemBuilder: (context, index) {
              final circle = circles[index];
              if (index == 0) {
                return Column(
                  children: [
                    SizedBox(height: 24.h), // 첫 번째 아이템 위에 SizedBox 추가
                    CircleList(
                      CircleLeader: circle.leaderName,
                      CircleName: circle.clubName,
                      ImageUrl: circle.mainPhotoPath?? "",
                      leaderHp: circle.leaderHp,
                      InstaId: circle.clubInsta,
                    ),
                  ],
                );
              } else {
                return CircleList(
                  CircleLeader: circle.leaderName,
                  CircleName: circle.clubName,
                  ImageUrl: circle.mainPhotoPath??"",
                  leaderHp: circle.leaderHp,
                  InstaId: circle.clubInsta,
                );
              }
            },
          ),
          loading: () => Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(child: Text('소속 동아리 목록 조회에 실패하였습니다: $error')),
        ),
      ),
    );
  }
}

class CircleList extends StatelessWidget {
  final String CircleName;
  final String? ImageUrl;
  final String CircleLeader;
  final String InstaId;
  final String leaderHp;

  const CircleList({
    required this.CircleLeader,
    required this.CircleName,
    this.ImageUrl,
    required this.leaderHp,
    required this.InstaId,
  });

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
                    alignment: Alignment.center,
                    child: Image.network(
                      ImageUrl??"",
                      errorBuilder: (context, error, stackTrace) {
                        return TextFontWidget.fontRegular(text: '이미지 없음', fontSize: 14.sp, color: Colors.black, fontweight: FontWeight.w400);
                      },
                    ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 26.h),
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
                        SizedBox(width: 4.w,),
                        SvgPicture.asset(
                          'assets/images/phonelogo.svg',
                          height: 16.h,
                          width: 16.w,
                        ),
                        SizedBox(width: 6.w),
                        Text(
                          leaderHp,
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
                              width: 25.w,
                              height: 25.h,
                              'assets/images/Instagramlogo.png',
                            ),
                        SizedBox(width: 6.w),
                        Text(
                          '@'+InstaId,
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
          SizedBox(height: 12.h),
        ],
      ),
    );
  }
}