import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:usw_circle_link/notifier/timer_notifier.dart';
import 'package:usw_circle_link/utils/dialog_manager.dart';
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
    final isLoading = ref
        .watch(deleteUserViewModelProvider.select((state) => state.isLoading));
    final isSendCodeSuccess = ref.watch(
        deleteUserViewModelProvider.select((state) => state.isSendCodeSuccess));
    final isVerifyCodeSuccess = ref.watch(deleteUserViewModelProvider
        .select((state) => state.isVerifyCodeSuccess));
    final error =
        ref.watch(deleteUserViewModelProvider.select((state) => state.error));
    final isCodeError = ref.watch(
        deleteUserViewModelProvider.select((state) => state.isCodeError));

    final _ = ref.watch(timerProvider);
    final timerNotifier = ref.watch(timerProvider.notifier);

    _listen();

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
                          onPressed: isLoading
                              ? null
                              : isVerifyCodeSuccess
                                  ? null
                                  : isSendCodeSuccess
                                      ? () {
                                          final encodedUrl = Uri.encodeComponent(
                                              'https://mail.suwon.ac.kr:10443/m/index.jsp');

                                          context.push('/webview/$encodedUrl');
                                        }
                                      : sendMail,
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
                            isLoading
                                ? '로딩 중 ...'
                                : isVerifyCodeSuccess
                                    ? '포털로 이동하기 ${timerNotifier.timerText}'
                                    : isSendCodeSuccess
                                        ? '포털로 이동하기 ${timerNotifier.timerText}'
                                        : '이메일 전송',
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
                        height: 10.h,
                      ),
                      if (error != null && !isCodeError) ...[
                        TextFontWidget.fontRegular(
                          '* $error',
                          fontSize: 12.sp,
                          color: const Color(0xFFFF3F3F),
                        ),
                      ],
                      SizedBox(
                        height: 10.h,
                      ),
                      if (isSendCodeSuccess) ...[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextFontWidget.fontRegular(
                              '메일을 받지 못하셨나요?',
                              fontSize: 12.sp,
                              color: const Color(0xFF989898),
                              fontWeight: FontWeight.w400,
                              textDecoration: TextDecoration.underline,
                              decorationColor: Color(0xFF989898),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                minimumSize: Size.zero,
                                padding: EdgeInsets.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              onPressed: sendMail,
                              child: TextFontWidget.fontRegular(
                                '재전송',
                                fontSize: 12.sp,
                                color: const Color(0xFF2F8ADF),
                                fontWeight: FontWeight.w400,
                                textDecoration: TextDecoration.underline,
                                decorationColor: Color(0xFF2F8ADF),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
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
                          onChanged: (value) {
                            ref
                                .read(deleteUserViewModelProvider.notifier)
                                .setCode(value);
                          },
                          borderColor:
                              isCodeError ? const Color(0xFFFF3F3F) : null,
                          isAnimatedHint: false,
                          paddingLeft: 0.w,
                          paddingRight: 6.w,
                          suffixIcon: SizedBox(
                            width: 83.w,
                            child: OutlinedButton(
                              onPressed: isLoading
                                  ? null
                                  : () async {
                                      bool cancel = true;
                                      await DialogManager.instance
                                          .showAlertDialog(
                                              context: context,
                                              title: '주의!',
                                              content:
                                                  '회원 탈퇴를 하시겠습니까?\n탈퇴 후 복구할 수 없습니다.',
                                              leftButtonText: '취소',
                                              rightButtonText: '탈퇴',
                                              onRightButtonPressed: () {
                                                cancel = false;
                                              },
                                              rightButtonTextStyle:
                                                  TextFontWidget
                                                      .fontRegularStyle(
                                                fontSize: 18.sp,
                                                color: const Color(0xFFFF3B30),
                                                fontWeight: FontWeight.w800,
                                              ));

                                      if (!cancel) {
                                        await ref
                                            .read(deleteUserViewModelProvider
                                                .notifier)
                                            .verifyCode();
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
                                padding: EdgeInsets.only(
                                  left: 12.w,
                                  right: 12.w,
                                  top: 6.h,
                                  bottom: 6.h,
                                ),
                              ),
                              child: TextFontWidget.fontRegular(
                                isLoading ? '로딩중' : '확인',
                                fontSize: 14.sp,
                                color: Color(0xFFFFFFFF),
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          hintStyle: TextFontWidget.fontRegularStyle(
                            fontSize: 14.sp,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        if (error != null && isCodeError) ...[
                          TextFontWidget.fontRegular(
                            "* $error",
                            fontSize: 11.sp,
                            color: const Color(0xFFFF3F3F),
                          ),
                        ]
                      ]
                    ],
                  ),
                ),
              ),
            ));
  }

  Future<void> sendMail() async {
    await ref.read(deleteUserViewModelProvider.notifier).sendCode();
    ref.read(timerProvider.notifier).startTimer();
  }

  void _listen() {
    ref.listen(
        deleteUserViewModelProvider.select((state) => state.isSendCodeSuccess),
        (previous, next) {
      if (next) {
        DialogManager.instance.showAlertDialog(
          context: context,
          content: "인증 코드가 전송되었습니다.\n인증을 완료해주세요.",
        );
      }
    });

    ref.listen(
        deleteUserViewModelProvider
            .select((state) => state.isVerifyCodeSuccess), (previous, next) {
      if (next) {
        DialogManager.instance.showAlertDialog(
          context: context,
          content: "회원 탈퇴가 완료되었습니다.",
          onLeftButtonPressed: () => context.go('/'),
        );
      }
    });
  }
}
