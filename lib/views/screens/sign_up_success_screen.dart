import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:usw_circle_link/const/data.dart';
import 'package:usw_circle_link/utils/icons/sign_up_icons_icons.dart';
import 'package:usw_circle_link/views/widgets/text_font_widget.dart';

class SignUpSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,
          titleSpacing: 0.0,
          title: Padding(
            padding: EdgeInsets.only(
                left: 22.w, right: 22.w), // icon에 10.w 정도의 여백이 기본적으로 존재
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
              ],
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            Icon(
              SignUpIcons.ic_fireworks,
              size: 100.sp,
            ),
            TextFontWidget.fontRegular(
              '회원 가입이 성공적으로 완료되었습니다.',
              fontSize: 18.sp,
              color: const Color(0xFF989898),
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
        bottomNavigationBar: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            margin: EdgeInsets.only(bottom: 10.h),
            height: 56.h,
            child: OutlinedButton(
              onPressed: () {
                context.go('/login');
              },
              style: OutlinedButton.styleFrom(
                backgroundColor: accentColor,
                foregroundColor: const Color(0xFFFFFFFF),
                side: BorderSide.none,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: TextFontWidget.fontRegular(
                '로그인하러 가기',
                fontSize: 18.sp,
                color: const Color(0xFFFFFFFF),
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
