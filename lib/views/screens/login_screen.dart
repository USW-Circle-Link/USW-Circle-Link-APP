import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:usw_circle_link/models/user_model.dart';
import 'package:usw_circle_link/utils/error_util.dart';
import 'package:usw_circle_link/utils/icons/sign_up_icons_icons.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';
import 'package:usw_circle_link/viewmodels/login_view_model.dart';
import 'package:usw_circle_link/views/widgets/rounded_rext_field.dart';
import 'package:usw_circle_link/views/widgets/text_font_widget.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(loginViewModelProvider);
    ref.listen<UserModelBase?>(loginViewModelProvider,
            (UserModelBase? previous, UserModelBase? next) {
          logger.d('$next');
          if (next is UserModelError) {
            logger.e(next.message);
          }
          if (next is UserModel) {
            // 로그인 성공
            context.pop();
          }
        });

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0.0,
        title: Padding(
          padding: const EdgeInsets.only(left: 22.0), // icon에 10.0 정도의 여백이 기본적으로 존재
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  // Navigate back to the previous screen by popping the current route
                  Navigator.of(context).pop();
                },
                icon: SvgPicture.asset(
                  'assets/images/ic_back_arrow.svg',
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 120.0),
          padding: const EdgeInsets.only(left: 32.0, right: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: "동아리 구하는 사람 모여라!\n미루지 말고 지금,",
                  style: TextFontWidget.fontRegularStyle(
                    fontSize: 12.0,
                    color: const Color(0xFF282828),
                    fontWeight: FontWeight.w400,
                  ),
                  children: const [],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Wrap(
                children: [
                  SizedBox(
                    child: Image.asset('assets/images/dongurami.png',
                        width: 24.0, height: 24.0, fit: BoxFit.contain),
                  ),
                  const SizedBox(width: 4.0),
                  TextFontWidget.jalnan2(
                    '동구라미',
                    fontSize: 20.0,
                    color: const Color(0xffFFC01D),
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              RoundedTextField(
                textInputAction: TextInputAction.next,
                textEditController: idController,
                leftBottomCornerRadius: 16.0,
                rightBottomCornerRadius: 16.0,
                leftTopCornerRadius: 16.0,
                rightTopCornerRadius: 16.0,
                borderWidth: 0.0,
                maxLines: 1,
                textInputType: TextInputType.text,
                textAlign: TextAlign.left,
                hintText: '아이디',
                isAnimatedHint: false,
                prefixIcon: Icon(
                  SignUpIcons.ic_person,
                  color: const Color(0xFF989898),
                  size: 15.0,
                ),
                hintStyle: TextFontWidget.fontRegularStyle(
                  fontSize: 14.0,
                  color: const Color(0xFF989898),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              RoundedTextField(
                textEditController: passwordController,
                leftBottomCornerRadius: 16.0,
                rightBottomCornerRadius: 16.0,
                leftTopCornerRadius: 16.0,
                rightTopCornerRadius: 16.0,
                borderWidth: 0.0,
                maxLines: 1,
                textInputType: TextInputType.text,
                obscureText: !passwordVisible,
                textAlign: TextAlign.left,
                hintText: '비밀번호',
                isAnimatedHint: false,
                prefixIcon: Icon(
                  SignUpIcons.ic_password,
                  color: const Color(0xFF989898),
                  size: 15.0,
                ),
                suffixIcon: IconButton(
                  padding: EdgeInsets.zero,
                  visualDensity: VisualDensity.compact,
                  constraints: const BoxConstraints(),
                  onPressed: () {
                    setState(() {
                      passwordVisible = !passwordVisible;
                    });
                  },
                  icon: Icon(
                    passwordVisible
                        ? SignUpIcons.ic_eye_open
                        : SignUpIcons.ic_eye_slash,
                    color: const Color(0xFF989898),
                    size: 18.0,
                  ),
                ),
                hintStyle: TextFontWidget.fontRegularStyle(
                  fontSize: 14.0,
                  color: const Color(0xFF989898),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              if (state is UserModelError)
                TextFontWidget.fontRegular(
                  '* ${(ErrorUtil.instance.getErrorMessage(state.code) ?? '로그인에 실패했어요.')}',
                  fontSize: 12.0,
                  color: const Color(0xFFFF3F3F),
                  fontWeight: FontWeight.w400,
                ),
              const SizedBox(
                height: 15.0,
              ),
              SizedBox(
                width: double.infinity,
                height: 56.0,
                child: OutlinedButton(
                  onPressed: state is UserModelLoading
                      ? null
                      : () async {
                    final id = idController.text.trim(),
                        password = passwordController.text.trim();
                    logger.d('id:$id / pw:$password');

                    await ref
                        .read(loginViewModelProvider.notifier)
                        .login(
                      id: id,
                      password: password,
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color(0xffffB052),
                    foregroundColor: const Color(0xffffffff),
                    side: const BorderSide(
                        width: 0.0, color: Colors.transparent),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                  child: TextFontWidget.fontRegular(
                    '로그인',
                    fontSize: 18.0,
                    color: const Color(0xFFFFFFFF),
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      context.go('/login/find_id');
                    },
                    child: TextFontWidget.fontRegular(
                      '아이디 찾기',
                      fontSize: 12.0,
                      color: const Color(0xFF767676),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    width: 2.0,
                    height: 14.0,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Color(0xFFDBDBDB),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context.go('/login/find_pw');
                    },
                    child: TextFontWidget.fontRegular(
                      '비밀번호 찾기',
                      fontSize: 12.0,
                      color: const Color(0xFF767676),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    width: 2.0,
                    height: 14.0,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Color(0xFFDBDBDB),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context.go('/login/sign_up_option');
                    },
                    child: TextFontWidget.fontRegular(
                      '회원가입',
                      fontSize: 12.0,
                      color: const Color(0xFF767676),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}