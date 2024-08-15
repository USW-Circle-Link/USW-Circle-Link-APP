import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:usw_circle_link/const/data.dart';
import 'package:usw_circle_link/models/SignUpModel.dart';
import 'package:usw_circle_link/models/UserModel.dart';
import 'package:usw_circle_link/utils/logger/Logger.dart';
import 'package:usw_circle_link/viewmodels/SignUpViewModel.dart';
import 'package:usw_circle_link/views/widgets/AlertTextDialog.dart';
import 'package:usw_circle_link/views/widgets/MajorPickerDialog.dart';
import 'package:usw_circle_link/views/widgets/RoundedTextField.dart';
import 'package:usw_circle_link/views/widgets/TextFontWidget.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController studentNumberController = TextEditingController();

  bool passwordVisible = false;
  bool passwordConfirmVisible = false;

  bool idVerified = false;

  String? college;
  String? major;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(signUpViewModelProvider);
    ref.listen(signUpViewModelProvider, (previous, next) {
      logger.d(next);
      if (next is SignUpModel) {
        switch (next.type) {
          case SignUpModelType.verify:
            // 아이디 중복확인 완료!
            showAlertDialog(context, '아이디 사용이 가능합니다!');
            setState(() {
              idVerified = true;
            });
            break;
          case SignUpModelType.validatePasswordMatch:
            // 회원가입 성공 -> 이메일 인증으로 이동
            context.go(
                '/login/sign_up/email_verification?account=${idController.text}&password=${passwordController.text}&userName=${nameController.text}&telephone=${phoneNumberController.text.addDash()}&studentNumber=${studentNumberController.text}&major=$major');
            break;
          default: // 예외발생!
            logger.e('예외발생! - $next');
        }
      } else if (next is SignUpModelError) {
        switch (next.type) {
          case SignUpModelType.verify:
            // 아이디 중복확인 실패!
            if (next.code == null) {
              showAlertDialog(context, '중복확인 중에 문제가 발생했습니다\n잠시후 다시 시도해주세요!');
            }
            break;
          case SignUpModelType.validatePasswordMatch:
            // 회원가입 실패!
            break;
          default: // 예외발생!
            logger.e('예외발생! - $next');
        }
      }
    });

    idController.addListener(() {
      ref.read(signUpViewModelProvider.notifier).initState();
      setState(() {
        idVerified = false;
      });
    });

    passwordController.addListener(() {
      ref.read(signUpViewModelProvider.notifier).initState();
    });

    passwordConfirmController.addListener(() {
      ref.read(signUpViewModelProvider.notifier).initState();
    });

    nameController.addListener(() {
      ref.read(signUpViewModelProvider.notifier).initState();
    });

    studentNumberController.addListener(() {
      ref.read(signUpViewModelProvider.notifier).initState();
    });

    phoneNumberController.addListener(() {
      ref.read(signUpViewModelProvider.notifier).initState();
    });

    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                titleSpacing: 0.0,
                title: Padding(
                  padding: EdgeInsets.only(
                      left: 22.w, right: 22.w), // icon에 10.w 정도의 여백이 기본적으로 존재
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
                        hintText: '아이디 (5~20자)',
                        borderColor:
                            idIsInvalid(state) ? const Color(0xFFFF3F3F) : null,
                        isAnimatedHint: false,
                        prefixIcon: SvgPicture.asset(
                          'assets/images/ic_person.svg',
                          width: 13.w,
                          height: 16.h,
                          fit: BoxFit.scaleDown,
                        ),
                        suffixIcon: Container(
                          margin: EdgeInsets.only(
                              // top : 4, bottom : 4
                              top: 6.h,
                              bottom: 6.h,
                              right: 8.w),
                          width: 83.w,
                          //height: 38.h, //not working -> margin으로 높이 조절
                          child: OutlinedButton(
                            onPressed: state is UserModelLoading
                                ? null
                                : () async {
                                    final id = idController.text.trim();
                                    await ref
                                        .read(signUpViewModelProvider.notifier)
                                        .verifyId(id: id);
                                  },
                            style: OutlinedButton.styleFrom(
                              backgroundColor: const Color(0xFF4F5BD0),
                              side: const BorderSide(
                                width: 0.0,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(16.r), // radius 18
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
                            pwIsInvalid(state) ? const Color(0xFFFF3F3F) : null,
                        borderWidth: 1.w,
                        maxLines: 1,
                        textInputType: TextInputType.text,
                        obscureText: !passwordVisible,
                        textInputAction: TextInputAction.next,
                        textAlign: TextAlign.left,
                        hintText: '문자,숫자,특수문자 포함 5~20자',
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
                        borderColor: pwConfirmIsInvalid(state)
                            ? const Color(0xFFFF3F3F)
                            : null,
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
                          visible: state is SignUpModelError,
                          child: TextFontWidget.fontRegular(
                              text: getErrorMessage(state),
                              fontSize: 12.sp,
                              color: const Color(0xFFFF3F3F),
                              fontweight: FontWeight.w400)),
                      SizedBox(
                        height: 15.h,
                      ),
                      RoundedTextField(
                        height: 50.h,
                        textInputAction: TextInputAction.next,
                        textEditController: nameController,
                        leftBottomCornerRadius: 0.r,
                        rightBottomCornerRadius: 0.r,
                        leftTopCornerRadius: 8.r,
                        rightTopCornerRadius: 8.r,
                        borderColor: nameIsInvalid(state)
                            ? const Color(0xFFFF3F3F)
                            : null,
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
                        textEditController: phoneNumberController,
                        leftBottomCornerRadius: 0.r,
                        rightBottomCornerRadius: 0.r,
                        leftTopCornerRadius: 0.r,
                        rightTopCornerRadius: 0.r,
                        borderColor: phoneNumberIsInvalid(state)
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
                        borderColor: studentNumberIsInvalid(state)
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
                          ref
                              .read(signUpViewModelProvider.notifier)
                              .initState();
                          showMajorPickerDialog(context);
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
                        hintText: (college == null && major == null)
                            ? '학과'
                            : '${college ?? ""} / ${major ?? ""}',
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
                            onPressed: state is UserModelLoading
                                ? null
                                : () async {
                                    if (idVerified && major != null) {
                                      await ref
                                          .read(
                                              signUpViewModelProvider.notifier)
                                          .signUpTemporary(
                                              id: idController.text.trim(),
                                              password: passwordController
                                                  .text
                                                  .trim(),
                                              passwordConfirm:
                                                  passwordConfirmController.text
                                                      .trim(),
                                              username:
                                                  nameController.text.trim(),
                                              telephone: phoneNumberController
                                                  .text
                                                  .trim(),
                                              studentNumber:
                                                  studentNumberController.text
                                                      .trim(),
                                              major: major!.trim());
                                    } else if (!idVerified) {
                                      // 아이디 중복확인 필요
                                      showAlertDialog(
                                          context, '아이디 중복확인이 필요합니다.');
                                    } else if (major == null) {
                                      showAlertDialog(
                                          context, '단과대학/학과를 선택해주세요.');
                                    }
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

  void showAlertDialog(BuildContext context, String text) async {
    await showDialog(
        context: context,
        builder: (_) => AlertTextDialog(
              text: text,
              onConfirmPressed: () {
                Navigator.of(context).pop();
              },
            ));
  }

  void showMajorPickerDialog(BuildContext context) async {
    final result = await showDialog(
      context: context,
      builder: (_) => MajorPickerDialog(
        colleges: colleges,
        majors: majors,
        selectedCollege: college,
        selectedMajor: major,
        onCollegeChanged: (String? newValue) {},
        onMajorChanged: (String? newValue) {},
        onConfirmPressed: (college, major) {
          Navigator.of(context).pop({'college': college, 'major': major});
        },
      ),
    );

    setState(() {
      if (result != null) {
        college = result['college'];
        major = result['major'];
        logger.d('$college - $major');
      }
    });
  }

  bool idIsInvalid(SignUpModelBase? state) {
    if (state is SignUpModelError) {
      switch (state.code) {
        case "USR-207":
        case "USR-F100":
          return true;
      }
    }
    return false;
  }

  bool pwIsInvalid(SignUpModelBase? state) {
    if (state is SignUpModelError) {
      switch (state.code) {
        case "USR-F200":
          return true;
      }
    }
    return false;
  }

  bool pwConfirmIsInvalid(SignUpModelBase? state) {
    if (state is SignUpModelError) {
      switch (state.code) {
        case "USR-F300":
          return true;
      }
    }
    return false;
  }

  bool nameIsInvalid(SignUpModelBase? state) {
    if (state is SignUpModelError) {
      switch (state.code) {
        case "USR-F400":
          return true;
      }
    }
    return false;
  }

  bool phoneNumberIsInvalid(SignUpModelBase? state) {
    if (state is SignUpModelError) {
      switch (state.code) {
        case "USR-F500":
          return true;
      }
    }
    return false;
  }

  bool studentNumberIsInvalid(SignUpModelBase? state) {
    if (state is SignUpModelError) {
      switch (state.code) {
        case "USR-F600":
          return true;
      }
    }
    return false;
  }

  bool collegeMajorIsInvalid(SignUpModelBase? state) {
    if (state is SignUpModelError) {
      switch (state.code) {
        case "USR-F700":
          return true;
      }
    }
    return false;
  }

  String getErrorMessage(SignUpModelBase? state) {
    if (state is SignUpModelError) {
      logger.d(state.code);
      switch (state.code) {
        case "USR-207":
          return "* 이미 존재하는 아이디입니다!";
        case "USR-212": // 새 비밀번호 확인 불일치
          return "* 비밀번호가 일치하지 않습니다!";
        case "USR-F100": // 아이디 규칙 X
          return "* 아이디는 5~20자 이내 숫자,문자만 가능합니다!";
        case "USR-F200": // 비밀번호 규칙 X
          return "* 비밀번호는 5~20자 이내 숫자,문자,특수문자만 가능합니다!";
        case "USR-F300": // 비밀번호 일치 X
          return "* 비밀번호가 일치하지 않습니다!";
        case "USR-F400": // 이름 공백
          return "* 이름이 형식에 맞지 않습니다!";
        case "USR-F500": // 전화번호 형식에 맞지 않음
          return "* 전화번호가 형식에 맞지 않습니다!";
        case "USR-F600": // 학번이 공백 혹은 8자리가 아님
          return "* 학번이 형식에 맞지 않습니다!";
        case "USR-F700": // 학과가 선택되지 않음
          return "* 단과대학/학과를 선택해주세요!";
        default:
          return "";
      }
    }
    return "";
  }

  @override
  void dispose() {
    idController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
    nameController.dispose();
    phoneNumberController.dispose();
    studentNumberController.dispose();
    super.dispose();
  }
}
