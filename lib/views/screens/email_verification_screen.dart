import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:usw_circle_link/models/email_verification_model.dart';
import 'package:usw_circle_link/utils/dialog_manager.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';
import 'package:usw_circle_link/viewmodels/email_verification_view_model.dart';
import 'package:usw_circle_link/views/widgets/text_font_widget.dart';

class EmailVerificationScreen extends ConsumerStatefulWidget {
  const EmailVerificationScreen({
    Key? key,
    required this.account,
    required this.password,
    required this.userName,
    required this.telephone,
    required this.studentNumber,
    required this.major,
  }) : super(key: key);

  final String account;
  final String password;
  final String userName;
  final String telephone;
  final String studentNumber;
  final String major;

  @override
  _EmailVerificationScreenState createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState
    extends ConsumerState<EmailVerificationScreen> {
  final TextEditingController emailEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(emailVerificationViewModelProvider);
    ref.listen(emailVerificationViewModelProvider, (previous, next) {
      logger.d(next);
      if (next is EmailVerificationModel) {
        logger.d('이메일 보내기 성공!');
        DialogManager.instance.showAlertDialog(
          context: context,
          content: "인증 메일이 전송되었습니다!",
        );
      } else if (next is EmailVerificationModelResend) {
        logger.d('이메일 재전송 성공!');
        DialogManager.instance.showAlertDialog(
          context: context,
          content: "인증 메일이 재전송되었습니다!",
        );
      } else if (next is EmailVerificationModelComplete) {
        logger.d('이메일 인증 후 회원가입 성공!');
        context.go('/login');
      } else if (next is EmailVerificationModelError) {
        switch (next.type) {
          case EmailVerificationModelType.sendMail:
            switch (next.code) {
              case "USR-206":
                DialogManager.instance.showAlertDialog(
                  context: context,
                  content: '이미 가입된 포털 이메일입니다!',
                );
                break;
              case "ATTEMPT-503":
                DialogManager.instance.showAlertDialog(
                  context: context,
                  content: '최대 시도 횟수를 초과했습니다!\n1분후 다시 시도해주세요!',
                );
                break;
              case "EML-F100":
                DialogManager.instance.showAlertDialog(
                  context: context,
                  content: "이메일을 입력해주세요!",
                );
                break;
              default: // EML-501
                DialogManager.instance.showAlertDialog(
                  context: context,
                  content: "이메일을 보내는 데 실패했습니다\n잠시후 다시 시도해주세요!",
                );
                logger.e('예외발생 - $next');
                break;
            }
            break;
          case EmailVerificationModelType.resendMail:
            switch (next.code) {
              case "EMAIL_TOKEN-001":
                DialogManager.instance.showAlertDialog(
                  context: context,
                  content: "이메일을 보내는 데 실패했습니다\n잠시후 다시 시도해주세요!",
                );
                break;
              case "ATTEMPT-503":
                DialogManager.instance.showAlertDialog(
                  context: context,
                  content: '최대 시도 횟수를 초과했습니다!\n1분후 다시 시도해주세요!',
                );
                break;
              default: // EML-501
                logger.e('예외발생 - $next');
                break;
            }
            break;
          case EmailVerificationModelType.completeSignUp:
            switch (next.code) {
              case "USR-208": // 존재하지 않는 계정
                DialogManager.instance.showAlertDialog(
                  context: context,
                  content: "회원가입을 완료하는 데 실패했습니다\n잠시후 다시 시도해주세요!",
                );
                break;
              default:
                logger.e('예외발생 - $next');
                break;
            }
            break;
          default:
            logger.e('예외발생 - $next');
        }
      }
    });

    emailEditController.addListener(
      () {
        ref.read(emailVerificationViewModelProvider.notifier).initState();
      },
    );
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => Scaffold(
              appBar: AppBar(
                scrolledUnderElevation: 0,
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
                        '회원가입',
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
                  margin: EdgeInsets.only(top: 60.h),
                  padding: EdgeInsets.only(left: 32.w, right: 32.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 32.h,
                      ),
                      SizedBox(
                        height: 46.h,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          controller: emailEditController,
                          keyboardType: TextInputType.text,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            hintText: "포털 이메일 입력",
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFFFB052)),
                            ),
                            contentPadding: EdgeInsets.only(left: 8.w),
                            suffixIcon: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextFontWidget.fontRegular(
                                  '@ suwon.ac.kr',
                                  fontSize: 16.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                )
                              ],
                            ),
                          ),
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                      SizedBox(
                        height: 48.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: "* 입력하신 메일로 ",
                              style: TextStyle(
                                fontFamily: 'SUIT',
                                fontSize: 12.sp,
                                color: const Color(0xFF989898),
                                fontWeight: FontWeight.w400,
                              ),
                              children: const [
                                TextSpan(
                                  text: "인증 URL",
                                  style: TextStyle(
                                      color: Color(0xffffB052),
                                      fontWeight: FontWeight.w800),
                                ),
                                TextSpan(
                                  text: '을 전송합니다',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 56.h,
                        child: OutlinedButton(
                          onPressed: state is EmailVerificationModelLoading
                              ? null
                              : () {
                                  ref
                                      .read(emailVerificationViewModelProvider
                                          .notifier)
                                      .sendMail(
                                          account: widget.account,
                                          password: widget.password,
                                          userName: widget.userName,
                                          telephone: widget.telephone,
                                          studentNumber: widget.studentNumber,
                                          major: widget.major,
                                          email:
                                              emailEditController.text.trim());
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
                            '인증메일 전송',
                            fontSize: 18.sp,
                            color: const Color(0xFFFFFFFF),
                            fontWeight: FontWeight.w800,
                          ),
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

                            context.push(
                                '/login/sign_up/email_verification/webview/$encodedUrl');
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
                      SizedBox(
                        width: double.infinity,
                        height: 56.h,
                        child: OutlinedButton(
                          onPressed: state is EmailVerificationModel ||
                                  state is EmailVerificationModelResend
                              ? () async {
                                  await ref
                                      .read(emailVerificationViewModelProvider
                                          .notifier)
                                      .signUp(account: widget.account);
                                }
                              : () async {
                                  await DialogManager.instance.showAlertDialog(
                                      context: context,
                                      content:
                                          '이메일 전송 버튼을 눌러\n이메일 인증을 완료해 주세요!');
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
                            '회원가입 완료',
                            fontSize: 18.sp,
                            color: const Color(0xFFFFFFFF),
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }

  @override
  void dispose() {
    emailEditController.dispose();
    super.dispose();
  }
}
