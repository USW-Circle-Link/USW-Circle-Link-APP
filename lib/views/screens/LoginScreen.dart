import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:usw_circle_link/views/screens/FindPWScreen.dart';
import 'package:usw_circle_link/views/screens/SignUpScreen.dart';
import 'package:usw_circle_link/views/widgets/RoundedTextField.dart';
import 'package:usw_circle_link/views/widgets/TextFontWidget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 0.0,
          title: Padding( // TODO : icon padding 문제
            padding: EdgeInsets.only(left:22.w),
            child: Row(
              children: [
                IconButton(
              onPressed: () {
                // Navigate back to the previous screen by popping the current route
                Navigator.of(context).pop();
              },
              icon: SvgPicture.asset('assets/images/ic_back_arrow.svg',),
            ),
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
                Wrap(
                  children: [
                    SizedBox(
                      child: Image.asset('assets/images/duck.png',
                          width: 24.w, height: 24.h, fit: BoxFit.contain),
                    ),
                    SizedBox(width: 4.w),
                    TextFontWidget.jalnan2(
                        text: '동구라미',
                        fontSize: 20.sp,
                        color: const Color(0xffFFC01D),
                        fontweight: FontWeight.w400),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                RichText(
                  text: TextSpan(
                    text: "재밌있는 동아리 없을까?\n",
                    style: TextStyle(
                        fontFamily: 'Pretendard-Regular',
                        fontSize: 18.sp,
                        color: const Color(0xFF353549),
                        fontWeight: FontWeight.w400),
                    children: const [
                      TextSpan(text: "내 "),
                      TextSpan(
                        text: '취향',
                        style: TextStyle(
                            color: Color(0xFF6E6EDE),
                            fontWeight: FontWeight.w600),
                      ),
                      TextSpan(text: "에 딱 맞는 "),
                      TextSpan(
                        text: '동아리 찾기',
                        style: TextStyle(
                            color: Color(0xFF6E6EDE),
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                RoundedTextField(
                  textInputAction: TextInputAction.next,
                  textEditController: idController,
                  leftBottomCornerRadius: 16.r,
                  rightBottomCornerRadius: 16.r,
                  leftTopCornerRadius: 16.r,
                  rightTopCornerRadius: 16.r,
                  borderWidth: 1.w,
                  maxLines: 1,
                  textInputType: TextInputType.text,
                  textAlign: TextAlign.left,
                  hintText: '아이디',
                  isAnimatedHint: false,
                  prefixIcon: SvgPicture.asset(
                    'assets/images/ic_person.svg',
                    width: 13.w,
                    height: 16.h,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                RoundedTextField(
                    textEditController: passwordController,
                    leftBottomCornerRadius: 16.r,
                    rightBottomCornerRadius: 16.r,
                    leftTopCornerRadius: 16.r,
                    rightTopCornerRadius: 16.r,
                    borderWidth: 1.w,
                    maxLines: 1,
                    textInputType: TextInputType.text,
                    obscureText: !passwordVisible,
                    textAlign: TextAlign.left,
                    hintText: '비밀번호',
                    isAnimatedHint: false,
                    prefixIcon: SvgPicture.asset(
                      'assets/images/ic_password.svg',
                      width: 13.w,
                      height: 16.h,
                      fit: BoxFit.scaleDown,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          passwordVisible = !passwordVisible;
                        });
                      },
                      icon: SvgPicture.asset(
                        passwordVisible
                            ? 'assets/images/ic_eye_open.svg'
                            : 'assets/images/ic_eye_slash.svg',
                        width: 25.w,
                        height: 25.h,
                        fit: BoxFit.scaleDown,
                      ),
                    )),
                SizedBox(
                  height: 8.h,
                ),
                Visibility(
                    visible: false,
                    child: TextFontWidget.fontRegular(
                        text: "* 올바르지 않은 아이디 혹은 비밀번호입니다",
                        fontSize: 12.sp,
                        color: const Color(0xFFFF3F3F),
                        fontweight: FontWeight.w400)),
                SizedBox(
                  height: 15.h,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 56.h,
                  child: OutlinedButton(
                      onPressed: () {},
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
                          text: '로그인',
                          fontSize: 18.sp,
                          color: const Color(0xFFFFFFFF),
                          fontweight: FontWeight.w600)),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: TextFontWidget.fontRegular(
                            text: '아이디 찾기',
                            fontSize: 14.sp,
                            color: const Color(0xFF767676),
                            fontweight: FontWeight.w400)),
                    SizedBox(
                      width: 2.w,
                      height: 14.h,
                      child: const DecoratedBox(
                        decoration: BoxDecoration(
                          color: Color(0xFFDBDBDB),
                        ),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FindPWScreen()));
                        },
                        child: TextFontWidget.fontRegular(
                            text: '비밀번호 찾기',
                            fontSize: 14.sp,
                            color: const Color(0xFF767676),
                            fontweight: FontWeight.w400)),
                    SizedBox(
                      width: 2.w,
                      height: 14.h,
                      child: const DecoratedBox(
                        decoration: BoxDecoration(
                          color: Color(0xFFDBDBDB),
                        ),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
                        },
                        child: TextFontWidget.fontRegular(
                            text: '회원가입',
                            fontSize: 14.sp,
                            color: const Color(0xFF767676),
                            fontweight: FontWeight.w400))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
