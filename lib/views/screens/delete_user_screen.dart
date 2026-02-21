import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:usw_circle_link/notifier/timer_notifier.dart';
import 'package:usw_circle_link/utils/dialog_manager.dart';
import 'package:usw_circle_link/viewmodels/delete_user_view_model.dart';
import 'package:usw_circle_link/const/app_theme.dart';
import 'package:usw_circle_link/widgets/detail_app_bar/detail_app_bar.dart';
import 'package:usw_circle_link/widgets/rounded_text_field/rounded_text_field.dart';
import 'package:usw_circle_link/widgets/text_font_widget/text_font_widget.dart';

class DeleteUserScreen extends ConsumerStatefulWidget {
  const DeleteUserScreen({Key? key}) : super(key: key);

  @override
  _DeleteUserScreenState createState() => _DeleteUserScreenState();
}

class _DeleteUserScreenState extends ConsumerState<DeleteUserScreen> {
  final TextEditingController codeEditController = TextEditingController();
  final TextEditingController emailEditController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref
        .watch(deleteUserViewModelProvider.select((state) => state.isLoading));
    final isSendCodeSuccess = ref.watch(
        deleteUserViewModelProvider.select((state) => state.isSendCodeSuccess));
    final isVerifyCodeSuccess = ref.watch(deleteUserViewModelProvider
        .select((state) => state.isVerifyCodeSuccess));
    final error =
        ref.watch(deleteUserViewModelProvider.select((state) => state.error));
    final isCodeError = ref.watch(
        deleteUserViewModelProvider.select((state) => state.isCodeError));
    final email =
        ref.watch(deleteUserViewModelProvider.select((state) => state.email));

    final _ = ref.watch(timerProvider);
    final timerNotifier = ref.watch(timerProvider.notifier);

    _listen();

