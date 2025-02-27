import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:usw_circle_link/models/delete_user_model.dart';
import 'package:usw_circle_link/utils/dialog_manager.dart';
import 'package:usw_circle_link/utils/error_util.dart';
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
      next.when(
          data: (data) {
            switch (data?.type) {
              case DeleteUserModelType.sendCode:
                DialogManager.instance.showAlertDialog(
                  context: context,
                  content: "인증 코드가 전송되었습니다.\n5분 안에 인증을 완료해주세요.",
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
          },
          error: (e, stackTrace) {
            final error = e as DeleteUserModelError;
            switch (error.type) {
              case DeleteUserModelType.sendCode:
                DialogManager.instance.showAlertDialog(
                  context: context,
                  content: ErrorUtil.instance.getErrorMessage(error.code) ??
                      "인증 메일을 전송하는 데 문제가 발생했습니다!",
                );
                break;
              case DeleteUserModelType.verifyCode:
                DialogManager.instance.showAlertDialog(
                  context: context,
                  content: ErrorUtil.instance.getErrorMessage(error.code) ??
                      "인증 코드를 확인하는 데 문제가 발생했습니다!",
                );
                break;
              default:
            }
          },
          loading: () {});
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
                          onPressed: state.when<VoidCallback?>(
                              data: (data) => () {
                                    switch (data?.type) {
                                      case DeleteUserModelType.sendCode:
                                        final encodedUrl = Uri.encodeComponent(
                                            'https://mail.suwon.ac.kr:10443/m/index.jsp');

                                        context.push(
                                            '/update_profile/delete_user/webview/$encodedUrl');
                                        break;
                                      case DeleteUserModelType.verifyCode:
                                        break;
                                      default: // null
                                        sendMail();
                                    }
                                  },
                              error: (_, __) => sendMail,
                              loading: () => null),
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
                            state.when<String>(
                                data: (data) {
                                  switch (data?.type) {
                                    case DeleteUserModelType.sendCode:
                                      return '포털로 이동하기';
                                    case DeleteUserModelType.verifyCode:
                                      return '회원가입 완료';
                                    default:
                                      return '이메일 전송';
                                  }
                                },
                                error: (_, __) => '이메일 전송',
                                loading: () => '로딩 중 ...'),
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
                        height: 20.h,
                      ),
                      if (state.hasValue && state.value != null)
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
                      if (state.hasValue && state.value != null) ...[
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
                          borderColor: state.hasError &&
                                  !ErrorUtil.instance.isValid(
                                      (state.error as DeleteUserModelError)
                                          .code,
                                      FieldType.code)
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

  void sendMail() {
    ref.read(deleteUserViewModelProvider.notifier).sendCode();
  }
}
