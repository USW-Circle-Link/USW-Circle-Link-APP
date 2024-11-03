import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:usw_circle_link/models/delete_user_model.dart';
import 'package:usw_circle_link/utils/dialog_manager.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';
import 'package:usw_circle_link/viewmodels/delete_user_view_model.dart';
import 'package:usw_circle_link/views/widgets/rounded_rext_field.dart';
import 'package:usw_circle_link/views/widgets/text_font_widget.dart';

class DeleteUserScreen extends ConsumerStatefulWidget {
  const DeleteUserScreen({Key? key}) : super(key: key);

  @override
  _DeleteUserScreenState createState() => _DeleteUserScreenState();
}

class _DeleteUserScreenState extends ConsumerState<DeleteUserScreen> {
  final TextEditingController codeEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(deleteUserViewModelProvider);
    ref.listen(deleteUserViewModelProvider, (previous, next) {
      logger.d(next);
      if (next is DeleteUserModel) {
        switch (next.type) {
          case DeleteUserModelType.sendCode:
            DialogManager.instance.showAlertDialog(
              context: context,
              content: "인증 메일이 전송되었습니다!",
            );
            break;
          case DeleteUserModelType.verifyCode:
            DialogManager.instance.showAlertDialog(
              context: context,
              content: "회원 탈퇴가 완료되었습니다!",
              onLeftButtonPressed: () => context.go('/'),
            );
            break;
          default:
        }
      } else if (next is DeleteUserModelError) {
        switch (next.type) {
          case DeleteUserModelType.sendCode:
            switch (next.code) {
              case "ATTEMPT-503":
                DialogManager.instance.showAlertDialog(
                  context: context,
                  content: '최대 시도 횟수를 초과했습니다!\n1분후 다시 시도해주세요!',
                );
                break;
              case "EML-501":
              default:
                DialogManager.instance.showAlertDialog(
                  context: context,
                  content: '이메일 전송에 실패했습니다!',
                );
            }
            break;
          case DeleteUserModelType.verifyCode:
            switch (next.code) {
              case "WT-F100":
                DialogManager.instance.showAlertDialog(
                  context: context,
                  content: '인증번호를 입력해주세요!',
                );
                break;
              case "WT-101":
                DialogManager.instance.showAlertDialog(
                  context: context,
                  content: '인증번호가 일치하지 않습니다!',
                );
                break;
              case "WT-102":
              default:
                DialogManager.instance.showAlertDialog(
                  context: context,
                  content: '인증코드 확인에 실패했습니다!\n잠시후 다시 시도해주십시오.',
                );
            }
            break;
          default:
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
                        '회원탈퇴',
                        fontSize: 18.sp,
                        color: Color(0xFF111111),
                        fontWeight: FontWeight.w800,
                      ),
                      SizedBox(width: 52.w, height: 52.h)
                    ],
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(top: 30.h),
                  padding: EdgeInsets.only(left: 32.w, right: 32.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 56.h,
                        child: OutlinedButton(
                          onPressed: state is DeleteUserModelLoading
                              ? null
                              : () async {
                                  ref
                                      .read(
                                          deleteUserViewModelProvider.notifier)
                                      .sendCode();
                                },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: const Color(0xffffB052),
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
                            '인증코드 전송',
                            fontSize: 18.sp,
                            color: const Color(0xFFFFFFFF),
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: "* 가입하신 학교 메일로 ",
                          style: TextStyle(
                              fontFamily: 'SUIT',
                              fontSize: 12.sp,
                              color: const Color(0xFF989898),
                              fontWeight: FontWeight.w400),
                          children: const [
                            TextSpan(
                              text: "인증코드",
                              style: TextStyle(
                                color: Color(0xFF6E6EDE),
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            TextSpan(
                              text: '를 전송합니다',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 56.h,
                        child: OutlinedButton(
                          onPressed: () {
                            final encodedUrl = Uri.encodeComponent(
                                'https://mail.suwon.ac.kr:10443/m/index.jsp');

                            context.push('/login/find_pw/webview/$encodedUrl');
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: const Color(0xffffB052),
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
                            '포털로 이동하기',
                            fontSize: 18.sp,
                            color: const Color(0xFFFFFFFF),
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      RoundedTextField(
                        height: 50.h,
                        textInputAction: TextInputAction.next,
                        textEditController: codeEditController,
                        leftBottomCornerRadius: 8.r,
                        rightBottomCornerRadius: 8.r,
                        leftTopCornerRadius: 8.r,
                        rightTopCornerRadius: 8.r,
                        borderWidth: 1.w,
                        maxLines: 1,
                        textInputType: TextInputType.text,
                        textAlign: TextAlign.left,
                        hintText: '인증코드 4자리 입력',
                        borderColor: codeIsInvalid(state)
                            ? const Color(0xFFFF3F3F)
                            : null,
                        isAnimatedHint: false,
                        suffixIcon: Container(
                          margin: EdgeInsets.only(
                              // top : 4, bottom : 4
                              top: 6.h,
                              bottom: 6.h,
                              right: 8.w),
                          width: 83.w,
                          //height: 38.h, //not working -> margin으로 높이 조절
                          child: OutlinedButton(
                            onPressed: () async {
                              bool cancel = true;
                              await DialogManager.instance.showAlertDialog(
                                  context: context,
                                  title: '주의!',
                                  content: '정말 회원탈퇴하시겠습니까?\n탈퇴 시 계정복구가 불가능합니다!',
                                  leftButtonText: '아니요',
                                  rightButtonText: '예',
                                  onRightButtonPressed: () {
                                    cancel = false;
                                  });
                              if (!cancel) {
                                final code = codeEditController.text.trim();
                                await ref
                                    .read(deleteUserViewModelProvider.notifier)
                                    .verifyCode(
                                      code: code,
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
                                borderRadius:
                                    BorderRadius.circular(16.r), // radius 18
                              ),
                              minimumSize: Size.zero,
                              padding: EdgeInsets.zero,
                            ),
                            child: TextFontWidget.fontRegular(
                              '확인',
                              fontSize: 14.sp,
                              color: Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        hintStyle: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: 'SUIT',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }

  bool codeIsInvalid(DeleteUserModelBase? state) {
    return false;
  }
}
