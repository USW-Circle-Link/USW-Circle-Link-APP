import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:usw_circle_link/utils/dialog_manager.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';
import 'package:usw_circle_link/viewmodels/email_verification_view_model.dart';
import 'package:usw_circle_link/views/widgets/email_text_field_with_button.dart';
import 'package:usw_circle_link/views/widgets/text_font_widget.dart';

class EmailVerificationScreen extends ConsumerStatefulWidget {
  const EmailVerificationScreen({
    Key? key,
  }) : super(key: key);

  @override
  _EmailVerificationScreenState createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState
    extends ConsumerState<EmailVerificationScreen> {
  final TextEditingController emailEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(
        emailVerificationViewModelProvider.select((value) => value.isLoading));
    final isSendMailSuccess = ref.watch(emailVerificationViewModelProvider
        .select((value) => value.isSendMailSuccess));
    final isVerifySuccess = ref.watch(emailVerificationViewModelProvider
        .select((value) => value.isVerifySuccess));
    final error = ref.watch(
        emailVerificationViewModelProvider.select((value) => value.error));
    final emailTokenUUID = ref.watch(emailVerificationViewModelProvider
        .select((value) => value.emailTokenUUID));
    final signupUUID = ref.watch(
        emailVerificationViewModelProvider.select((value) => value.signupUUID));
    final email = ref.watch(
        emailVerificationViewModelProvider.select((value) => value.email));

    _listener();

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
                  '신규 회원 가입',
                  fontSize: 18.sp,
                  color: Color(0xFF111111),
                  fontWeight: FontWeight.w800,
                ),
                SizedBox(width: 52.w, height: 52.h)
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(top: 30.h),
                    padding: EdgeInsets.only(left: 32.w, right: 32.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 32.h,
                        ),
                        EmailTextFieldWithButton(
                          controller: emailEditController,
                          enabled: !isVerifySuccess,
                          onChanged: (value) {
                            ref
                                .read(
                                    emailVerificationViewModelProvider.notifier)
                                .setEmail(value.trim());
                          },
                          onPressed: isSendMailSuccess
                              ? () {
                                  ref
                                      .read(emailVerificationViewModelProvider
                                          .notifier)
                                      .verifyEmailVerification();
                                }
                              : null,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        if (error != null)
                          TextFontWidget.fontRegular(
                            '* $error',
                            fontSize: 12.sp,
                            color: const Color(0xFFFF5353),
                            fontWeight: FontWeight.w400,
                          ),
                        if (isVerifySuccess)
                          TextFontWidget.fontRegular(
                            '이메일 인증이 완료되었습니다.\n다음을 눌러 회원가입을 진행해주세요.',
                            fontSize: 12.sp,
                            color: const Color(0xFF989898),
                            fontWeight: FontWeight.w400,
                          ),
                        SizedBox(
                          height: 20.h,
                        ),
                        RichText(
                          textAlign: TextAlign.start,
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
                        SizedBox(
                          height: 12.h,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 56.h,
                          child: OutlinedButton(
                            onPressed: isLoading
                                ? null
                                : isVerifySuccess
                                    ? () {
                                        context.go(
                                            '/login/sign_up_option/policy_agree/email_verification/sign_up?newMember=true&emailTokenUUID=$emailTokenUUID&signupUUID=$signupUUID');
                                      }
                                    : isSendMailSuccess
                                        ? () {
                                            final encodedUrl = Uri.encodeComponent(
                                                'https://mail.suwon.ac.kr:10443/m/index.jsp');

                                            context
                                                .push('/webview/$encodedUrl');
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
                                  : isVerifySuccess
                                      ? '다음'
                                      : isSendMailSuccess
                                          ? '포털로 이동하기'
                                          : '이메일 전송',
                              fontSize: 18.sp,
                              color: const Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        if (isSendMailSuccess && !isVerifySuccess)
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
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
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
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void sendMail() {
    ref.read(emailVerificationViewModelProvider.notifier).sendMail();
  }

  @override
  void dispose() {
    emailEditController.dispose();
    super.dispose();
  }

  void _listener() {
    ref.listen(
        emailVerificationViewModelProvider
            .select((value) => value.isSendMailSuccess), (_, next) {
      if (next) {
        logger.d('이메일 보내기 성공!');
        DialogManager.instance.showAlertDialog(
          context: context,
          content: "인증 메일이 전송되었습니다.\n5분 안에 인증을 완료해주세요.",
        );
      }
    });

    ref.listen(
        emailVerificationViewModelProvider
            .select((value) => value.isVerifySuccess), (_, next) {
      if (next) {
        final emailTokenUUID = ref.read(emailVerificationViewModelProvider
            .select((value) => value.emailTokenUUID));
        final signupUUID = ref.read(emailVerificationViewModelProvider
            .select((value) => value.signupUUID));
        logger.d('이메일 인증 성공! - $emailTokenUUID, $signupUUID');
      }
    });
  }
}
