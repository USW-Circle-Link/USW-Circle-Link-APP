import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:usw_circle_link/models/change_pw_model.dart';
import 'package:usw_circle_link/utils/dialog_manager.dart';
import 'package:usw_circle_link/utils/logger/Logger.dart';
import 'package:usw_circle_link/viewmodels/change_pw_view_model.dart';
import 'package:usw_circle_link/views/widgets/rounded_rext_field.dart';
import 'package:usw_circle_link/views/widgets/text_font_widget.dart';

class ChangePwScreen extends ConsumerStatefulWidget {
  const ChangePwScreen({
    Key? key,
    this.checkCurrentPassword = true,
    this.uuid = "",
  }) : super(key: key);

  final bool checkCurrentPassword;
  final String uuid;

  @override
  _ChangePWScreenState createState() => _ChangePWScreenState();
}

class _ChangePWScreenState extends ConsumerState<ChangePwScreen> {
  TextEditingController currentPWController = TextEditingController();
  TextEditingController newPWController = TextEditingController();
  TextEditingController newPWConfirmController = TextEditingController();

  bool currentPWVisible = false;
  bool newPWVisible = false;
  bool newPWConfirmVisible = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(changePwViewModelProvider);
    ref.listen<ChangePwModelBase?>(changePwViewModelProvider,
        (ChangePwModelBase? previous, ChangePwModelBase? next) {
      logger.d(next);
      if (next is ChangePwModel) {
        // 비밀번호 변경 완료
        switch (next.type) {
          case ChangePwModelType.changePW:
            break;
          case ChangePwModelType.resetPW:
            break;
          default:
            logger.e("예외발생 - $next");
            break;
        }
        DialogManager.instance.showAlertDialog(
          context:context,
          content:'비밀번호가 변경되었습니다',
          onLeftButtonPressed: () {
            context.go('/login');
          },
        );
      } else if (next is ChangePwModelError) {
        // 비밀번호 변경 에러
        switch (next.type) {
          case ChangePwModelType.changePW:
            break;
          case ChangePwModelType.resetPW:
            break;
          default:
            logger.e("예외발생 - $next");
            break;
        }
      }
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
                      widget.checkCurrentPassword
                          ? RoundedTextField(
                              height: 50.h,
                              textEditController: currentPWController,
                              leftBottomCornerRadius: 0.r,
                              rightBottomCornerRadius: 0.r,
                              leftTopCornerRadius: 8.r,
                              rightTopCornerRadius: 8.r,
                              borderColor: currentPWIsInvalid(state)
                                  ? const Color(0xFFFF3F3F)
                                  : null,
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
                                  fontSize: 14.sp,
                                  fontFamily: 'Pretendard-Regular'),
                            )
                          : Container(),
                      RoundedTextField(
                        height: 50.h,
                        textEditController: newPWController,
                        leftBottomCornerRadius: 0.r,
                        rightBottomCornerRadius: 0.r,
                        leftTopCornerRadius:
                            widget.checkCurrentPassword ? 0.r : 8.r,
                        rightTopCornerRadius:
                            widget.checkCurrentPassword ? 0.r : 8.r,
                        borderColor: newPWIsInvalid(state)
                            ? const Color(0xFFFF3F3F)
                            : null,
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
                        borderColor: newPWConfirmIsInvalid(state)
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
                          visible: state is ChangePwModelError,
                          child: TextFontWidget.fontRegular(
                              text: getErrorMessage(state),
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
                            onPressed: state is ChangePwModelLoading
                                ? null
                                : () async {
                                    // 공백이 아닌지 확인
                                    // 비밀번호 규칙 체크
                                    final currentPW =
                                        currentPWController.text.trim();
                                    final newPW = newPWController.text.trim();
                                    final newPWConfirm =
                                        newPWConfirmController.text.trim();
                                    if (widget.checkCurrentPassword) {
                                      await ref
                                          .read(changePwViewModelProvider
                                              .notifier)
                                          .changePW(
                                              userPw: currentPW,
                                              newPw: newPW,
                                              confirmNewPw: newPWConfirm);
                                    } else {
                                      ref
                                          .read(changePwViewModelProvider
                                              .notifier)
                                          .resetPW(
                                            newPw: newPW,
                                            confirmNewPw: newPWConfirm,
                                            uuid: widget.uuid,
                                          );
                                    }
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

  String getErrorMessage(ChangePwModelBase? state) {
    if (state is ChangePwModelError) {
      switch (state.code) {
        // 모바일 에러코드
        case "USR-F900": // 현재 비밀번호 공백
          return "* 현재 비밀번호를 입력해주세요!";
        case "USR-F200":
          return "* 비밀번호는 문자, 숫자를 포함한 6~20 이내로 작성해주세요!";
        case "USR-F300":
          return "* 비밀번호가 일치하지 않습니다!";
        // 서버 에러코드
        case "USR-204": // 현재 비밀번호 불일치
          return "현재 비밀번호가 일치하지 않습니다";
        case "USR-202": // 새 비밀번호 확인 불일치
        case "USR-212": // 새 비밀번호 확인 불일치
          return "* 비밀번호가 일치하지 않습니다!";
        case "USR-203": // 새 비밀번호 빈칸
          return "* 비밀번호는 문자, 숫자를 포함한 6~20 이내로 작성해주세요!";
        case "USR-210": // 해당 정보로 인증 중인 회원존재 X
        default:
          return "* 비밀번호를 변경하는 데 잠시 문제가 생겼습니다. 잠시후에 다시 시도해주세요!";
      }
    }
    return "";
  }

  bool currentPWIsInvalid(ChangePwModelBase? state) {
    if (state is ChangePwModelError) {
      switch (state.code) {
        case "USR-F900":
          return true;
      }
    }
    return false;
  }

  bool newPWIsInvalid(ChangePwModelBase? state) {
    if (state is ChangePwModelError) {
      switch (state.code) {
        case "USR-F200":
          return true;
      }
    }
    return false;
  }

  bool newPWConfirmIsInvalid(ChangePwModelBase? state) {
    if (state is ChangePwModelError) {
      switch (state.code) {
        case "USR-F300":
          return true;
      }
    }
    return false;
  }
}
