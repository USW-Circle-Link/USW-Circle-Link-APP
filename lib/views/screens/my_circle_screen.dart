import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:usw_circle_link/viewmodels/my_circle_view_model.dart';
import 'package:usw_circle_link/views/widgets/circle_detail_item.dart';

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
        body: Column(
          children: [
            SizedBox(height: 24.h),
            circlesAsyncValue.when(
              data: (circles) => ListView.builder(
                itemCount: circles.length,
                itemBuilder: (context, index) {
                  final circle = circles[index];
                  return CircleDetailItem(
                    leader: circle.leaderName,
                    name: circle.clubName,
                    imageUrl: circle.mainPhotoPath,
                    leaderHp: circle.leaderHp,
                    instaId: circle.clubInsta, 
                  );
                },
              ),
              loading: () => Center(child: CircularProgressIndicator()),
              error: (error, stack) =>
                  Center(child: Text('소속 동아리 목록 조회에 실패하였습니다: $error')),
            ),
          ],
        ),
      ),
    );
  }
}
