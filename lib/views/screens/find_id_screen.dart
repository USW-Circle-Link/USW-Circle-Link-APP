import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:usw_circle_link/models/FindIdModel.dart';
import 'package:usw_circle_link/utils/dialog_manager.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';
import 'package:usw_circle_link/viewmodels/find_id_view_model.dart';
import 'package:usw_circle_link/views/widgets/text_font_widget.dart';

class FindIdScreen extends ConsumerStatefulWidget {
  const FindIdScreen({Key? key}) : super(key: key);

  @override
  _FindIDScreenState createState() => _FindIDScreenState();
}

class _FindIDScreenState extends ConsumerState<FindIdScreen> {
  final TextEditingController emailEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(findIdViewModelProvider);
    ref.listen(findIdViewModelProvider, (previous, next) {
      logger.d(next);
      if (next is FindIdModel) {
        DialogManager.instance.showAlertDialog(
          context: context,
          content: '확인메일이 전송되었습니다!',
        );
      }

      if (next is FindIdModelError) {
        switch (next.code) {
          case "EML-F100": // 이메일 공백
            DialogManager.instance.showAlertDialog(
              context: context,
              content: '이메일을 입력해주세요!',
            );
            break;
          case "USR-201": // 해당 이메일을 가진 회원 존재 X
            DialogManager.instance.showAlertDialog(
              context: context,
              content: '해당 정보로 가입된 회원이 없습니다!',
            );
            break;
          case "ATTEMPT-503":
            DialogManager.instance.showAlertDialog(
              context: context,
              content: '최대 시도 횟수를 초과했습니다!\n1분후 다시 시도해주세요!',
            );
            break;
          default: // EML-501 : 서버에서 메일전송 실패 (Internal Server Error 500)
            DialogManager.instance.showAlertDialog(
              context: context,
              content: '이메일을 전송하는 데 실패했습니다!',
            );
            break;
        }
      }
    });

    emailEditController.addListener(
      () {
        ref.read(findIdViewModelProvider.notifier).initState();
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
                          text: '아이디 찾기',
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
                                  text: "가입 정보",
                                  style: TextStyle(
                                      color: Color(0xFFFFB052),
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
                            onPressed: state is FindIdModelLoading
                                ? null
                                : () async {
                                    ref
                                        .read(findIdViewModelProvider.notifier)
                                        .findId(
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
                      SizedBox(
                        width: double.infinity,
                        height: 56.h,
                        child: OutlinedButton(
                            onPressed: () {
                              final encodedUrl = Uri.encodeComponent(
                                  'https://mail.suwon.ac.kr:10443/m/index.jsp');

                              context
                                  .push('/login/find_id/webview/$encodedUrl');
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
                      SizedBox(
                        width: double.infinity,
                        height: 56.h,
                        child: OutlinedButton(
                            onPressed: () {
                              context.go('/login');
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
                                text: '로그인 하러가기',
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
}
