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
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                SignUpIcons.ic_fireworks,
                size: 80.sp,
                color: accentColor,
              ),
              SizedBox(height: 12.h),
              TextFontWidget.fontRegular(
                '회원가입이\n완료되었습니다.',
                fontSize: 24.sp,
                color: const Color(0xFF111111),
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12.h),
              TextFontWidget.fontRegular(
                '동아리 구하는 사람 모여라!\n미루지 말고 지금, 동구라미!',
                fontSize: 15.sp,
                color: const Color(0xFF111111),
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
              ),
            ],
          ),
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
