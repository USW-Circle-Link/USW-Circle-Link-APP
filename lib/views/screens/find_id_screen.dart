import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:usw_circle_link/models/global_exception.dart';
import 'package:usw_circle_link/notifier/timer_notifier.dart';
import 'package:usw_circle_link/utils/dialog_manager.dart';
import 'package:usw_circle_link/utils/error_util.dart';
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
    final _ = ref.watch(timerProvider);
    final timerNotifier = ref.watch(timerProvider.notifier);
    ref.listen(findIdViewModelProvider, (previous, next) {
      logger.d(next);
      next.when(
          data: (data) {
            if (data != null) {
              logger.d('이메일 보내기 성공!');
              DialogManager.instance.showAlertDialog(
                context: context,
                content: "이메일이 전송되었습니다.",
              );
            }
          },
          error: (error, stackTrace) {
            error = error as GlobalException;
            switch (error.code) {
              default:
                logger.e('예외발생 - $next');
                break;
            }
          },
          loading: () {});
    });

    emailEditController.addListener(
      () {
        ref.read(findIdViewModelProvider.notifier).initState();
      },
    );
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0.0,
        titleSpacing: 0.0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 52.0,
                height: 52.0,
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
                '아이디 찾기',
                fontSize: 18.0,
                color: const Color(0xFF111111),
                fontWeight: FontWeight.w800,
              ),
              const SizedBox(width: 52.0, height: 52.0)
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
                  margin: const EdgeInsets.only(top: 60.0),
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 46.0,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          controller: emailEditController,
                          keyboardType: TextInputType.text,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            hintText: "포털 이메일 입력",
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFFFB052)),
                            ),
                            contentPadding: const EdgeInsets.only(left: 8.0),
                            suffixIcon: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextFontWidget.fontRegular(
                                  '@ suwon.ac.kr',
                                  fontSize: 16.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                )
                              ],
                            ),
                          ),
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      if (state.hasError)
                        TextFontWidget.fontRegular(
                          '* ${ErrorUtil.instance.getErrorMessage((state.error as GlobalException).code) ?? "이메일 전송에 실패했습니다. 잠시후 다시 시도해주세요."}',
                          fontSize: 12.0,
                          color: const Color(0xFFFF5353),
                          fontWeight: FontWeight.w400,
                        ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(
                              text: "* 입력하신 메일로 ",
                              style: TextStyle(
                                fontFamily: 'SUIT',
                                fontSize: 12.0,
                                color: const Color(0xFF989898),
                                fontWeight: FontWeight.w400,
                              ),
                              children: const [
                                TextSpan(
                                  text: "가입 정보",
                                  style: TextStyle(
                                    color: Color(0xFFFFB052),
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
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 56.0,
                        child: OutlinedButton(
                          onPressed: state.when<VoidCallback?>(
                              data: (data) => () {
                                    if (data != null) {
                                      // final encodedUrl =
                                      // Uri.encodeComponent(
                                      //     'https://mail.suwon.ac.kr:10443/m/index.jsp');

                                      // context
                                      //     .push('/webview/$encodedUrl');
                                      launchUrl(Uri.parse(
                                          'https://portal.suwon.ac.kr'));
                                    } else {
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
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: TextFontWidget.fontRegular(
                            state.when<String>(
                                data: (data) {
                                  if (data != null) {
                                    return '포털로 이동하기 ${timerNotifier.timerText}';
                                  } else {
                                    return '인증메일 전송';
                                  }
                                },
                                error: (_, __) => '인증메일 전송',
                                loading: () => '로딩 중 ...'),
                            fontSize: 18.0,
                            color: const Color(0xFFFFFFFF),
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      if (state.hasValue && state.value != null)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextFontWidget.fontRegular(
                              '메일을 받지 못하셨나요?',
                              fontSize: 12.0,
                              color: const Color(0xFF989898),
                              fontWeight: FontWeight.w400,
                              textDecoration: TextDecoration.underline,
                              decorationColor: const Color(0xFF989898),
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
                                fontSize: 12.0,
                                color: const Color(0xFF2F8ADF),
                                fontWeight: FontWeight.w400,
                                textDecoration: TextDecoration.underline,
                                decorationColor: const Color(0xFF2F8ADF),
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
                  fontSize: 12.0,
                  color: const Color(0xFF676767),
                  fontWeight: FontWeight.w700,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> sendMail() async {
    await ref
        .read(findIdViewModelProvider.notifier)
        .findId(email: emailEditController.text.trim());
    ref.read(timerProvider.notifier).startTimer();
  }
}
