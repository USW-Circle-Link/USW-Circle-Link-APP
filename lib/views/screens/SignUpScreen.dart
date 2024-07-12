import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:usw_circle_link/views/screens/EmailVerificationScreen.dart';
import 'package:usw_circle_link/views/widgets/RoundedDropdown.dart';
import 'package:usw_circle_link/views/widgets/RoundedTextField.dart';
import 'package:usw_circle_link/views/widgets/TextFontWidget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController studentNumberController = TextEditingController();

  bool passwordVisible = false;
  bool passwordConfirmVisible = false;

  String errorMessage = "";
  bool errorMessageVisivility = false;

  bool idIsInvalid = false;
  bool pwIsInvalid = false;
  bool pwConfirmIsInvalid = false;

  bool nameIsInvalid = false;
  bool phoneNumberIsInvalid = false;
  bool studentNumberIsInvalid = false;

  String? college;
  String? major;

  String? selectedCollege;
  String? selectedMajor;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                          text: '회원가입',
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
                      RoundedTextField(
                        height: 50.h,
                        textInputAction: TextInputAction.next,
                        textEditController: idController,
                        leftBottomCornerRadius: 0.r,
                        rightBottomCornerRadius: 0.r,
                        leftTopCornerRadius: 8.r,
                        rightTopCornerRadius: 8.r,
                        borderWidth: 1.w,
                        maxLines: 1,
                        textInputType: TextInputType.text,
                        textAlign: TextAlign.left,
                        hintText: '아이디 (4~16자)',
                        borderColor:
                            idIsInvalid ? const Color(0xFFFF3F3F) : null,
                        isAnimatedHint: false,
                        prefixIcon: SvgPicture.asset(
                          'assets/images/ic_person.svg',
                          width: 13.w,
                          height: 16.h,
                          fit: BoxFit.scaleDown,
                        ),
                        suffixIcon: Container(
                          margin: EdgeInsets.only(
                              top: 6.h, bottom: 6.h, right: 8.w),
                          width: 83.w,
                          //height: 38.h, //not working -> margin으로 높이 조절
                          child: OutlinedButton(
                            onPressed: () {
                              setState(() {
                                idIsInvalid = !idIsInvalid;
                                errorMessage = "* 아이디는 4자 이상 16자 이내로 작성해세요!";
                                errorMessageVisivility = idIsInvalid;
                              });
                            },
                            style: OutlinedButton.styleFrom(
                              backgroundColor: const Color(0xFF4F5BD0),
                              side: const BorderSide(
                                width: 0.0,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              minimumSize: Size.zero,
                              padding: EdgeInsets.zero,
                            ),
                            child: TextFontWidget.fontRegular(
                                text: '중복 확인',
                                fontSize: 14.sp,
                                color: Color(0xFFFFFFFF),
                                fontweight: FontWeight.w600),
                          ),
                        ),
                        hintStyle: TextStyle(
                            fontSize: 14.sp, fontFamily: 'Pretendard-Regular'),
                      ),
                      RoundedTextField(
                        height: 50.h,
                        textEditController: passwordController,
                        leftBottomCornerRadius: 0.r,
                        rightBottomCornerRadius: 0.r,
                        leftTopCornerRadius: 0.r,
                        rightTopCornerRadius: 0.r,
                        borderColor:
                            pwIsInvalid ? const Color(0xFFFF3F3F) : null,
                        borderWidth: 1.w,
                        maxLines: 1,
                        textInputType: TextInputType.text,
                        obscureText: !passwordConfirmVisible,
                        textInputAction: TextInputAction.next,
                        textAlign: TextAlign.left,
                        hintText: '비밀번호 (문자, 숫자 포함 6~20자)',
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
                        ),
                        hintStyle: TextStyle(
                            fontSize: 14.sp, fontFamily: 'Pretendard-Regular'),
                      ),
                      RoundedTextField(
                        height: 50.h,
                        textEditController: passwordConfirmController,
                        leftBottomCornerRadius: 8.r,
                        rightBottomCornerRadius: 8.r,
                        leftTopCornerRadius: 0.r,
                        rightTopCornerRadius: 0.r,
                        borderColor:
                            pwConfirmIsInvalid ? const Color(0xFFFF3F3F) : null,
                        borderWidth: 1.w,
                        maxLines: 1,
                        textInputType: TextInputType.text,
                        obscureText: !passwordConfirmVisible,
                        textInputAction: TextInputAction.next,
                        textAlign: TextAlign.left,
                        hintText: '비밀번호 확인',
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
                              passwordConfirmVisible = !passwordConfirmVisible;
                            });
                          },
                          icon: SvgPicture.asset(
                            passwordConfirmVisible
                                ? 'assets/images/ic_eye_open.svg'
                                : 'assets/images/ic_eye_slash.svg',
                            width: 25.w,
                            height: 25.h,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        hintStyle: TextStyle(
                            fontSize: 14.sp, fontFamily: 'Pretendard-Regular'),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Visibility(
                          visible: errorMessageVisivility,
                          child: TextFontWidget.fontRegular(
                              text: errorMessage,
                              fontSize: 12.sp,
                              color: const Color(0xFFFF3F3F),
                              fontweight: FontWeight.w400)),
                      SizedBox(
                        height: 15.h,
                      ),
                      RoundedTextField(
                        height: 50.h,
                        textInputAction: TextInputAction.next,
                        textEditController: idController,
                        leftBottomCornerRadius: 0.r,
                        rightBottomCornerRadius: 0.r,
                        leftTopCornerRadius: 8.r,
                        rightTopCornerRadius: 8.r,
                        borderColor:
                            nameIsInvalid ? const Color(0xFFFF3F3F) : null,
                        borderWidth: 1.w,
                        maxLines: 1,
                        textInputType: TextInputType.text,
                        textAlign: TextAlign.left,
                        hintText: '이름',
                        isAnimatedHint: false,
                        prefixIcon: SvgPicture.asset(
                          'assets/images/ic_person.svg',
                          width: 13.w,
                          height: 16.h,
                          fit: BoxFit.scaleDown,
                        ),
                        hintStyle: TextStyle(
                            fontSize: 14.sp, fontFamily: 'Pretendard-Regular'),
                      ),
                      RoundedTextField(
                        height: 50.h,
                        textEditController: passwordConfirmController,
                        leftBottomCornerRadius: 0.r,
                        rightBottomCornerRadius: 0.r,
                        leftTopCornerRadius: 0.r,
                        rightTopCornerRadius: 0.r,
                        borderColor: phoneNumberIsInvalid
                            ? const Color(0xFFFF3F3F)
                            : null,
                        borderWidth: 1.w,
                        maxLines: 1,
                        textInputType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        textAlign: TextAlign.left,
                        hintText: '전화번호 (- 제외입력)',
                        isAnimatedHint: false,
                        prefixIcon: SvgPicture.asset(
                          'assets/images/ic_phone.svg',
                          width: 13.w,
                          height: 16.h,
                          fit: BoxFit.scaleDown,
                        ),
                        hintStyle: TextStyle(
                            fontSize: 14.sp, fontFamily: 'Pretendard-Regular'),
                      ),
                      RoundedTextField(
                        height: 50.h,
                        textEditController: studentNumberController,
                        leftBottomCornerRadius: 0.r,
                        rightBottomCornerRadius: 0.r,
                        leftTopCornerRadius: 0.r,
                        rightTopCornerRadius: 0.r,
                        borderColor: studentNumberIsInvalid
                            ? const Color(0xFFFF3F3F)
                            : null,
                        borderWidth: 1.w,
                        maxLines: 1,
                        textInputType: TextInputType.number,
                        textAlign: TextAlign.left,
                        textInputAction: TextInputAction.next,
                        hintText: '학번',
                        isAnimatedHint: false,
                        prefixIcon: SvgPicture.asset(
                          'assets/images/ic_tag.svg',
                          width: 13.w,
                          height: 16.h,
                          fit: BoxFit.scaleDown,
                        ),
                        hintStyle: TextStyle(
                            fontSize: 14.sp, fontFamily: 'Pretendard-Regular'),
                      ),
                      RoundedTextField(
                        height: 50.h,
                        readOnly: true,
                        onTab: () async {
                          showCustomDialog(context);
                        },
                        leftBottomCornerRadius: 8.r,
                        rightBottomCornerRadius: 8.r,
                        leftTopCornerRadius: 0.r,
                        rightTopCornerRadius: 0.r,
                        borderWidth: 1.w,
                        maxLines: 1,
                        textInputType: TextInputType.none,
                        textAlign: TextAlign.left,
                        textInputAction: TextInputAction.done,
                        hintText: (selectedCollege == null || selectedMajor == null)?'학과':'${selectedCollege} ${selectedMajor}',
                        isAnimatedHint: false,
                        prefixIcon: SvgPicture.asset(
                          'assets/images/ic_bookmark.svg',
                          width: 13.w,
                          height: 16.h,
                          fit: BoxFit.scaleDown,
                        ),
                        hintStyle: TextStyle(
                            fontSize: 14.sp, fontFamily: 'Pretendard-Regular'),
                      ),
                      SizedBox(
                        height: 90.h,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 56.h,
                        child: OutlinedButton(
                            onPressed: () {
                              setState(() {
                                // pwIsInvalid = !pwIsInvalid;
                                // errorMessage =
                                //     "* 비밀번호는 문자, 숫자를 포함한 6~20 이내로 작성해주세요!";
                                // errorMessageVisivility = pwIsInvalid;
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          EmailVerificationScreen()));
                            },
                            style: OutlinedButton.styleFrom(
                              backgroundColor: const Color(0xFF000000),
                              side: const BorderSide(
                                width: 0.0,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            child: TextFontWidget.fontRegular(
                                text: '다음',
                                fontSize: 18.sp,
                                color: const Color(0xFFFFFFFF),
                                fontweight: FontWeight.w600)),
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 19.w),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "회원가입 시 ",
                            style: TextStyle(
                                fontFamily: 'Pretendard-Regular',
                                fontSize: 12.sp,
                                color: const Color(0xFF989898),
                                fontWeight: FontWeight.w400),
                            children: const [
                              TextSpan(
                                text: "서비스 이용약관 ",
                                style: TextStyle(
                                    color: Color(0xFF6E6EDE),
                                    fontWeight: FontWeight.w600),
                              ),
                              TextSpan(
                                text: '및 ',
                              ),
                              TextSpan(
                                text: "개인정보 처리방침",
                                style: TextStyle(
                                    color: Color(0xFF6E6EDE),
                                    fontWeight: FontWeight.w600),
                              ),
                              TextSpan(
                                text: '에 동의하신 것으로 간주됩니다',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }

  void showCustomDialog(BuildContext context) async {
    final result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                RoundedDropdown(
                  initValue: selectedCollege,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedCollege = newValue;
                    });
                  },
                  items: <String>['College 1', 'College 2', 'College 3'],
                  hintText: '단과대학 선택',
                  leftTopCornerRadius: 8.r,
                  leftBottomCornerRadius: 8.r,
                  rightTopCornerRadius: 8.r,
                  rightBottomCornerRadius: 8.r,
                  borderColor: Color(0xFFCECECE),
                  borderWidth: 1.w,
                  marginTop: 32.h,
                  marginLeft: 16.w,
                  marginRight: 16.w,
                ),
                SizedBox(height: 8),
                RoundedDropdown(
                  initValue: selectedMajor,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedMajor = newValue;
                    });
                  },
                  items: <String>['Major 1', 'Major 2', 'Major 3'],
                  hintText: '학부(학과) 선택',
                  leftTopCornerRadius: 8.r,
                  leftBottomCornerRadius: 8.r,
                  rightTopCornerRadius: 8.r,
                  rightBottomCornerRadius: 8.r,
                  borderColor: Color(0xFFCECECE),
                  borderWidth: 1.w,
                  marginLeft: 16.w,
                  marginRight: 16.w,
                ),
                SizedBox(height: 20),
                SizedBox.fromSize(
                  size: Size.fromHeight(1.h),
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Color(0xFFCECECE)),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(
                        {'college': selectedCollege, 'major': selectedMajor});
                  },
                  style: TextButton.styleFrom(
                    minimumSize: Size.fromHeight(50.h),
                    //primary: Colors.white,
                    //onPrimary: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                          top: Radius.zero, bottom: Radius.circular(15.r)),
                    ),
                  ),
                  child: TextFontWidget.fontRegular(
                    text: "확인",
                    color: Color(0xFF0085FF),
                    fontSize: 18.sp,
                    fontweight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    setState(() {
      if (result != null) {
        college = result['college'];
        major = result['major'];
        debugPrint('${college} - ${major}');
        debugPrint('${selectedCollege} - ${selectedMajor}');
      }
    });
  }
}
