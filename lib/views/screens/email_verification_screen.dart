import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:usw_circle_link/models/email_verification_model.dart';
import 'package:usw_circle_link/utils/dialog_manager.dart';
import 'package:usw_circle_link/utils/error_util.dart';
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
      next.when(
          data: (data) {
            switch (data?.type) {
              case EmailVerificationModelType.sendMail:
                logger.d('이메일 보내기 성공!');
                DialogManager.instance.showAlertDialog(
                  context: context,
                  content: "인증 메일이 전송되었습니다!",
                );
                break;
              case EmailVerificationModelType.completeSignUp:
                logger.d('회원가입 완료!');
                context.go('/login');
                break;
              default:
            }
          },
          error: (error, stackTrace) {
            error = error as EmailVerificationModelError;
            switch (error.type) {
              case EmailVerificationModelType.completeSignUp:
                switch (error.code) {
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
          },
          loading: () {});
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
                                borderSide:
                                    BorderSide(color: Color(0xFFFFB052)),
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
                          height: 20.h,
                        ),
                        if (state.hasError)
                          TextFontWidget.fontRegular(
                            '* ${ErrorUtil.instance.getErrorMessage((state.error as EmailVerificationModelError).code) ?? "이메일을 보내는 데 실패했습니다\n잠시후 다시 시도해주세요!"}',
                            fontSize: 12.sp,
                            color: const Color(0xFFFF5353),
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
                            onPressed: state.when<VoidCallback?>(
                                data: (data) => () {
                                      switch (data?.type) {
                                        case EmailVerificationModelType
                                              .sendMail:
                                          final encodedUrl = Uri.encodeComponent(
                                              'https://mail.suwon.ac.kr:10443/m/index.jsp');

                                          context.push(
                                              '/login/sign_up_option/sign_up/email_verification/webview/$encodedUrl');
                                          break;
                                        case EmailVerificationModelType
                                              .completeSignUp:
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
                                      case EmailVerificationModelType.sendMail:
                                        return '포털로 이동하기';
                                      case EmailVerificationModelType
                                            .completeSignUp:
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
              if (state.hasValue && state.value != null)
                TextButton(
                  onPressed: () => context.go('/login'),
                  child: TextFontWidget.fontRegular(
                    '로그인 하러가기',
                    fontSize: 12.sp,
                    color: const Color(0xFF676767),
                    fontWeight: FontWeight.w700,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void sendMail() {
    ref.read(emailVerificationViewModelProvider.notifier).sendMail(
        account: widget.account,
        password: widget.password,
        userName: widget.userName,
        telephone: widget.telephone,
        studentNumber: widget.studentNumber,
        major: widget.major,
        email: emailEditController.text.trim());
  }

  @override
  void dispose() {
    emailEditController.dispose();
    super.dispose();
  }
}
