import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/viewmodels/application_circle_view_model.dart';
import 'package:usw_circle_link/views/widgets/circle_detail_item.dart';
import 'package:usw_circle_link/views/widgets/text_font_widget.dart';

class Applicationcirclescreen extends ConsumerStatefulWidget {
  const Applicationcirclescreen({super.key});

  @override
  _ApplicationcirclescreenState createState() =>
      _ApplicationcirclescreenState();
}

class _ApplicationcirclescreenState
    extends ConsumerState<Applicationcirclescreen> {
  @override
  Widget build(BuildContext context) {
    final circlesAsyncValue = ref.watch(applicationCircleListProvider);
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
                  SizedBox(width: 69.8.w),
                  Text(
                    '나의 지원 현황',
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
          data: (circles) => Padding(
            padding: EdgeInsets.fromLTRB(0,24.h,0,0),
            child: ListView.builder(
              itemCount: circles.length,
              itemBuilder: (context, index) {
                final circle = circles[index];
                return CircleDetailItem(
                  leader: circle.leaderName,
                  name: circle.clubName,
                  imageUrl: circle.mainPhotoPath,
                  leaderHp: circle.leaderHp,
                  instaId: circle.clubInsta,
                  status: circle.status,
                );
              },
            ),
          ),
          loading: () => Center(child: CircularProgressIndicator()),
          error: (error, stack) =>
              Center(child: Text('지원 동아리 목록 조회에 실패하였습니다: $error')),
        ),
      ),
    );
  }
}
