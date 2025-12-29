import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:usw_circle_link/models/change_pw_model.dart';
import 'package:usw_circle_link/utils/dialog_manager.dart';
import 'package:usw_circle_link/utils/error_util.dart';
import 'package:usw_circle_link/utils/icons/sign_up_icons_icons.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';
import 'package:usw_circle_link/viewmodels/change_pw_view_model.dart';
import 'package:usw_circle_link/views/widgets/rounded_rext_field.dart';
import 'package:usw_circle_link/views/widgets/text_font_widget.dart';

class ChangePwScreen extends ConsumerStatefulWidget {
  const ChangePwScreen({
    Key? key,
    this.checkCurrentPassword = true,
    this.uuid = "",
  }) : super(key: key);

  final bool checkCurrentPassword;
  final String uuid;

  @override
  _ChangePWScreenState createState() => _ChangePWScreenState();
}

class _ChangePWScreenState extends ConsumerState<ChangePwScreen> {
  TextEditingController currentPWController = TextEditingController();
  TextEditingController newPWController = TextEditingController();
  TextEditingController newPWConfirmController = TextEditingController();

  bool currentPWVisible = false;
  bool newPWVisible = false;
  bool newPWConfirmVisible = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(changePwViewModelProvider);
    ref.listen<ChangePwModelBase?>(changePwViewModelProvider,
            (ChangePwModelBase? previous, ChangePwModelBase? next) {
          logger.d(next);
          if (next is ChangePwModel) {
            // 비밀번호 변경 완료
            switch (next.type) {
              case ChangePwModelType.changePW:
                break;
              case ChangePwModelType.resetPW:
                break;
              default:
                logger.e("예외발생 - $next");
                break;
            }
            DialogManager.instance.showAlertDialog(
              context: context,
              barrierDismissible: false,
              content: '비밀번호 변경이 완료되었습니다.',
              onLeftButtonPressed: () {
                context.go('/login');
              },
            );
          } else if (next is ChangePwModelError) {
            // 비밀번호 변경 에러
            switch (next.type) {
              case ChangePwModelType.changePW:
                break;
              case ChangePwModelType.resetPW:
                break;
              default:
                logger.e("예외발생 - $next");
                break;
            }
            if (ErrorUtil.instance.getErrorMessage(next.code) == null) {
              DialogManager.instance.showAlertDialog(
                context: context,
                content: '비밀번호 변경 중 문제가 발생했습니다.\n잠시 후 다시 시도해주세요.',
                barrierDismissible: false,
                onLeftButtonPressed: () {
                  context.go('/');
                },
              );
            }
          }
        });

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        toolbarHeight: 62,
        centerTitle: true,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        titleSpacing: 0.0,
        backgroundColor: const Color(0xffFFFFFF),
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
                '비밀번호 변경',
                fontSize: 18.0,
                color: const Color(0xFF111111),
                fontWeight: FontWeight.w800,
              ),
              const SizedBox(width: 52.0, height: 52.0)
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 20.0, left: 32.0, right: 32.0),
        width: double.infinity,
        height: 56.0,
        child: OutlinedButton(
          onPressed: state is ChangePwModelLoading
              ? null
              : () async {
            // 공백이 아닌지 확인
            // 비밀번호 규칙 체크
            final currentPW = currentPWController.text.trim();
            final newPW = newPWController.text.trim();
            final newPWConfirm = newPWConfirmController.text.trim();
            if (widget.checkCurrentPassword) {
              await ref
                  .read(changePwViewModelProvider.notifier)
                  .changePW(
                  userPw: currentPW,
                  newPw: newPW,
                  confirmNewPw: newPWConfirm);
            } else {
              ref.read(changePwViewModelProvider.notifier).resetPW(
                newPw: newPW,
                confirmNewPw: newPWConfirm,
                uuid: widget.uuid,
              );
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
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: TextFontWidget.fontRegular(
            '비밀번호 변경 완료',
            fontSize: 18.0,
            color: const Color(0xFFFFFFFF),
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 30.0),
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.checkCurrentPassword
                  ? RoundedTextField(
                height: 50.0,
                textEditController: currentPWController,
                leftBottomCornerRadius: 0.0,
                rightBottomCornerRadius: 0.0,
                leftTopCornerRadius: 8.0,
                rightTopCornerRadius: 8.0,
                borderColor: state is ChangePwModelError &&
                    !ErrorUtil.instance.isValid(
                        state.code, FieldType.currentPassword)
                    ? const Color(0xFFFF3F3F)
                    : null,
                borderWidth: 1.0,
                maxLines: 1,
                textInputType: TextInputType.text,
                obscureText: !currentPWVisible,
                textInputAction: TextInputAction.next,
                textAlign: TextAlign.left,
                hintText: '현재 비밀번호',
                isAnimatedHint: false,
                prefixIcon: const Icon(
                  SignUpIcons.ic_password,
                  color: Color(0xFF989898),
                  size: 15.0,
                ),
                suffixIcon: IconButton(
                  padding: EdgeInsets.zero,
                  visualDensity: VisualDensity.compact,
                  constraints: const BoxConstraints(),
                  onPressed: () {
                    setState(() {
                      currentPWVisible = !currentPWVisible;
                    });
                  },
                  icon: Icon(
                    currentPWVisible
                        ? SignUpIcons.ic_eye_open
                        : SignUpIcons.ic_eye_slash,
                    color: const Color(0xFF989898),
                    size: 18.0,
                  ),
                ),
                hintStyle: const TextStyle(
                  fontSize: 14.0,
                  fontFamily: 'SUIT',
                ),
              )
                  : Container(),
              RoundedTextField(
                height: 50.0,
                textEditController: newPWController,
                leftBottomCornerRadius: 0.0,
                rightBottomCornerRadius: 0.0,
                leftTopCornerRadius: widget.checkCurrentPassword ? 0.0 : 8.0,
                rightTopCornerRadius: widget.checkCurrentPassword ? 0.0 : 8.0,
                borderColor: state is ChangePwModelError &&
                    !ErrorUtil.instance
                        .isValid(state.code, FieldType.password)
                    ? const Color(0xFFFF3F3F)
                    : null,
                borderWidth: 1.0,
                maxLines: 1,
                textInputType: TextInputType.text,
                obscureText: !newPWVisible,
                textInputAction: TextInputAction.next,
                textAlign: TextAlign.left,
                hintText: '새 비밀번호',
                isAnimatedHint: false,
                prefixIcon: const Icon(
                  SignUpIcons.ic_password,
                  color: Color(0xFF989898),
                  size: 15.0,
                ),
                suffixIcon: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  visualDensity: VisualDensity.compact,
                  onPressed: () {
                    setState(() {
                      newPWVisible = !newPWVisible;
                    });
                  },
                  icon: Icon(
                    newPWVisible
                        ? SignUpIcons.ic_eye_open
                        : SignUpIcons.ic_eye_slash,
                    color: const Color(0xFF989898),
                    size: 18.0,
                  ),
                ),
                hintStyle: const TextStyle(
                  fontSize: 14.0,
                  fontFamily: 'SUIT',
                ),
              ),
              RoundedTextField(
                height: 50.0,
                textEditController: newPWConfirmController,
                leftBottomCornerRadius: 8.0,
                rightBottomCornerRadius: 8.0,
                leftTopCornerRadius: 0.0,
                rightTopCornerRadius: 0.0,
                borderColor: state is ChangePwModelError &&
                    !ErrorUtil.instance
                        .isValid(state.code, FieldType.passwordConfirm)
                    ? const Color(0xFFFF3F3F)
                    : null,
                borderWidth: 1.0,
                maxLines: 1,
                textInputType: TextInputType.text,
                obscureText: !newPWConfirmVisible,
                textInputAction: TextInputAction.next,
                textAlign: TextAlign.left,
                hintText: '비밀번호 확인',
                isAnimatedHint: false,
                prefixIcon: const Icon(
                  SignUpIcons.ic_password,
                  color: Color(0xFF989898),
                  size: 18.0,
                ),
                suffixIcon: IconButton(
                  padding: EdgeInsets.zero,
                  visualDensity: VisualDensity.compact,
                  constraints: const BoxConstraints(),
                  onPressed: () {
                    setState(() {
                      newPWConfirmVisible = !newPWConfirmVisible;
                    });
                  },
                  icon: Icon(
                    newPWConfirmVisible
                        ? SignUpIcons.ic_eye_open
                        : SignUpIcons.ic_eye_slash,
                    color: const Color(0xFF989898),
                    size: 18.0,
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
              TextFontWidget.fontRegular(
                "* 비밀번호는 영어, 숫자, 특수문자 모두 포함하여\n 8~20자 이내로 작성해주세요!",
                fontSize: 12.0,
                color: state is ChangePwModelError &&
                    !ErrorUtil.instance
                        .isValid(state.code, FieldType.password)
                    ? const Color(0xFFFF3F3F)
                    : const Color(0xFF707070),
                fontWeight: FontWeight.w400,
              ),
              const SizedBox(
                height: 10.0,
              ),
              if (state is ChangePwModelError &&
                  ErrorUtil.instance.isValid(state.code, FieldType.password) &&
                  ErrorUtil.instance.getErrorMessage(state.code) != null)
                TextFontWidget.fontRegular(
                  '* ${ErrorUtil.instance.getErrorMessage(state.code)}',
                  fontSize: 12.0,
                  color: const Color(0xFFFF3F3F),
                  fontWeight: FontWeight.w400,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
