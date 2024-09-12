import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:usw_circle_link/models/find_pw_model.dart';
import 'package:usw_circle_link/utils/dialog_manager.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';
import 'package:usw_circle_link/viewmodels/find_pw_view_model.dart';
import 'package:usw_circle_link/views/widgets/rounded_rext_field.dart';
import 'package:usw_circle_link/views/widgets/text_font_widget.dart';

class FindPwScreen extends ConsumerStatefulWidget {
  const FindPwScreen({Key? key}) : super(key: key);

  @override
  _FindPWScreenState createState() => _FindPWScreenState();
}

class _FindPWScreenState extends ConsumerState<FindPwScreen> {
  final TextEditingController idEditController = TextEditingController();
  final TextEditingController emailEditController = TextEditingController();
  final TextEditingController codeEditController = TextEditingController();

  String? uuid;
  bool hadSent = false;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(findPwViewModelProvider);
    ref.listen(findPwViewModelProvider, (previous, next) {
      logger.d(next);
      if (next is FindPwModel) {
        switch (next.type) {
          case FindPwModelType.sendCode:
            hadSent = true;
            DialogManager.instance.showAlertDialog(
              context: context,
              content: '인증코드가 전송되었습니다',
            );
            uuid = next.data;
            break;
          case FindPwModelType.verifyCode:
            context.push('/login/find_pw/change_pw?uuid=${uuid!}');
            break;
          default:
            logger.d('예외발생 - $next');
        }
      }
      if (next is FindPwModelError) {
        switch (next.type) {
          case FindPwModelType.sendCode:
            switch (next.code) {
              case "EML-F100": // 이메일 공백
                DialogManager.instance.showAlertDialog(
                  context: context,
                  content: '이메일을 입력해주세요!',
                );
                break;
              case "EML-F200": // 아이디 공백
                DialogManager.instance.showAlertDialog(
                  context: context,
                  content: '아이디를 입력해주세요!',
                );
                break;
              case "EML-F300": // 액세스토큰 NULL
                DialogManager.instance.showAlertDialog(
                  context: context,
                  content: '이메일 전송하는 데 실패했습니다\n잠시후 다시 시도해주세요!',
                );
                break;
              case "USR-209": // 이메일, 아이디 일치 X
                DialogManager.instance.showAlertDialog(
                  context: context,
                  content: '해당 정보로 가입된 회원이 없습니다!',
                );
                break;
              default: // EML-501
                DialogManager.instance.showAlertDialog(
                  context: context,
                  content: '이메일을 전송하는 데 실패했습니다.\n잠시후 다시 시도해주세요!',
                );
                break;
            }
            break;
          case FindPwModelType.verifyCode:
            switch (next.code) {
              case "VC-F100": // 인증코드 공백
                DialogManager.instance.showAlertDialog(
                  context: context,
                  content: '인증코드를 입력해주세요!',
                );
                break;
              case "VC-F200": // uuid 가 존재하지 않음
                DialogManager.instance.showAlertDialog(
                  context: context,
                  content: '"이메일 전송" 버튼을 먼저 눌러주세요!',
                );
                break;
              case "USR-210": // 해당 정보로 인증 중인 회원존재 X
                DialogManager.instance.showAlertDialog(
                  context: context,
                  content: '인증코드를 확인하는 데 실패했습니다.\n잠시후 다시 시동해주세요!',
                );
                break;
              case "AC-101": // 인증코드가 일치하지 않습니다
                DialogManager.instance.showAlertDialog(
                  context: context,
                  content: '인증코드가 일치하지 않습니다',
                );
                break;
              default:
                DialogManager.instance.showAlertDialog(
                  context: context,
                  content: '인증코드를 확인하는 데 실패했습니다.\n잠시후 다시 시도해주세요!',
                );
                break;
            }
            break;
          default:
            logger.d('예외발생 - $next');
        }
      }
    });

    idEditController.addListener(
      () {
        hadSent = false;
        ref.read(findPwViewModelProvider.notifier).initState();
      },
    );

    emailEditController.addListener(
      () {
        hadSent = false;
        ref.read(findPwViewModelProvider.notifier).initState();
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
                                  text: "인증코드",
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
                            onPressed: hadSent || state is FindPwModelLoading
                                ? null
                                : () async {
                                    ref
                                        .read(findPwViewModelProvider.notifier)
                                        .sendCode(
                                            account:
                                                idEditController.text.trim(),
                                            email: emailEditController.text
                                                .trim());
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
                                text: '이메일 전송',
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
                              onTap: !hadSent || state is FindPwModelLoading
                                  ? null
                                  : () {
                                      ref
                                          .read(
                                              findPwViewModelProvider.notifier)
                                          .sendCode(
                                              account:
                                                  idEditController.text.trim(),
                                              email: emailEditController.text
                                                  .trim());
                                    },
                              child: Center(
                                child: TextFontWidget.fontRegular(
                                    text: '메일 재전송',
                                    fontSize: 16.sp,
                                    color: Color(0xffffB052),
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
                                text: '포털로 이동하기',
                                fontSize: 18.sp,
                                color: const Color(0xFFFFFFFF),
                                fontweight: FontWeight.w600)),
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
                            onPressed: state is FindPwModelLoading
                                ? null
                                : () async {
                                    final code = codeEditController.text.trim();
                                    await ref
                                        .read(findPwViewModelProvider.notifier)
                                        .verifyCode(
                                          code: code,
                                          uuid: uuid,
                                        );
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
                                text: '확인',
                                fontSize: 14.sp,
                                color: Color(0xFFFFFFFF),
                                fontweight: FontWeight.w600),
                          ),
                        ),
                        hintStyle: TextStyle(
                            fontSize: 14.sp, fontFamily: 'Pretendard-Regular'),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }

  @override
  void dispose() {
    idEditController.dispose();
    emailEditController.dispose();
    super.dispose();
  }

  bool codeIsInvalid(FindPwModelBase? state) {
    return false;
  }
}
