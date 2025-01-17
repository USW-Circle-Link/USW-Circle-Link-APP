import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:usw_circle_link/const/data.dart';
import 'package:usw_circle_link/models/profile_model.dart';
import 'package:usw_circle_link/utils/dialog_manager.dart';
import 'package:usw_circle_link/utils/error_util.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';
import 'package:usw_circle_link/viewmodels/update_profile_view_model.dart';
import 'package:usw_circle_link/views/widgets/rounded_rext_field.dart';
import 'package:usw_circle_link/views/widgets/text_font_widget.dart';

class VerifyPasswordScreen extends ConsumerStatefulWidget {
  const VerifyPasswordScreen({super.key});

  @override
  _VerifyPasswordScreenState createState() => _VerifyPasswordScreenState();
}

class _VerifyPasswordScreenState extends ConsumerState<VerifyPasswordScreen> {
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

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
                  TextFontWidget.fontRegular(
                    '내 정보 수정',
                    color: Colors.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    height: 1.111.h,
                    letterSpacing: -0.45.sp,
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.h,),
                TextFontWidget.fontRegular(
                    '비밀번호',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(height: 8.h,),
                RoundedTextField(
                  height: 50.h,
                  textEditController: passwordController,
                  leftBottomCornerRadius: 8.r,
                  rightBottomCornerRadius: 8.r,
                  leftTopCornerRadius: 8.r,
                  rightTopCornerRadius: 8.r,
                  borderColor: const Color(0xffDBDBDB),
                  borderWidth: 1.w,
                  maxLines: 1,
                  textInputType: TextInputType.text,
                  textAlign: TextAlign.left,
                  hintText: "비밀번호를 입력해주세요.",
                  prefixIcon: SvgPicture.asset(
                    'assets/images/ic_password.svg',
                    width: 13.w,
                    height: 16.h,
                    fit: BoxFit.scaleDown,
                  ),
                  hintStyle: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'SUIT',
                  ),
                ),
                SizedBox(height: 449.h,),
                SizedBox(
                  width: double.infinity,
                  height: 56.h,
                  child: OutlinedButton(
                    onPressed: () async {
                      final password = passwordController.text.trim();
                      context.go('/verify_password/update_profile');
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFB052),
                      foregroundColor: const Color(0xFFFFFFFF),
                      side: const BorderSide(
                        color: Colors.transparent,
                        width: 0.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: TextFontWidget.fontRegular(
                      '확인',
                      fontSize: 18.sp,
                      color: const Color(0xFFFFFFFF),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                SizedBox(height: 5.h,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