    final appColors = Theme.of(context).extension<AppColors>()!;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: const DetailAppBar(title: '회원탈퇴'),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 30.0),
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFontWidget.fontRegular(
                '이메일',
                fontSize: 16.0,
                color: theme.colorScheme.onSurface,
                fontWeight: FontWeight.w400,
              ),
              const SizedBox(height: 5.0),
              RoundedTextField(
                height: 50.0,
                textEditController: emailEditController,
                leftBottomCornerRadius: 8.0,
                rightBottomCornerRadius: 8.0,
                leftTopCornerRadius: 8.0,
                rightTopCornerRadius: 8.0,
                borderWidth: 1.0,
                maxLines: 1,
                textInputType: TextInputType.text,
                textAlign: TextAlign.left,
                hintText: '이메일로 인증코드가 전송됩니다.',
                readOnly: true,
                paddingLeft: 0.0,
                textStyle: TextFontWidget.fontRegularStyle(
                  fontSize: 14.0,
                  color: appColors.hintColor,
                ),
                backgroundColor: appColors.disabledBackground,
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                width: double.infinity,
                height: 56.0,
                child: OutlinedButton(
                  onPressed: isLoading
                      ? null
                      : isVerifyCodeSuccess
                          ? null
                          : isSendCodeSuccess
                              ? () {
                                  // final encodedUrl = Uri.encodeComponent(
                                  //     'https://mail.suwon.ac.kr:10443/m/index.jsp');

                                  // context.push('/webview/$encodedUrl');
                                  launchUrl(
                                      Uri.parse('http://portal.suwon.ac.kr'));
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
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: TextFontWidget.fontRegular(
                    isLoading
                        ? '로딩 중 ...'
                        : isVerifyCodeSuccess
                            ? '포털로 이동하기 ${timerNotifier.timerText}'
                            : isSendCodeSuccess
                                ? '포털로 이동하기 ${timerNotifier.timerText}'
                                : '이메일 전송',
                    fontSize: 18.0,
                    color: const Color(0xFFFFFFFF),
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "* 가입하신 포털 메일로 ",
                  style: TextStyle(
                      fontFamily: 'SUIT',
                      fontSize: 12.0,
                      color: appColors.subTextColor,
                      fontWeight: FontWeight.w400),
                  children: const [
                    TextSpan(
                      text: "인증코드",
                      style: TextStyle(
                        color: Color(0xffffB052),
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
                height: 10.0,
              ),
              if (error != null && !isCodeError) ...[
                TextFontWidget.fontRegular(
                  '* $error',
                  fontSize: 12.0,
                  color: const Color(0xFFFF3F3F),
                ),
              ],
              const SizedBox(
                height: 10.0,
              ),
              if (isSendCodeSuccess) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFontWidget.fontRegular(
                      '메일을 받지 못하셨나요?',
                      fontSize: 12.0,
                      color: appColors.hintColor,
                      fontWeight: FontWeight.w400,
                      textDecoration: TextDecoration.underline,
                      decorationColor: appColors.hintColor,
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
                RoundedTextField(
                  height: 50.0,
                  textInputAction: TextInputAction.next,
                  textEditController: codeEditController,
                  leftBottomCornerRadius: 8.0,
                  rightBottomCornerRadius: 8.0,
                  leftTopCornerRadius: 8.0,
                  rightTopCornerRadius: 8.0,
                  borderWidth: 1.0,
                  maxLines: 1,
                  textInputType: TextInputType.text,
                  textAlign: TextAlign.left,
                  hintText: '인증코드 4자리 입력',
                  onChanged: (value) {
                    ref
                        .read(deleteUserViewModelProvider.notifier)
                        .setCode(value);
                  },
                  borderColor: isCodeError ? const Color(0xFFFF3F3F) : null,
                  isAnimatedHint: false,
                  paddingLeft: 0.0,
                  paddingRight: 6.0,
                  suffixIcon: SizedBox(
                    width: 83.0,
                    child: OutlinedButton(
                      onPressed: isLoading
                          ? null
                          : () async {
                              bool cancel = true;
                              await DialogManager.instance.showAlertDialog(
                                  context: context,
                                  title: '주의!',
                                  content: '회원 탈퇴를 하시겠습니까?\n탈퇴 후 복구할 수 없습니다.',
                                  leftButtonText: '취소',
                                  rightButtonText: '탈퇴',
                                  onRightButtonPressed: () {
                                    cancel = false;
                                  },
                                  rightButtonTextStyle:
                                      TextFontWidget.fontRegularStyle(
                                    fontSize: 18.0,
                                    color: const Color(0xFFFF3B30),
                                    fontWeight: FontWeight.w800,
                                  ));

                              if (!cancel) {
                                await ref
                                    .read(deleteUserViewModelProvider.notifier)
                                    .verifyCode();
                              }
                            },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: const Color(0xFF000000),
                        foregroundColor: const Color(0xFFFFFFFF),
                        side: const BorderSide(
                          color: Colors.transparent,
                          width: 0.0,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        minimumSize: Size.zero,
                        padding: const EdgeInsets.only(
                          left: 10.0,
                          right: 10.0,
                          top: 14.0,
                          bottom: 14.0,
                        ),
                      ),
                      child: TextFontWidget.fontRegular(
                        isLoading ? '로딩중' : '확인',
                        fontSize: 14.0,
                        color: const Color(0xFFFFFFFF),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  hintStyle: TextFontWidget.fontRegularStyle(
                    fontSize: 14.0,
                  ),
                ),
                const SizedBox(height: 10.0),
                if (error != null && isCodeError) ...[
                  TextFontWidget.fontRegular(
                    "* $error",
                    fontSize: 11.0,
                    color: const Color(0xFFFF3F3F),
                  ),
                ]
              ]
            ],
          ),
        ),
      ),
    );
  }

  Future<void> sendMail() async {
    await ref.read(deleteUserViewModelProvider.notifier).sendCode();
    ref.read(timerProvider.notifier).startTimer();
  }

  void _listen() {
    ref.listen(
        deleteUserViewModelProvider.select((state) => state.isSendCodeSuccess),
        (previous, next) {
      if (next) {
        emailEditController.text = ref.read(
            deleteUserViewModelProvider.select((state) => state.email));
        DialogManager.instance.showAlertDialog(
          context: context,
          content: "인증 코드가 전송되었습니다.\n인증을 완료해주세요.",
        );
      }
    });

    ref.listen(
        deleteUserViewModelProvider
            .select((state) => state.isVerifyCodeSuccess), (previous, next) {
      if (next) {
        DialogManager.instance.showAlertDialog(
          context: context,
          content: "회원 탈퇴가 완료되었습니다.",
          onLeftButtonPressed: () => context.go('/'),
        );
      }
    });
  }
}
