import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:usw_circle_link/models/ChangePWModel.dart';
import 'package:usw_circle_link/viewmodels/ChangePWViewModel.dart';
import 'package:usw_circle_link/views/widgets/RoundedTextField.dart';
import 'package:usw_circle_link/views/widgets/TextFontWidget.dart';

class ChangePWScreen extends ConsumerStatefulWidget {
  const ChangePWScreen({Key? key}) : super(key: key);

  @override
  _ChangePWScreenState createState() => _ChangePWScreenState();
}

class _ChangePWScreenState extends ConsumerState<ChangePWScreen> {
  TextEditingController currentPWController = TextEditingController();
  TextEditingController newPWController = TextEditingController();
  TextEditingController newPWConfirmController = TextEditingController();

  bool currentPWVisible = false;
  bool newPWVisible = false;
  bool newPWConfirmVisible = false;

  String errorMessage = "";
  bool errorMessageVisivility = false;

  final RegExp passwordRegExp =
      RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,20}$');

  bool currentPWIsInvalid = false; // 서버로부터 유효값 체크
  bool newPWIsInvalid = false; // 로컬에서 정규식 체크
  bool newPWConfirmIsInvalid = false; // 로컬에서 체크

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(changePWViewModelProvider);
    ref.listen<ChangePWModelBase?>(changePWViewModelProvider,
        (ChangePWModelBase? previous, ChangePWModelBase? next) {
      log('상태변경 - $next');
    });
    
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                titleSpacing: 0.0,
                title: Padding(
                  // TODO : icon padding 문제
                  padding: EdgeInsets.only(left: 22.w, right: 22.w),
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
                      TextFontWidget.fontRegular(
                          text: '비밀번호 변경',
                          fontSize: 18.sp,
                          color: Color(0xFF111111),
                          fontweight: FontWeight.w600),
                      SizedBox(width: 52.w, height: 52.h)
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
                      RoundedTextField(
                        height: 50.h,
                        textEditController: currentPWController,
                        leftBottomCornerRadius: 0.r,
                        rightBottomCornerRadius: 0.r,
                        leftTopCornerRadius: 8.r,
                        rightTopCornerRadius: 8.r,
                        borderColor:
                            currentPWIsInvalid ? const Color(0xFFFF3F3F) : null,
                        borderWidth: 1.w,
                        maxLines: 1,
                        textInputType: TextInputType.text,
                        obscureText: !currentPWVisible,
                        textInputAction: TextInputAction.next,
                        textAlign: TextAlign.left,
                        hintText: '현재 비밀번호',
                        isAnimatedHint: false,
                        prefixIcon: SvgPicture.asset(
                          'assets/images/ic_password.svg',
                          width: 13.w,
                          height: 16.h,
                          fit: BoxFit.scaleDown,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              currentPWVisible = !currentPWVisible;
                            });
                          },
                          icon: SvgPicture.asset(
                            currentPWVisible
                                ? 'assets/images/ic_eye_open.svg'
                                : 'assets/images/ic_eye_slash.svg',
                            width: 25.w,
                            height: 25.h,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        hintStyle: TextStyle(
                            fontSize: 14.sp, fontFamily: 'Pretendard-Regular'),
                      ),
                      RoundedTextField(
                        height: 50.h,
                        textEditController: newPWController,
                        leftBottomCornerRadius: 0.r,
                        rightBottomCornerRadius: 0.r,
                        leftTopCornerRadius: 0.r,
                        rightTopCornerRadius: 0.r,
                        borderColor:
                            newPWIsInvalid ? const Color(0xFFFF3F3F) : null,
                        borderWidth: 1.w,
                        maxLines: 1,
                        textInputType: TextInputType.text,
                        obscureText: !newPWVisible,
                        textInputAction: TextInputAction.next,
                        textAlign: TextAlign.left,
                        hintText: '새 비밀번호 (문자, 숫자 포함 6~20자)',
                        isAnimatedHint: false,
                        prefixIcon: SvgPicture.asset(
                          'assets/images/ic_password.svg',
                          width: 13.w,
                          height: 16.h,
                          fit: BoxFit.scaleDown,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              newPWVisible = !newPWVisible;
                            });
                          },
                          icon: SvgPicture.asset(
                            newPWVisible
                                ? 'assets/images/ic_eye_open.svg'
                                : 'assets/images/ic_eye_slash.svg',
                            width: 25.w,
                            height: 25.h,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        hintStyle: TextStyle(
                            fontSize: 14.sp, fontFamily: 'Pretendard-Regular'),
                      ),
                      RoundedTextField(
                        height: 50.h,
                        textEditController: newPWConfirmController,
                        leftBottomCornerRadius: 8.r,
                        rightBottomCornerRadius: 8.r,
                        leftTopCornerRadius: 0.r,
                        rightTopCornerRadius: 0.r,
                        borderColor: newPWConfirmIsInvalid
                            ? const Color(0xFFFF3F3F)
                            : null,
                        borderWidth: 1.w,
                        maxLines: 1,
                        textInputType: TextInputType.text,
                        obscureText: !newPWConfirmVisible,
                        textInputAction: TextInputAction.next,
                        textAlign: TextAlign.left,
                        hintText: '비밀번호 확인',
                        isAnimatedHint: false,
                        prefixIcon: SvgPicture.asset(
                          'assets/images/ic_password.svg',
                          width: 13.w,
                          height: 16.h,
                          fit: BoxFit.scaleDown,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              newPWConfirmVisible = !newPWConfirmVisible;
                            });
                          },
                          icon: SvgPicture.asset(
                            newPWConfirmVisible
                                ? 'assets/images/ic_eye_open.svg'
                                : 'assets/images/ic_eye_slash.svg',
                            width: 25.w,
                            height: 25.h,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        hintStyle: TextStyle(
                            fontSize: 14.sp, fontFamily: 'Pretendard-Regular'),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Visibility(
                          visible: errorMessageVisivility,
                          child: TextFontWidget.fontRegular(
                              text: errorMessage,
                              fontSize: 12.sp,
                              color: const Color(0xFFFF3F3F),
                              fontweight: FontWeight.w400)),
                      SizedBox(
                        height: 15.h,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 56.h,
                        child: OutlinedButton(
                            onPressed: () async {
                              // 공백이 아닌지 확인
                              // 비밀번호 규칙 체크
                              final currentPW = currentPWController.text;
                              final newPW = newPWController.text;
                              final newPWConfirm = newPWConfirmController.text;
                              setState(() {
                                currentPWIsInvalid = currentPW.isEmpty;
                                newPWIsInvalid = !passwordRegExp.hasMatch(newPW);
                                newPWConfirmIsInvalid = newPW != newPWConfirm;

                                errorMessageVisivility = currentPWIsInvalid ||
                                    newPWIsInvalid ||
                                    newPWConfirmIsInvalid;

                                errorMessage = "";
                                if (currentPWIsInvalid) {
                                  errorMessage += "* 현재 비밀번호를 입력해주세요!\n";
                                } 
                                if (newPWIsInvalid) {
                                  errorMessage +=
                                      "* 비밀번호는 문자, 숫자를 포함한 6~20 이내로 작성해주세요!\n";
                                }
                                if (newPWConfirmIsInvalid) {
                                  errorMessage += "* 비밀번호가 일치하지 않습니다!";
                                }
                              });

                              if (!errorMessageVisivility) {
                                final result = await ref
                                    .read(changePWViewModelProvider.notifier)
                                    .changePW(
                                        userPw: currentPW,
                                        newPw: newPW,
                                        confirmNewPw: newPWConfirm);
                                if (result is ChangePWModel) { // 비밀번호 변경 완료
                                  if (context.mounted){ // 비동기에서 context 처리 시 
                                    context.go('/');
                                  } else {
                                    log('Not Mounted!');
                                  }
                                } else if (result is ChangePWModelError) { // 비밀번호 변경 에러
                                  log("예외발생 - ${result.message}");
                                  setState(() {
                                    switch (result.code) {
                                      case "USR-204": // 현재 비밀번호 불일치
                                        currentPWIsInvalid = true;
                                        errorMessage = "현재 비밀번호가 일치하지 않습니다";
                                        errorMessageVisivility = true;                                        
                                        break;
                                      case "USR-202": // 새 비밀번호 확인 불일치
                                        break;
                                      case "USR-203": // 새 비밀번호 빈칸
                                        break;
                                    }
                                  });
                                }
                              }
                            },
                            style: OutlinedButton.styleFrom(
                              backgroundColor: const Color(0xFF000000),
                              side: const BorderSide(
                                width: 0.0,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            child: TextFontWidget.fontRegular(
                                text: '비밀번호 변경 완료',
                                fontSize: 18.sp,
                                color: const Color(0xFFFFFFFF),
                                fontweight: FontWeight.w600)),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
