import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:usw_circle_link/models/EmailVerificationModel.dart';
import 'package:usw_circle_link/utils/logger/Logger.dart';
import 'package:usw_circle_link/viewmodels/EmailVerificationViewModel.dart';
import 'package:usw_circle_link/views/widgets/AlertTextDialog.dart';
import 'package:usw_circle_link/views/widgets/TextFontWidget.dart';

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
  bool hadSent = false;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(emailVerificationViewModelProvider);
    ref.listen(emailVerificationViewModelProvider, (previous, next) {
      logger.d(next);
      if (next is EmailVerificationModel) {
        switch (next.type) {
          case EmailVerificationModelType.sendMail:
            setState(() {
              hadSent = true;
            });
            context.go('/login');
            break;
          case EmailVerificationModelType.resendMail:
            break;
          case EmailVerificationModelType.completeSignUp:
            context.go('/login');
            break;
          default:
            logger.e('예외발생 - $next');
        }
      } else if (next is EmailVerificationModelError) {
        switch (next.type) {
          case EmailVerificationModelType.sendMail:
            showAlertDialog(context, "이메일을 입력해주세요!");
            break;
          case EmailVerificationModelType.resendMail:
            break;
          case EmailVerificationModelType.completeSignUp:
            break;
          default:
            logger.e('예외발생 - $next');
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
                          text: '회원가입',
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
                              borderSide: BorderSide(color: Color(0xFF6E78D8)),
                            ),
                            contentPadding: EdgeInsets.only(left: 8.w),
                            suffixIcon: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextFontWidget.fontRegular(
                                    text: '@ suwon.ac.kr',
                                    fontSize: 16.sp,
                                    color: Colors.black,
                                    fontweight: FontWeight.w400)
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
                                  fontFamily: 'Pretendard-Regular',
                                  fontSize: 12.sp,
                                  color: const Color(0xFF989898),
                                  fontWeight: FontWeight.w400),
                              children: const [
                                TextSpan(
                                  text: "인증 URL",
                                  style: TextStyle(
                                      color: Color(0xFF6E6EDE),
                                      fontWeight: FontWeight.w600),
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
                            onPressed: hadSent
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
                                            email: emailEditController.text
                                                .trim());
                                  },
                            style: OutlinedButton.styleFrom(
                              backgroundColor: const Color(0xFF4F5BD0),
                              side: const BorderSide(
                                width: 0.0,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            child: TextFontWidget.fontRegular(
                                text: '인증메일 전송',
                                fontSize: 18.sp,
                                color: const Color(0xFFFFFFFF),
                                fontweight: FontWeight.w600)),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Visibility(
                        visible: hadSent,
                        child: Column(
                          children: [
                            Center(
                              child: TextFontWidget.fontRegular(
                                  text: '이메일이 오지 않았나요?',
                                  fontSize: 16.sp,
                                  color: Colors.black,
                                  fontweight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 6.h,
                            ),
                            GestureDetector(
                              onTap: state is EmailVerificationModel
                                  ? () {
                                      ref
                                          .read(
                                              emailVerificationViewModelProvider
                                                  .notifier)
                                          .resendMail(
                                              emailTokenId:
                                                  state.data.emailTokenId);
                                    }
                                  : null,
                              child: Center(
                                child: TextFontWidget.fontRegular(
                                    text: '메일 재전송',
                                    fontSize: 16.sp,
                                    color: Color(0XFF4F5BD0),
                                    fontweight: FontWeight.w400),
                              ),
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 56.h,
                        child: OutlinedButton(
                            onPressed: () {
                              final encodedUrl = Uri.encodeComponent(
                                  'https://mail.suwon.ac.kr/index.html');

                              context.push(
                                  '/login/sign_up/email_verification/${encodedUrl}');
                            },
                            style: OutlinedButton.styleFrom(
                              backgroundColor: const Color(0xFF4F5BD0),
                              side: const BorderSide(
                                width: 0.0,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            child: TextFontWidget.fontRegular(
                                text: '포털로 이동하기',
                                fontSize: 18.sp,
                                color: const Color(0xFFFFFFFF),
                                fontweight: FontWeight.w600)),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 56.h,
                        child: OutlinedButton(
                            onPressed: state is EmailVerificationModel
                                ? () async {
                                    await ref
                                        .read(emailVerificationViewModelProvider
                                            .notifier)
                                        .signUp(
                                            account:
                                                widget.account);
                                  }
                                : null,
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
                                text: '회원가입 완료',
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

  void showAlertDialog(BuildContext context, String text) async {
    await showDialog(
        context: context,
        builder: (_) => AlertTextDialog(
              text: text,
              onConfirmPressed: () {
                Navigator.of(context).pop();
              },
            ));
  }
}
