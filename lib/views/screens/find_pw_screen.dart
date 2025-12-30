import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:usw_circle_link/notifier/timer_notifier.dart';
import 'package:usw_circle_link/utils/dialog_manager.dart';
import 'package:usw_circle_link/viewmodels/find_pw_view_model.dart';
import 'package:usw_circle_link/widgets/detail_app_bar/detail_app_bar.dart';
import 'package:usw_circle_link/widgets/email_text_field/email_text_field.dart';
import 'package:usw_circle_link/widgets/rounded_text_field/rounded_text_field.dart';
import 'package:usw_circle_link/widgets/text_font_widget/text_font_widget.dart';

class FindPwScreen extends ConsumerStatefulWidget {
  const FindPwScreen({Key? key}) : super(key: key);

  @override
  _FindPWScreenState createState() => _FindPWScreenState();
}

class _FindPWScreenState extends ConsumerState<FindPwScreen> {
  final TextEditingController idEditController = TextEditingController();
  final TextEditingController emailEditController = TextEditingController();
  final TextEditingController codeEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isSendCodeSuccess = ref.watch(
        findPwViewModelProvider.select((state) => state.isSendCodeSuccess));
    final isVerifyCodeSuccess = ref.watch(
        findPwViewModelProvider.select((state) => state.isVerifyCodeSuccess));
    final isLoading =
        ref.watch(findPwViewModelProvider.select((state) => state.isLoading));
    final error =
        ref.watch(findPwViewModelProvider.select((state) => state.error));
    final isCodeError =
        ref.watch(findPwViewModelProvider.select((state) => state.isCodeError));
    final uuid =
        ref.watch(findPwViewModelProvider.select((state) => state.uuid));
    ref.listen(
        findPwViewModelProvider.select((state) => state.isSendCodeSuccess),
        (previous, next) {
      if (next != null && next) {
        DialogManager.instance.showAlertDialog(
          context: context,
          content: '이메일이 전송되었습니다.\n인증을 완료해 주세요.',
        );
      }
    });
    ref.listen(
        findPwViewModelProvider.select((state) => state.isVerifyCodeSuccess),
        (previous, next) {
      if (next != null && next && uuid != null) {
        DialogManager.instance.showAlertDialog(
          context: context,
          content: '인증이 완료되었습니다.',
          onLeftButtonPressed: () {
            context.push('/login/find_pw/change_pw?uuid=$uuid');
          },
        );
      }
    });
    final _ = ref.watch(timerProvider);
    final timerNotifier = ref.watch(timerProvider.notifier);

    return Scaffold(
      appBar: const DetailAppBar(title: '비밀번호 찾기'),
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
                      RoundedTextField(
                        height: 50.0,
                        textEditController: idEditController,
                        leftBottomCornerRadius: 8.0,
                        rightBottomCornerRadius: 8.0,
                        leftTopCornerRadius: 8.0,
                        rightTopCornerRadius: 8.0,
                        borderWidth: 1.0,
                        maxLines: 1,
                        textInputType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        textAlign: TextAlign.left,
                        hintText: '아이디 입력',
                        isAnimatedHint: false,
                        onChanged: (value) {
                          ref
                              .read(findPwViewModelProvider.notifier)
                              .initState();
                        },
                        hintStyle: TextFontWidget.fontRegularStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w300,
                          color: const Color(0xFF989898),
                        ),
                      ),
                      const SizedBox(height: 14.0),
                      EmailTextField(
                        controller: emailEditController,
                        hintText: '포털 이메일 입력',
                        textInputAction: TextInputAction.done,
                        onChanged: (value) {
                          ref
                              .read(findPwViewModelProvider.notifier)
                              .initState();
                        },
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      if (error != null && isCodeError != true)
                        TextFontWidget.fontRegular(
                          '* $error',
                          fontSize: 12.0,
                          color: const Color(0xFFFF5353),
                          fontWeight: FontWeight.w400,
                        ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      RichText(
                        textAlign: TextAlign.start,
                        text: const TextSpan(
                          text: "* 입력하신 메일로 ",
                          style: TextStyle(
                            fontFamily: 'SUIT',
                            fontSize: 12.0,
                            color: Color(0xFF989898),
                            fontWeight: FontWeight.w400,
                          ),
                          children: [
                            TextSpan(
                              text: "인증코드",
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
                      const SizedBox(
                        height: 12.0,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 56.0,
                        child: OutlinedButton(
                          onPressed: isLoading
                              ? null
                              : isSendCodeSuccess == true
                                  ? isVerifyCodeSuccess == true
                                      ? () {
                                          context.push(
                                              '/login/find_pw/change_pw?uuid=${uuid!}');
                                        }
                                      : goToPortal
                                  : sendMail,
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
                            isLoading
                                ? '로딩 중 ...'
                                : isSendCodeSuccess == true
                                    ? isVerifyCodeSuccess == true
                                        ? '비밀번호를 변경하세요'
                                        : '포털로 이동하기 ${timerNotifier.timerText}'
                                    : '이메일 전송',
                            fontSize: 18.0,
                            color: const Color(0xFFFFFFFF),
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      if (isSendCodeSuccess == true)
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
                      const SizedBox(
                        height: 20.0,
                      ),
                      if (isSendCodeSuccess == true)
                        RoundedTextField(
                          height: 50.0,
                          textInputAction: TextInputAction.next,
                          textEditController: codeEditController,
                          paddingLeft: 0.0,
                          paddingRight: 6.0,
                          leftBottomCornerRadius: 8.0,
                          rightBottomCornerRadius: 8.0,
                          leftTopCornerRadius: 8.0,
                          rightTopCornerRadius: 8.0,
                          borderWidth: 1.0,
                          maxLines: 1,
                          textInputType: TextInputType.text,
                          textAlign: TextAlign.left,
                          hintText: '인증코드 4자리 입력',
                          borderColor: isCodeError == true
                              ? const Color(0xFFFF3F3F)
                              : null,
                          isAnimatedHint: false,
                          suffixIcon: SizedBox(
                            width: 83.0,
                            child: OutlinedButton(
                              onPressed: isLoading
                                  ? null
                                  : () async {
                                      final code =
                                          codeEditController.text.trim();
                                      await ref
                                          .read(
                                              findPwViewModelProvider.notifier)
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
                                      BorderRadius.circular(16.0), // radius 18
                                ),
                                minimumSize: Size.zero,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0,
                                  vertical: 14.0,
                                ),
                              ),
                              child: TextFontWidget.fontRegular(
                                '확인',
                                fontSize: 14.0,
                                color: const Color(0xFFFFFFFF),
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          hintStyle: const TextStyle(
                            fontSize: 14.0,
                            fontFamily: 'SUIT',
                          ),
                        ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      if (isCodeError == true && error != null)
                        TextFontWidget.fontRegular(
                          '* $error',
                          fontSize: 10.0,
                          color: const Color(0xFFFF5353),
                          fontWeight: FontWeight.w400,
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    idEditController.dispose();
    emailEditController.dispose();
    super.dispose();
  }

  Future<void> sendMail() async {
    await ref.read(findPwViewModelProvider.notifier).sendCode(
        account: idEditController.text.trim(),
        email: emailEditController.text.trim());
    ref.read(timerProvider.notifier).startTimer();
  }

  void goToPortal() {
    // final encodedUrl = Uri.encodeComponent('https://portal.suwon.ac.kr');

    // context.push('/webview/$encodedUrl');
    launchUrl(Uri.parse('https://portal.suwon.ac.kr'));
  }
}
