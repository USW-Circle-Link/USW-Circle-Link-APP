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

class UpdateProfileScreen extends ConsumerStatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  _UpdateProfileScreenState createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends ConsumerState<UpdateProfileScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phonenumberController = TextEditingController();
  final TextEditingController studentnumberController = TextEditingController();
  String? college;
  String? major;

  String? nameError;
  String? phoneError;
  String? studentNumberError;
  String? majorError;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    phonenumberController.dispose();
    studentnumberController.dispose();
    super.dispose();
  }

  void validateFields(AsyncValue<ProfileModel> state) {
    setState(() {
      final error = state.error as ProfileModelError?;
      logger.d('Error type: ${state.error.runtimeType}');
      logger.d('Error details: $error');

      nameError = ErrorUtil.instance.isValid(error?.code, FieldType.username)
          ? null
          : ErrorUtil.instance.getErrorMessage("USR-F400");
      phoneError = ErrorUtil.instance.isValid(error?.code, FieldType.phoneNumber)
          ? null
          : ErrorUtil.instance.getErrorMessage("USR-F500");
      studentNumberError = ErrorUtil.instance.isValid(error?.code, FieldType.studentNumber)
          ? null
          : ErrorUtil.instance.getErrorMessage("USR-F600");
      majorError = (college == null || major == null)
          ? '단과대학/학과를 선택해주세요!'
          : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(updateProfileViewModelProvider);

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
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
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 18.h),
                // 이름 필드
                TextFontWidget.fontRegular(
                  '이름',
                  color: const Color(0xff000000),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  height: 1.12.sp,
                ),
                SizedBox(height: 12.h),
                RoundedTextField(
                  height: 50.h,
                  textEditController: nameController,
                  leftBottomCornerRadius: 8.r,
                  rightBottomCornerRadius: 8.r,
                  leftTopCornerRadius: 8.r,
                  rightTopCornerRadius: 8.r,
                  borderColor: nameError == null
                      ? const Color(0xffDBDBDB)
                      : Colors.red,
                  borderWidth: 1.w,
                  maxLines: 1,
                  textInputType: TextInputType.text,
                  textAlign: TextAlign.left,
                  hintText: "이름",
                  prefixIcon: SvgPicture.asset(
                    'assets/images/ic_person.svg',
                    width: 13.w,
                    height: 16.h,
                    fit: BoxFit.scaleDown,
                  ),
                  hintStyle: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'SUIT',
                  ),
                ),
                SizedBox(
                  height: 20.h, // 고정 높이
                  child: nameError != null
                      ? Padding(
                    padding: EdgeInsets.only(top: 8.h),
                    child: Text(
                      '* '+nameError!,
                      style: TextStyle(color: Colors.red, fontSize: 12.sp, height: 1.sp),
                    ),
                  )
                      : null,
                ),
                SizedBox(height: 12.h),

                // 전화번호 필드
                TextFontWidget.fontRegular(
                  '전화번호',
                  color: const Color(0xff000000),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  height: 1.12.sp,
                ),
                SizedBox(height: 12.h),
                RoundedTextField(
                  height: 50.h,
                  textEditController: phonenumberController,
                  leftBottomCornerRadius: 8.r,
                  rightBottomCornerRadius: 8.r,
                  leftTopCornerRadius: 8.r,
                  rightTopCornerRadius: 8.r,
                  borderColor: phoneError == null
                      ? const Color(0xffDBDBDB)
                      : Colors.red,
                  borderWidth: 1.w,
                  maxLines: 1,
                  textInputType: TextInputType.text,
                  textAlign: TextAlign.left,
                  prefixIcon: SvgPicture.asset(
                    'assets/images/ic_phone.svg',
                    width: 13.w,
                    height: 16.h,
                    fit: BoxFit.scaleDown,
                  ),
                  hintText: "전화번호 (- 제외입력)",
                  hintStyle: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'SUIT',
                  ),
                ),
                SizedBox(
                  height: 20.h, // 고정 높이
                  child: phoneError != null
                      ? Padding(
                    padding: EdgeInsets.only(top: 8.h),
                    child: Text(
                      '* '+phoneError!,
                      style: TextStyle(color: Colors.red, fontSize: 12.sp, height: 1.sp),
                    ),
                  )
                      : null,
                ),
                SizedBox(height: 12.h),

                // 학번 필드
                TextFontWidget.fontRegular(
                  '학번',
                  color: const Color(0xff000000),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  height: 1.12.sp,
                ),
                SizedBox(height: 12.h),
                RoundedTextField(
                  height: 50.h,
                  textEditController: studentnumberController,
                  leftBottomCornerRadius: 8.r,
                  rightBottomCornerRadius: 8.r,
                  leftTopCornerRadius: 8.r,
                  rightTopCornerRadius: 8.r,
                  borderColor: studentNumberError == null
                      ? const Color(0xffDBDBDB)
                      : Colors.red,
                  borderWidth: 1.w,
                  maxLines: 1,
                  textInputType: TextInputType.text,
                  textAlign: TextAlign.left,
                  prefixIcon: SvgPicture.asset(
                    'assets/images/ic_tag.svg',
                    width: 13.w,
                    height: 16.h,
                    fit: BoxFit.scaleDown,
                  ),
                  hintText: "학번",
                  hintStyle: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'SUIT',
                  ),
                ),
                SizedBox(
                  height: 20.h, // 고정 높이
                  child: studentNumberError != null
                      ? Padding(
                    padding: EdgeInsets.only(top: 8.h),
                    child: Text(
                      '* '+studentNumberError!,
                      style: TextStyle(color: Colors.red, fontSize: 12.sp, height: 1.sp),
                    ),
                  )
                      : null,
                ),
                SizedBox(height: 12.h),

                // 학과 필드
                TextFontWidget.fontRegular(
                  '학부(학과)',
                  color: const Color(0xff000000),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  height: 1.12.sp,
                ),
                SizedBox(height: 12.h),
                RoundedTextField(
                  height: 50.h,
                  readOnly: true,
                  onTab: () async {
                    await DialogManager.instance.showMajorPickerDialog(
                      context: context,
                      defaultCollege: college,
                      defaultMajor: major,
                      onChanged: (newCollege, newMajor) {
                        logger.d('onChanged - $newCollege / $newMajor');
                      },
                      onConfirmPressed: (college, major) {
                        setState(() {
                          this.college = college;
                          this.major = major;
                          logger.d('${this.college} - ${this.major}');
                        });
                      },
                    );
                  },
                  leftBottomCornerRadius: 8.r,
                  rightBottomCornerRadius: 8.r,
                  leftTopCornerRadius: 8.r,
                  rightTopCornerRadius: 8.r,
                  borderColor: majorError == null
                      ? const Color(0xffDBDBDB)
                      : Colors.red,
                  borderWidth: 1.w,
                  maxLines: 1,
                  textInputType: TextInputType.none,
                  textAlign: TextAlign.left,
                  textInputAction: TextInputAction.done,
                  hintText: (college == null && major == null)
                      ? '학과'
                      : '${college ?? ""} / ${major ?? ""}',
                  isAnimatedHint: false,
                  prefixIcon: SvgPicture.asset(
                    'assets/images/ic_bookmark.svg',
                    width: 13.w,
                    height: 16.h,
                    fit: BoxFit.scaleDown,
                  ),
                  hintStyle: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'SUIT',
                  ),
                ),
                SizedBox(
                  height: 20.h, // 고정 높이
                  child: majorError != null
                      ? Padding(
                    padding: EdgeInsets.only(top: 8.h),
                    child: Text(
                      '* '+majorError!,
                      style: TextStyle(color: Colors.red, fontSize: 12.sp, height: 1.sp),
                    ),
                  )
                      : null,
                ),
                SizedBox(height: 88.h),

                // 수정 완료 버튼
                SizedBox(
                  width: double.infinity,
                  height: 56.h,
                  child: OutlinedButton(
                    onPressed: () {
                      validateFields(state);
                      if (nameError == null &&
                          phoneError == null &&
                          studentNumberError == null &&
                          majorError == null) {
                        final name = nameController.text.trim();
                        final studentNumber = studentnumberController.text.trim();
                        final userHp = phonenumberController.text.trim();

                        ref
                            .read(updateProfileViewModelProvider.notifier)
                            .updateProfile(
                          userName: name,
                          studentNumber: studentNumber,
                          userHp: userHp,
                          major: major ?? "",
                        );
                      }
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
                      '수정 완료',
                      fontSize: 18.sp,
                      color: const Color(0xFFFFFFFF),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {
                            context.go('/verify_password/update_profile/delete_user');
                          },
                          child: TextFontWidget.fontRegular(
                            '회원 탈퇴',
                            color: const Color(0xffABABAB),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          )
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

extension FindCollegeByMajor on Map<String, List> {
  String? findCollegeByMajor(String? target) {
    if (target == null) return null;
    for (var entry in entries) {
      for (var major in entry.value) {
        if (major == target) {
          return entry.key;
        }
      }
    }
    return null;
  }
}
