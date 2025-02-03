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
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 생성자에서 전달받은 데이터를 사용합니다.
    final profileData = widget.profileData;
    logger.d('ProfileData: $profileData');

    // build 내에서 provider 상태 변화를 listen합니다.
    ref.listen<AsyncValue<ProfileModel>>(updateProfileViewModelProvider,
            (previous, next) {
          next.when(
            data: (profile) {
              // 프로필 수정이 성공해서 type이 updateProfile인 경우
              if (profile.type == ProfileModelType.updateProfile) {
                // VerifyPasswordScreen에서는 성공 팝업을 띄우지 않고 update_profile_screen으로 이동합니다.
                context.go('/update_profile');
              }
            },
            error: (error, stackTrace) {
              if (error is ProfileModelError) {
                // 비밀번호 인증 실패(USR-204)인 경우, 에러 메시지를 화면에 표시합니다.
                if (error.code == "USR-204") {
                  setState(() {
                    _passwordError = "비밀번호가 일치하지 않습니다.";
                  });
                } else {
                  // 다른 에러는 팝업으로 처리합니다.
                  DialogManager.instance.showAlertDialog(
                    context: context,
                    content: error.message,
                  );
                }
              }
            },
            loading: () {},
          );
        });

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
                // 비밀번호 불일치 에러 메시지 영역
                SizedBox(height: 8.h),
                _passwordError != null
                    ? Text(
                  "* $_passwordError",
                  style: TextStyle(color: Colors.red, fontSize: 12.sp),
                )
                    : SizedBox.shrink(),
                SizedBox(height: 441.h),
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
                      // 모든 데이터를 백엔드로 전송 (updateProfileViewModel에서 password 매개변수를 처리)
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
