import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:usw_circle_link/models/FindPWModel.dart';
import 'package:usw_circle_link/utils/logger/Logger.dart';
import 'package:usw_circle_link/viewmodels/FindPWViewModel.dart';
import 'package:usw_circle_link/views/widgets/AlertTextDialog.dart';
import 'package:usw_circle_link/views/widgets/TextFontWidget.dart';

class FindPWScreen extends ConsumerStatefulWidget {
  const FindPWScreen({Key? key}) : super(key: key);

  @override
  _FindPWScreenState createState() => _FindPWScreenState();
}

class _FindPWScreenState extends ConsumerState<FindPWScreen> {
  final TextEditingController idEditController = TextEditingController();
  final TextEditingController emailEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(findPWViewModelProvider);
    ref.listen(findPWViewModelProvider, (previous, next) {
      logger.d(next);
      if (next is FindPWModel) {
        switch (next.type) {
          case FindPWModelType.findPW:
            break;
          case FindPWModelType.resendMail:
            break;
          default:
            logger.d('예외발생 - $next');
        }
      }
      if (next is FindPWModelError) {
        switch (next.type) {
          case FindPWModelType.findPW:
            switch (next.code) {
              case "EML-F100":
                showAlertDialog(context, '이메일을 입력해주세요!');
                break;
              case "EML-F200":
                showAlertDialog(context, '아이디를 입력해주세요!');
                break;
              default:
                showAlertDialog(context, '메일을 전송하는데 실패했습니다!');
                break;
            }
            break;
          case FindPWModelType.resendMail:
            break;
          default:
            logger.d('예외발생 - $next');
        }
      }
    });

    idEditController.addListener(
      () {
        ref.read(findPWViewModelProvider.notifier).initState();
      },
    );

    emailEditController.addListener(
      () {
        ref.read(findPWViewModelProvider.notifier).initState();
      },
    );
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
                          text: '비밀번호 찾기',
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
                        height: 46.h,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          controller: idEditController,
                          keyboardType: TextInputType.text,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            hintText: "아이디 입력",
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF6E78D8)),
                            ),
                            contentPadding:
                                EdgeInsets.only(left: 8.w, bottom: 8.h),
                          ),
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                      SizedBox(
                        height: 14.h,
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
                                  text: "임시 비밀번호",
                                  style: TextStyle(
                                      color: Color(0xFF6E6EDE),
                                      fontWeight: FontWeight.w600),
                                ),
                                TextSpan(
                                  text: '를 전송합니다',
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
                            onPressed: () async {
                              ref.read(findPWViewModelProvider.notifier).findPW(account: idEditController.text.trim(), email: emailEditController.text.trim());
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
                                text: '이메일 전송',
                                fontSize: 18.sp,
                                color: const Color(0xFFFFFFFF),
                                fontweight: FontWeight.w600)),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Visibility(
                        visible: state is FindPWModel,
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
                              onTap: state is FindPWModel
                                  ? () {
                                      ref
                                          .read(
                                              findPWViewModelProvider.notifier)
                                          .findPW(
                                              account:
                                                  idEditController.text.trim(),
                                              email: emailEditController.text
                                                  .trim());
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
                              context.go('/login');
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
                                text: '로그인하러 가기',
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

  @override
  void dispose() {
    idEditController.dispose();
    emailEditController.dispose();
    super.dispose();
  }
}
