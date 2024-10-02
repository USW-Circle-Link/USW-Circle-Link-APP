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

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(updateProfileViewModelProvider);
    ref.listen(updateProfileViewModelProvider, (previous, next) {
      logger.d(next);
      next.when(data: (profile) {
        logger.d('data - $profile');
        switch (next.value?.type) {
          case ProfileModelType.getProfile:
            bind(profile);
            break;
          case ProfileModelType.updateProfile:
            DialogManager.instance.showAlertDialog(
              context: context,
              content: '프로필이 수정되었습니다!',
              onLeftButtonPressed: () => context.go('/'),
            );
            break;
          default:
        }
      }, error: (error, stackTrace) {
        error = (error as ProfileModelError);
        logger.d('error - $stackTrace');
        switch (error.type) {
          case ProfileModelType.getProfile:
            DialogManager.instance.showAlertDialog(
              context: context,
              content: ErrorUtil.instance.getErrorMessage(error.code) ??
                  "프로필을 불러오는 데 문제가 발생했습니다!",
            );
            break;
          case ProfileModelType.updateProfile:
            DialogManager.instance.showAlertDialog(
              context: context,
              content: ErrorUtil.instance.getErrorMessage(error.code) ??
                  "프로필을 설정하는 데 문제가 발생했습니다!",
            );
            break;
          default:
        }
      }, loading: () {
        logger.d('loading');
      });
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
                  Text(
                    '내 정보 수정',
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
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.h),
                // 이름 필드
                Text(
                  '이름',
                  style: TextStyle(
                    color: const Color(0xff000000),
                    fontFamily: 'Pretendard',
                    fontSize: 16.sp,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    height: 1.12.sp,
                  ),
                ),
                SizedBox(height: 8.h),
                RoundedTextField(
                  height: 50.h,
                  textEditController: nameController,
                  leftBottomCornerRadius: 8.r,
                  rightBottomCornerRadius: 8.r,
                  leftTopCornerRadius: 8.r,
                  rightTopCornerRadius: 8.r,
                  borderColor:
                      isValid(state, FieldType.USERNAME) ? const Color(0xffDBDBDB) : Colors.red,
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
                      fontSize: 14.sp, fontFamily: 'Pretendard-Regular'),
                ),
                SizedBox(height: 16.h),
                // 전화번호 필드
                Text(
                  '전화번호',
                  style: TextStyle(
                    color: const Color(0xff000000),
                    fontFamily: 'Pretendard',
                    fontSize: 16.sp,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    height: 1.12.sp,
                  ),
                ),
                SizedBox(height: 8.h),
                RoundedTextField(
                  height: 50.h,
                  textEditController: phonenumberController,
                  leftBottomCornerRadius: 8.r,
                  rightBottomCornerRadius: 8.r,
                  leftTopCornerRadius: 8.r,
                  rightTopCornerRadius: 8.r,
                  borderColor: isValid(state, FieldType.PHONE_NUMBER)
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
                      fontSize: 14.sp, fontFamily: 'Pretendard-Regular'),
                ),
                SizedBox(height: 16.h),
                // 학번 필드
                Text(
                  '학번',
                  style: TextStyle(
                    color: const Color(0xff000000),
                    fontFamily: 'Pretendard',
                    fontSize: 16.sp,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    height: 1.12.sp,
                  ),
                ),
                SizedBox(height: 8.h),
                RoundedTextField(
                  height: 50.h,
                  textEditController: studentnumberController,
                  leftBottomCornerRadius: 8.r,
                  rightBottomCornerRadius: 8.r,
                  leftTopCornerRadius: 8.r,
                  rightTopCornerRadius: 8.r,
                  borderColor: isValid(state, FieldType.STUDENT_NUMBER)
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
                      fontSize: 14.sp, fontFamily: 'Pretendard-Regular'),
                ),
                SizedBox(height: 16.h),
                // 학과 필드
                Text(
                  '학과',
                  style: TextStyle(
                    color: const Color(0xff000000),
                    fontFamily: 'Pretendard',
                    fontSize: 16.sp,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    height: 1.12.sp,
                  ),
                ),
                SizedBox(height: 8.h),
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
                          logger.d('@@ ${this.college} ${this.major}');
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
                      fontSize: 14.sp, fontFamily: 'Pretendard-Regular'),
                ),
                SizedBox(height: 48.h),
                SizedBox(
                  width: double.infinity,
                  height: 56.h,
                  child: OutlinedButton(
                      onPressed: () async {
                        final name = nameController.text.trim();
                        final studentNumber =
                            studentnumberController.text.trim();
                        final userHp = phonenumberController.text.trim();

                        logger.d(major);

                        await ref
                            .read(updateProfileViewModelProvider.notifier)
                            .updateProfile(
                              userName: name,
                              studentNumber: studentNumber,
                              userHp: userHp,
                              major: major ?? "",
                            );
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: const Color(0xFF000000),
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
                          text: '수정 완료',
                          fontSize: 18.sp,
                          color: const Color(0xFFFFFFFF),
                          fontweight: FontWeight.w600)),
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  width: double.infinity,
                  height: 56.h,
                  child: OutlinedButton(
                      onPressed: () {
                        context.go('/update_profile/delete_user');
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 255, 69, 69),
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
                          text: '회원탈퇴',
                          fontSize: 18.sp,
                          color: const Color(0xFFFFFFFF),
                          fontweight: FontWeight.w600)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool isValid(AsyncValue<ProfileModel> state, FieldType fieldType) {
    final error = state.error as ProfileModelError?;
    return ErrorUtil.instance.isValid(error?.code, fieldType);
  }

  void bind(ProfileModel profile) {
    nameController.text = profile.data.userName;
    phonenumberController.text = profile.data.userHp;
    studentnumberController.text = profile.data.studentNumber;

    setState(() {
      major = profile.data.major;
      college = majors.findCollegeByMajor(major);
    });
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
