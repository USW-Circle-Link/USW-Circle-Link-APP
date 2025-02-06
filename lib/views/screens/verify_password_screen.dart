import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:usw_circle_link/models/profile_model.dart';
import 'package:usw_circle_link/utils/dialog_manager.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';
import 'package:usw_circle_link/viewmodels/update_profile_view_model.dart';
import 'package:usw_circle_link/views/widgets/rounded_rext_field.dart';
import 'package:usw_circle_link/views/widgets/text_font_widget.dart';

class VerifyPasswordScreen extends ConsumerStatefulWidget {
  final Map<String, String>? profileData;
  const VerifyPasswordScreen({Key? key, required this.profileData})
      : super(key: key);

  @override
  _VerifyPasswordScreenState createState() => _VerifyPasswordScreenState();
}

class _VerifyPasswordScreenState extends ConsumerState<VerifyPasswordScreen> {
  final TextEditingController passwordController = TextEditingController();
  String? _passwordError; // 비밀번호 에러 메시지

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
    ref.listen<AsyncValue<ProfileModel>>(updateProfileViewModelProvider,
        (previous, next) {
      next.when(
        data: (profile) {
          if (profile.type == ProfileModelType.updateProfile) {
            Navigator.pop(context);
          }
        },
        error: (error, stackTrace) {
          if (error is ProfileModelError && error.code == "USR-204") {
            setState(() {
              _passwordError = "비밀번호가 일치하지 않습니다.";
            });
          }
        },
        loading: () {},
      );
    });
    final profileData = widget.profileData;
    logger.d('ProfileData: $profileData');

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
                SizedBox(height: 16.h),
                TextFontWidget.fontRegular(
                  '비밀번호',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(height: 8.h),
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
                // 비밀번호 불일치 에러 메시지 영역 (빨간 텍스트)
                SizedBox(
                  height: 25.h,
                  child: _passwordError != null
                      ? Padding(
                          padding: EdgeInsets.only(top: 8.h),
                          child: Text(
                            "* $_passwordError",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 12.sp,
                                height: 1.sp),
                          ),
                        )
                      : const SizedBox.shrink(),
                ),
                SizedBox(height: 436.h),
                SizedBox(
                  width: double.infinity,
                  height: 56.h,
                  child: OutlinedButton(
                    onPressed: () async {
                      setState(() {
                        _passwordError = null;
                      });
                      final password = passwordController.text.trim();
                      logger.d('ProfileData: $profileData');
                      if (password.isEmpty) {
                        DialogManager.instance.showAlertDialog(
                          context: context,
                          content: "비밀번호를 입력해주세요.",
                        );
                        return;
                      }
                      if (profileData == null) {
                        DialogManager.instance.showAlertDialog(
                          context: context,
                          content: "프로필 정보가 없습니다. 다시 시도해주세요.",
                        );
                        return;
                      }
                      // updateProfile 호출 (password 매개변수를 포함)
                      await ref
                          .read(updateProfileViewModelProvider.notifier)
                          .updateProfile(
                            userName: profileData['name']!,
                            studentNumber: profileData['studentNumber']!,
                            userHp: profileData['userHp']!,
                            major: profileData['major']!,
                            password: password,
                          );
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
                SizedBox(height: 5.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
