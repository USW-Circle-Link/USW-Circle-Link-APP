import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:usw_circle_link/const/data.dart';
import 'package:usw_circle_link/utils/dialog_manager.dart';
import 'package:usw_circle_link/views/widgets/text_font_widget.dart';

class SignUpOptionScreen extends ConsumerStatefulWidget {
  const SignUpOptionScreen({Key? key}) : super(key: key);

  @override
  _SignUpOptionScreenState createState() => _SignUpOptionScreenState();
}

class _SignUpOptionScreenState extends ConsumerState<SignUpOptionScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,
          titleSpacing: 0.0,
          title: Padding(
            padding: EdgeInsets.only(left: 22.w),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: SvgPicture.asset(
                    'assets/images/ic_back_arrow.svg',
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 60.h),
            padding: EdgeInsets.only(left: 32.w, right: 32.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: "동아리 구하는 사람 모여라!\n미루지 말고 지금,",
                    style: TextFontWidget.fontRegularStyle(
                      fontSize: 12.sp,
                      color: const Color(0xFF282828),
                      fontWeight: FontWeight.w400,
                    ),
                    children: const [],
                  ),
                ),
                SizedBox(height: 10.h),
                Wrap(
                  children: [
                    SizedBox(
                      child: Image.asset('assets/images/dongurami.png',
                          width: 24.w, height: 24.h, fit: BoxFit.contain),
                    ),
                    SizedBox(width: 4.w),
                    TextFontWidget.jalnan2(
                      '동구라미',
                      fontSize: 20.sp,
                      color: const Color(0xffFFC01D),
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFontWidget.fontRegular(
                        '신규 회원',
                        fontSize: 16.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                      SizedBox(height: 8.h),
                      TextFontWidget.fontRegular(
                        '아직 중앙동아리 회원이 아니신가요?',
                        fontSize: 12.sp,
                        color: Colors.black54,
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(height: 16.h),
                      SizedBox(
                        width: double.infinity,
                        height: 40.h,
                        child: OutlinedButton(
                          onPressed: () {
                            context.go(
                                '/login/sign_up_option/policy_agree',
                                extra: true,
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: const Color(0xffffB052),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                            side: BorderSide.none,
                          ),
                          child: TextFontWidget.fontRegular(
                            '신규 회원으로 가입',
                            fontSize: 14.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFontWidget.fontRegular(
                        '기존 동아리 회원',
                        fontSize: 16.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                      SizedBox(height: 8.h),
                      TextFontWidget.fontRegular(
                        '현재 중앙동아리 회원이신가요?',
                        fontSize: 12.sp,
                        color: Colors.black54,
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(height: 16.h),
                      SizedBox(
                        width: double.infinity,
                        height: 40.h,
                        child: OutlinedButton(
                          onPressed: () {
                            DialogManager.instance.showAlertDialog(
                              context: context,
                              content:
                                  '기존 동아리 회원 가입의 경우\n해당 동아리 회장의 가입 요청 수락 후\n로그인이 가능합니다.',
                              onLeftButtonPressed: () {
                                context
                                    .go(
                                  '/login/sign_up_option/policy_agree',
                                extra: false,
                                );
                              },
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: const Color(0xff404040),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                            side: BorderSide.none,
                          ),
                          child: TextFontWidget.fontRegular(
                            '기존 회원으로 가입',
                            fontSize: 14.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFontWidget.fontRegular(
                      '이미 회원이신가요? ',
                      fontSize: 12.sp,
                      color: Color(0xFFA9A9A9),
                      fontWeight: FontWeight.w400,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () {
                        context.go('/login');
                      },
                      child: TextFontWidget.fontRegular(
                        '로그인',
                        fontSize: 12.sp,
                        color: accentColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
