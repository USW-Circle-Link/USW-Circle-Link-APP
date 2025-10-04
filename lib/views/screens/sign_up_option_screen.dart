import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:usw_circle_link/const/data.dart';
import 'package:usw_circle_link/utils/dialog_manager.dart';
import 'package:usw_circle_link/views/widgets/text_font_widget.dart';

class SignUpOptionScreen extends ConsumerStatefulWidget {
  const SignUpOptionScreen({Key? key}) : super(key: key);

  @override
  _SignUpOptionScreenState createState() => _SignUpOptionScreenState();
}

class _SignUpOptionScreenState extends ConsumerState<SignUpOptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 0.0,
        title: Padding(
          padding: const EdgeInsets.only(left: 22.0),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
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
          margin: const EdgeInsets.only(top: 60.0),
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
              const SizedBox(height: 10.0),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Image.asset('assets/images/dongurami.png',
                      width: 24.0, height: 24.0, fit: BoxFit.contain),
                  const SizedBox(width: 4.0),
                  TextFontWidget.jalnan2(
                    '동구라미',
                    fontSize: 20.0,
                    color: const Color(0xffFFC01D),
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
              const SizedBox(height: 40.0),
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 16.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFontWidget.fontRegular(
                      '신규 회원',
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                    const SizedBox(height: 8.0),
                    TextFontWidget.fontRegular(
                      '아직 중앙동아리 회원이 아니신가요?',
                      fontSize: 12.0,
                      color: Colors.black54,
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(height: 16.0),
                    SizedBox(
                      width: double.infinity,
                      height: 40.0,
                      child: OutlinedButton(
                        onPressed: () {
                          context.go(
                            '/login/sign_up_option/policy_agree?newMemberSignUp=true',
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: const Color(0xffffB052),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          side: BorderSide.none,
                        ),
                        child: TextFontWidget.fontRegular(
                          '신규 회원으로 가입',
                          fontSize: 14.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 16.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFontWidget.fontRegular(
                      '기존 동아리 회원',
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                    const SizedBox(height: 8.0),
                    TextFontWidget.fontRegular(
                      '현재 중앙동아리 회원이신가요?',
                      fontSize: 12.0,
                      color: Colors.black54,
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(height: 16.0),
                    SizedBox(
                      width: double.infinity,
                      height: 40.0,
                      child: OutlinedButton(
                        onPressed: () {
                          DialogManager.instance.showAlertDialog(
                            context: context,
                            content:
                                '기존 동아리 회원 가입의 경우\n해당 동아리 회장의 가입 요청 수락 후\n로그인이 가능합니다.',
                            onLeftButtonPressed: () {
                              context.go(
                                '/login/sign_up_option/policy_agree?newMemberSignUp=false',
                              );
                            },
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: const Color(0xff404040),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          side: BorderSide.none,
                        ),
                        child: TextFontWidget.fontRegular(
                          '기존 회원으로 가입',
                          fontSize: 14.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFontWidget.fontRegular(
                    '이미 회원이신가요? ',
                    fontSize: 12.0,
                    color: const Color(0xFFA9A9A9),
                    fontWeight: FontWeight.w400,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    onPressed: () {
                      context.go('/login');
                    },
                    child: TextFontWidget.fontRegular(
                      '로그인',
                      fontSize: 12.0,
                      color: accentColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
