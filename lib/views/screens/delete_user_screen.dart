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

  bool isEmailSent = false; // 상태를 관리하기 위한 변수 추가

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(deleteUserViewModelProvider);
    ref.listen(deleteUserViewModelProvider, (previous, next) {
      logger.d(next);
      if (next is DeleteUserModel) {
        switch (next.type) {
          case DeleteUserModelType.sendCode:
            setState(() {
              isEmailSent = true; // 이메일 전송 후 상태 변경
            });
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
        // 오류 처리 코드 (생략)
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
                      if (!isEmailSent) ...[
                        // 이메일 전송 전에는 이메일 전송 버튼만 표시
                        SizedBox(
                          width: double.infinity,
                          height: 56.h,
                          child: OutlinedButton(
                            onPressed: state is DeleteUserModelLoading
                                ? null
                                : () async {
                                    setState(() {
                                      isEmailSent = true; // 이메일 전송 후 상태 변경
                                    });
                                    ref
                                        .read(deleteUserViewModelProvider
                                            .notifier)
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
                              '이메일 전송',
                              fontSize: 18.sp,
                              color: const Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ), // 이메일 전송 전 RichText 표시
                        SizedBox(
                          height: 16.h,
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "* 가입하신 포털 메일로 ",
                            style: TextStyle(
                                fontFamily: 'SUIT',
                                fontSize: 12.sp,
                                color: const Color(0xFF6F6F6F),
                                fontWeight: FontWeight.w400),
                            children: const [
                              TextSpan(
                                text: "인증코드",
                                style: TextStyle(
                                  color: Color(0xffffB052),
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              TextSpan(
                                text: '를 전송합니다',
                              ),
                            ],
                          ),
                        ),
                      ],
                      if (isEmailSent) ...[
                        // 이메일 전송 후 표시될 위젯들
                        SizedBox(
                          width: double.infinity,
                          height: 56.h,
                          child: OutlinedButton(
                            onPressed: () {
                              final encodedUrl = Uri.encodeComponent(
                                  'https://mail.suwon.ac.kr:10443/m/index.jsp');
                              context
                                  .push('/login/find_pw/webview/$encodedUrl');
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
                          height: 16.h,
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "* 가입하신 포털 메일로 ",
                            style: TextStyle(
                                fontFamily: 'SUIT',
                                fontSize: 12.sp,
                                color: const Color(0xFF6F6F6F),
                                fontWeight: FontWeight.w400),
                            children: const [
                              TextSpan(
                                text: "인증코드",
                                style: TextStyle(
                                  color: Color(0xffffB052),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: state is DeleteUserModelLoading
                                  ? null
                                  : () async {
                                      // 재전송 버튼을 눌렀을 때 sendCode()를 호출하여 백엔드로 재요청
                                      await ref
                                          .read(deleteUserViewModelProvider
                                              .notifier)
                                          .sendCode();
                                    },
                              style: TextButton.styleFrom(
                                splashFactory:
                                    NoSplash.splashFactory, // 리플 효과 제거
                              ),
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  text: "메일을 받지 못하셨나요? ",
                                  style: TextStyle(
                                    fontFamily: 'SUIT',
                                    fontSize: 12.sp,
                                    decoration: TextDecoration.underline,
                                    color: const Color(0xFF434343),
                                    fontWeight: FontWeight.w400,
                                  ),
                                  children: const [
                                    TextSpan(
                                      text: "재전송",
                                      style: TextStyle(
                                        color: Color(0xff2F8ADF),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
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
                                top: 6.h, bottom: 6.h, right: 8.w),
                            width: 83.w,
                            child: OutlinedButton(
                              onPressed: () async {
                                bool cancel = true;
                                await DialogManager.instance.showAlertDialog(
                                    context: context,
                                    title: '주의!',
                                    content: '회원 탈퇴를 하시겠습니까?\n탈퇴 후 복구할 수 없습니다.',
                                    leftButtonText: '취소',
                                    rightButtonText: '탈퇴',
                                    onRightButtonPressed: () {
                                      cancel = false;
                                    });
                                if (!cancel) {
                                  final code = codeEditController.text.trim();
                                  await ref
                                      .read(
                                          deleteUserViewModelProvider.notifier)
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
                                  borderRadius: BorderRadius.circular(16.r),
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
                      ]
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
