import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:usw_circle_link/const/data.dart';
import 'package:usw_circle_link/models/profile_model.dart';
import 'package:usw_circle_link/utils/dialog_manager.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';
import 'package:usw_circle_link/utils/regex/regex.dart';
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

  bool isInitialized = false;

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
    final profileAsyncValue = ref.watch(getProfileProvider);
    final state = ref.watch(updateProfileViewModelProvider);
    ref.listen(updateProfileViewModelProvider, (previous, next) {
      logger.d(next);
      if (next is ProfileModel) {
        switch (next.type) {
          case ProfileModelType.getProfile:
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
      } else if (next is ProfileModelError) {
        switch (next.type) {
          case ProfileModelType.getProfile:
            break;
          case ProfileModelType.updateProfile:
            switch (next.code) {
              case "USR-F400": // 이름 공백
                DialogManager.instance.showAlertDialog(
                  context: context,
                  content: '이름이 형식에 맞지 않습니다!',
                );
                break;
              case "USR-F500": // 전화번호 형식에 맞지 않음
                DialogManager.instance.showAlertDialog(
                  context: context,
                  content: '전화번호가 형식에 맞지 않습니다!',
                );
                break;
              case "USR-F600": // 학번이 공백 혹은 8자리가 아님
                DialogManager.instance.showAlertDialog(
                  context: context,
                  content: '학번이 형식에 맞지 않습니다!',
                );
                break;
              case "USR-F700": // 학과가 선택되지 않음
                DialogManager.instance.showAlertDialog(
                  context: context,
                  content: '단과대학/학과를 선택해주세요!',
                );
                break;
              default:
            }
            break;
          default:
        }
      }
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
        body: profileAsyncValue.when(
          data: (profile) {
            nameController.text = profile.data.userName;
            phonenumberController.text = profile.data.userHp;
            studentnumberController.text = profile.data.studentNumber;
            major = profile.data.major;
            college = majors.findCollegeByMajor(profile.data.major);

            return buildForm(context, state, (college, major) {
              setState(() {
                this.college = college;
                this.major = major;
                logger.d('$college - $major');
              });
            });
          },
          error: (error, stackTrace) {
            return Container();
          },
          loading: () {
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  Widget buildForm(BuildContext context, ProfileModelBase? state,
      void Function(String? college, String? major) onConfirmPressed) {
    return SingleChildScrollView(
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
                  nameIsValid(state) ? const Color(0xffDBDBDB) : Colors.red,
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
              hintStyle:
                  TextStyle(fontSize: 14.sp, fontFamily: 'Pretendard-Regular'),
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
              borderColor: phoneNumberIsValid(state)
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
              hintStyle:
                  TextStyle(fontSize: 14.sp, fontFamily: 'Pretendard-Regular'),
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
              borderColor: studentNumberIsValid(state)
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
              hintStyle:
                  TextStyle(fontSize: 14.sp, fontFamily: 'Pretendard-Regular'),
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
                  onConfirmPressed: onConfirmPressed,
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
              hintStyle:
                  TextStyle(fontSize: 14.sp, fontFamily: 'Pretendard-Regular'),
            ),
            SizedBox(height: 48.h),
            SizedBox(
              width: double.infinity,
              height: 56.h,
              child: OutlinedButton(
                  onPressed: () async {
                    final name = nameController.text.trim();
                    final studentNumber = studentnumberController.text.trim();
                    final userHp = phonenumberController.text.trim();

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
    );
  }

  bool studentNumberIsValid(ProfileModelBase? state) {
    return true;
  }

  bool phoneNumberIsValid(ProfileModelBase? state) {
    return true;
  }

  bool nameIsValid(ProfileModelBase? state) {
    return true;
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
