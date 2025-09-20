import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:usw_circle_link/models/find_pw_model.dart';
import 'package:usw_circle_link/notifier/timer_notifier.dart';
import 'package:usw_circle_link/utils/dialog_manager.dart';
import 'package:usw_circle_link/utils/error_util.dart';
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

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(findPwViewModelProvider);
    final _ = ref.watch(timerProvider);
    final timerNotifier = ref.watch(timerProvider.notifier);
    ref.listen(findPwViewModelProvider, (previous, next) {
      logger.d(next);
      next.when(
          data: (data) {
            switch (data?.type) {
              case FindPwModelType.sendCode:
                logger.d('이메일 보내기 성공!');
                DialogManager.instance.showAlertDialog(
                  context: context,
                  content: '이메일이 전송되었습니다.\n인증을 완료해 주세요.',
                );
                uuid = data!.data;
                break;
              case FindPwModelType.verifyCode:
                DialogManager.instance.showAlertDialog(
                  context: context,
                  content: '인증이 완료되었습니다.',
                  onLeftButtonPressed: () {
                    context.push('/login/find_pw/change_pw?uuid=${uuid!}');
                  },
                );
                break;
              default:
            }
          },
          error: (error, stackTrace) {
            error = error as FindPwModelError;
            switch (error.type) {
              case FindPwModelType.verifyCode:
                switch (error.code) {
                  case "USR-208": // 존재하지 않는 계정
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

    idEditController.addListener(
          () {
        ref.read(findPwViewModelProvider.notifier).initState();
      },
    );

    emailEditController.addListener(
          () {
        ref.read(findPwViewModelProvider.notifier).initState();
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
                '비밀번호 찾기',
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
                          controller: idEditController,
                          keyboardType: TextInputType.text,
                          textAlign: TextAlign.left,
                          decoration: const InputDecoration(
                            hintText: "아이디 입력",
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFFFB052)),
                            ),
                            contentPadding:
                            EdgeInsets.only(left: 8.0, bottom: 8.0),
                          ),
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                      const SizedBox(
                        height: 14.0,
                      ),
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
                        height: 10.0,
                      ),
                      if (state.hasError &&
                          (state.error as FindPwModelError).type ==
                              FindPwModelType.sendCode)
                        TextFontWidget.fontRegular(
                          '* ${ErrorUtil.instance.getErrorMessage((state.error as FindPwModelError).code) ?? "이메일 전송에 실패했습니다. 잠시후 다시 시도해주세요."}',
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
                          onPressed: state.when<VoidCallback?>(
                              data: (data) {
                                switch (data?.type) {
                                  case FindPwModelType.sendCode:
                                    return goToPortal;
                                  case FindPwModelType.verifyCode:
                                    return () {
                                      context.push(
                                          '/login/find_pw/change_pw?uuid=${uuid!}');
                                    };
                                  default: // null
                                    return sendMail;
                                }
                              },
                              error: (error, __) {
                                switch ((error as FindPwModelError).type) {
                                  case FindPwModelType.sendCode:
                                    return sendMail;
                                  case FindPwModelType.verifyCode:
                                    return goToPortal;
                                  default:
                                    return sendMail;
                                }
                              },
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
                                  switch (data?.type) {
                                    case FindPwModelType.sendCode:
                                      return '포털로 이동하기 ${timerNotifier.timerText}';
                                    case FindPwModelType.verifyCode:
                                      return '비밀번호를 변경하세요';
                                    default:
                                      return '이메일 전송';
                                  }
                                },
                                error: (error, __) {
                                  switch (
                                  (error as FindPwModelError).type) {
                                    case FindPwModelType.sendCode:
                                      return '이메일 전송';
                                    case FindPwModelType.verifyCode:
                                      return '포털로 이동하기 ${timerNotifier.timerText}';
                                    default:
                                      return '이메일 전송';
                                  }
                                },
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
                      if ((state.hasValue &&
                          state.value != null &&
                          state.value!.type != FindPwModelType.verifyCode) ||
                          (state.hasError &&
                              (state.error as FindPwModelError).type ==
                                  FindPwModelType.verifyCode))
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
                      if ((state.hasValue &&
                          state.value != null &&
                          state.value!.type == FindPwModelType.sendCode) ||
                          (state.hasError &&
                              (state.error as FindPwModelError).type ==
                                  FindPwModelType.verifyCode))
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
                          borderColor: codeIsInvalid(state.valueOrNull)
                              ? const Color(0xFFFF3F3F)
                              : null,
                          isAnimatedHint: false,
                          suffixIcon: SizedBox(
                            width: 83.0,
                            child: OutlinedButton(
                              onPressed: state.isLoading
                                  ? null
                                  : () async {
                                final code =
                                codeEditController.text.trim();
                                await ref
                                    .read(findPwViewModelProvider
                                    .notifier)
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
                                  horizontal: 12.0,
                                  vertical: 6.0,
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
                      if (state.hasError &&
                          (state.error as FindPwModelError).type ==
                              FindPwModelType.verifyCode)
                        TextFontWidget.fontRegular(
                          '* ${ErrorUtil.instance.getErrorMessage((state.error as FindPwModelError).code) ?? "인증코드 확인 중 문제가 발생했습니다. 잠시후 다시 시도해주세요."}',
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

  bool codeIsInvalid(FindPwModel? state) {
    return false;
  }

  Future<void> sendMail() async {
    await ref.read(findPwViewModelProvider.notifier).sendCode(
        account: idEditController.text.trim(),
        email: emailEditController.text.trim());
    ref.read(timerProvider.notifier).startTimer();
  }

  void goToPortal() {
    final encodedUrl =
    Uri.encodeComponent('https://mail.suwon.ac.kr:10443/m/index.jsp');

    context.push('/webview/$encodedUrl');
  }
}
