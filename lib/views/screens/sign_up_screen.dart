// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:usw_circle_link/const/data.dart';
import 'package:usw_circle_link/models/circle_list_model.dart';
import 'package:usw_circle_link/models/sign_up_model.dart';
import 'package:usw_circle_link/utils/dialog_manager.dart';
import 'package:usw_circle_link/utils/error_util.dart';
import 'package:usw_circle_link/utils/logger/Logger.dart';
import 'package:usw_circle_link/viewmodels/sign_up_view_model.dart';
import 'package:usw_circle_link/views/screens/policy_scren.dart';
import 'package:usw_circle_link/views/widgets/rounded_rext_field.dart';
import 'package:usw_circle_link/views/widgets/text_font_widget.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  SignUpScreen({Key? key, this.newMemberSignUp = true, this.selectedCircles})
      : super(key: key);

  bool newMemberSignUp;
  List<CircleListData>? selectedCircles;

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  late final List<CircleListData> _selectedCircles;
  late final bool _newMemberSignUp;

  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController studentNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool passwordVisible = false;
  bool passwordConfirmVisible = false;

  bool idVerified = false;

  bool privacyPolicyAgree = false;
  bool personalInformationCollectionAndUsageAgreementAgree = false;
  bool termsOfServiceAgree = false;

  String id = "",
      password = "",
      name = "",
      phoneNumber = "",
      studentNumber = "";
  String? college;
  String? major;

  final idFocusNode = FocusNode();

  @override
  void initState() {
    logger.d(widget.selectedCircles?.first.clubName);
    _newMemberSignUp = widget.newMemberSignUp;
    _selectedCircles = widget.selectedCircles ?? [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(signUpViewModelProvider);
    ref.listen(signUpViewModelProvider, (previous, next) {
      logger.d(next);
      next.when(
        data: (data) {
          switch (data?.type) {
            case SignUpModelType.verify:
              // 아이디 중복확인 완료!
              DialogManager.instance.showAlertDialog(
                  context: context,
                  content: '아이디 사용이 가능합니다!',
                  onLeftButtonPressed: () {});
              idFocusNode.unfocus();
              setState(() {
                idVerified = true;
              });
              break;
            case SignUpModelType.checkProfileIsExist:
              // 회원가입 성공 -> 이메일 인증으로 이동
              context.go(
                  '/login/sign_up_option/sign_up/email_verification?account=$id&password=${Uri.encodeComponent(password)}&userName=$name&telephone=$phoneNumber&studentNumber=$studentNumber&major=$major');
              break;
            case SignUpModelType.signUpExistingMember:
              // 회원가입 성공 -> 로그인 화면으로 이동
              DialogManager.instance.showAlertDialog(
                context: context,
                content: '회원 가입 요청이 전송 되었습니다.\n동아리 회장의 요청 수락을 대기해주세요.',
                onLeftButtonPressed: () {
                  context.go('/login');
                },
              );
              break;
            default: // null
          }
        },
        error: (_error, stackTrace) {
          final error = _error as SignUpModelError;
          switch (error.type) {
            case SignUpModelType.verify:
              // 아이디 중복확인 실패!
              DialogManager.instance.showAlertDialog(
                context: context,
                content: ErrorUtil.instance.getErrorMessage(error.code) ??
                    '중복확인 중에 문제가 발생했습니다\n잠시후 다시 시도해주세요!',
              );
              break;
            case SignUpModelType.checkProfileIsExist:
            case SignUpModelType.signUpExistingMember:
              // 회원가입 실패!
              if (ErrorUtil.instance
                      .isValidOrNull(error.code, FieldType.account) ==
                  null) {
                DialogManager.instance.showAlertDialog(
                  context: context,
                  content: ErrorUtil.instance.getErrorMessage(error.code) ??
                      '회원가입 중에 문제가 발생했습니다\n잠시후 다시 시도해주세요!',
                );
              }
              break;
            default: // 예외발생!
              logger.e('예외발생! - $error');
          }
        },
        loading: () {},
      );
    });

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
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
                  '${_newMemberSignUp ? "신규" : "기존 동아리"} 회원 가입',
                  fontSize: 18.sp,
                  color: Color(0xFF111111),
                  fontWeight: FontWeight.w800,
                ),
                SizedBox(width: 52.w, height: 52.h)
              ],
            ),
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            margin: EdgeInsets.only(bottom: 10.h),
            height: 56.h,
            child: OutlinedButton(
              onPressed: state.isLoading
                  ? null
                  : () async {
                      if (idVerified &&
                          termsOfServiceAgree &&
                          privacyPolicyAgree &&
                          personalInformationCollectionAndUsageAgreementAgree) {
                        id = idController.text.trim();
                        password = passwordController.text.trim();
                        final passwordConfirm =
                            passwordConfirmController.text.trim();
                        name = nameController.text.trim();
                        phoneNumber = phoneNumberController.text.trim();
                        studentNumber = studentNumberController.text.trim();
                        final email = emailController.text.trim();
                        final _major =
                            (major ?? "").trim(); // major 관련 에러 메시지 처리 때문에
                        if (_newMemberSignUp) {
                          await ref
                              .read(signUpViewModelProvider.notifier)
                              .signUpTemporary(
                                id: id,
                                password: password,
                                passwordConfirm: passwordConfirm,
                                username: name,
                                telephone: phoneNumber,
                                studentNumber: studentNumber,
                                major: _major,
                              );
                        } else {
                          await ref
                              .read(signUpViewModelProvider.notifier)
                              .signUpExistingMember(
                                account: id,
                                password: password,
                                passwordConfirm: passwordConfirm,
                                username: name,
                                telephone: phoneNumber,
                                studentNumber: studentNumber,
                                major: _major,
                                email: email,
                                clubs: _selectedCircles,
                              );
                        }
                      } else if (!idVerified) {
                        // 아이디 중복확인 필요
                        DialogManager.instance.showAlertDialog(
                          context: context,
                          content: '아이디 중복확인이 필요합니다.',
                        );
                      } else if (!termsOfServiceAgree) {
                        DialogManager.instance.showAlertDialog(
                          context: context,
                          content: '서비스 이용약관에 동의가 필요합니다.',
                        );
                      } else if (!privacyPolicyAgree) {
                        DialogManager.instance.showAlertDialog(
                          context: context,
                          content: '개인정보 처리방침에 동의가 필요합니다.',
                        );
                      } else if (!personalInformationCollectionAndUsageAgreementAgree) {
                        DialogManager.instance.showAlertDialog(
                          context: context,
                          content: '개인정보 수집 동의가 필요합니다.',
                        );
                      }
                    },
              style: OutlinedButton.styleFrom(
                backgroundColor: accentColor,
                foregroundColor: const Color(0xFFFFFFFF),
                side: BorderSide.none,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: TextFontWidget.fontRegular(
                state.isLoading ? '로딩중...' : '다음',
                fontSize: 18.sp,
                color: const Color(0xFFFFFFFF),
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 40.h),
            padding: EdgeInsets.only(left: 32.w, right: 32.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RoundedTextField(
                  height: 50.h,
                  focusNode: idFocusNode,
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
                  borderColor: state.hasError &&
                          !ErrorUtil.instance.isValid(
                              (state.error as SignUpModelError).code,
                              FieldType.account)
                      ? const Color(0xFFFF3F3F)
                      : null,
                  isAnimatedHint: false,
                  onChanged: (value) {
                    ref.read(signUpViewModelProvider.notifier).initState();
                    setState(() {
                      idVerified = false;
                    });
                  },
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
                      right: 8.w,
                    ),
                    width: 83.w,
                    //height: 38.h, //not working -> margin으로 높이 조절
                    child: OutlinedButton(
                      onPressed: state.isLoading
                          ? null
                          : () async {
                              final id = idController.text.trim();
                              await ref
                                  .read(signUpViewModelProvider.notifier)
                                  .verifyId(id: id);
                            },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: const Color(0xffffB052),
                        foregroundColor: Colors.white,
                        side: const BorderSide(
                          color: Colors.transparent,
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
                        '중복 확인',
                        fontSize: 14.sp,
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  hintStyle: TextFontWidget.fontRegularStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                RoundedTextField(
                  height: 50.h,
                  textEditController: passwordController,
                  leftBottomCornerRadius: 0.r,
                  rightBottomCornerRadius: 0.r,
                  leftTopCornerRadius: 0.r,
                  rightTopCornerRadius: 0.r,
                  borderColor: state.hasError &&
                          !ErrorUtil.instance.isValid(
                              (state.error as SignUpModelError).code,
                              FieldType.password)
                      ? const Color(0xFFFF3F3F)
                      : null,
                  borderWidth: 1.w,
                  maxLines: 1,
                  textInputType: TextInputType.text,
                  obscureText: !passwordVisible,
                  textInputAction: TextInputAction.next,
                  textAlign: TextAlign.left,
                  hintText: '영어,숫자,특수문자 포함 5~20자',
                  isAnimatedHint: false,
                  onChanged: (value) {
                    ref.read(signUpViewModelProvider.notifier).initState();
                  },
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
                  hintStyle: TextFontWidget.fontRegularStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                RoundedTextField(
                  height: 50.h,
                  textEditController: passwordConfirmController,
                  leftBottomCornerRadius: 8.r,
                  rightBottomCornerRadius: 8.r,
                  leftTopCornerRadius: 0.r,
                  rightTopCornerRadius: 0.r,
                  borderColor: state.hasError &&
                          !ErrorUtil.instance.isValid(
                              (state.error as SignUpModelError).code,
                              FieldType.passwordConfirm)
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
                  onChanged: (value) {
                    ref.read(signUpViewModelProvider.notifier).initState();
                  },
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
                  hintStyle: TextFontWidget.fontRegularStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                if (state.hasError &&
                    isAnyFieldError(
                      (state.error as SignUpModelError),
                      [
                        FieldType.account,
                        FieldType.password,
                        FieldType.passwordConfirm,
                      ],
                    ))
                  TextFontWidget.fontRegular(
                    '* ${ErrorUtil.instance.getErrorMessage((state.error as SignUpModelError).code)}',
                    fontSize: 12.sp,
                    color: const Color(0xFFFF3F3F),
                    fontWeight: FontWeight.w400,
                  ),
                SizedBox(
                  height: 36.h,
                ),
                RoundedTextField(
                  height: 50.h,
                  textInputAction: TextInputAction.next,
                  textEditController: nameController,
                  leftBottomCornerRadius: 0.r,
                  rightBottomCornerRadius: 0.r,
                  leftTopCornerRadius: 8.r,
                  rightTopCornerRadius: 8.r,
                  borderColor: state.hasError &&
                          !ErrorUtil.instance.isValid(
                              (state.error as SignUpModelError).code,
                              FieldType.username)
                      ? const Color(0xFFFF3F3F)
                      : null,
                  borderWidth: 1.w,
                  maxLines: 1,
                  textInputType: TextInputType.text,
                  textAlign: TextAlign.left,
                  hintText: '이름',
                  isAnimatedHint: false,
                  onChanged: (value) {
                    ref.read(signUpViewModelProvider.notifier).initState();
                  },
                  prefixIcon: SvgPicture.asset(
                    'assets/images/ic_person.svg',
                    width: 13.w,
                    height: 16.h,
                    fit: BoxFit.scaleDown,
                  ),
                  hintStyle: TextFontWidget.fontRegularStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                RoundedTextField(
                  height: 50.h,
                  textEditController: phoneNumberController,
                  leftBottomCornerRadius: 0.r,
                  rightBottomCornerRadius: 0.r,
                  leftTopCornerRadius: 0.r,
                  rightTopCornerRadius: 0.r,
                  borderColor: state.hasError &&
                          !ErrorUtil.instance.isValid(
                              (state.error as SignUpModelError).code,
                              FieldType.telephone)
                      ? const Color(0xFFFF3F3F)
                      : null,
                  borderWidth: 1.w,
                  maxLines: 1,
                  textInputType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  textAlign: TextAlign.left,
                  hintText: '전화번호 (- 제외입력)',
                  isAnimatedHint: false,
                  onChanged: (value) {
                    ref.read(signUpViewModelProvider.notifier).initState();
                  },
                  prefixIcon: SvgPicture.asset(
                    'assets/images/ic_phone.svg',
                    width: 13.w,
                    height: 16.h,
                    fit: BoxFit.scaleDown,
                  ),
                  hintStyle: TextFontWidget.fontRegularStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                RoundedTextField(
                  height: 50.h,
                  textEditController: studentNumberController,
                  leftBottomCornerRadius: 0.r,
                  rightBottomCornerRadius: 0.r,
                  leftTopCornerRadius: 0.r,
                  rightTopCornerRadius: 0.r,
                  borderColor: state.hasError &&
                          !ErrorUtil.instance.isValid(
                              (state.error as SignUpModelError).code,
                              FieldType.studentNumber)
                      ? const Color(0xFFFF3F3F)
                      : null,
                  borderWidth: 1.w,
                  maxLines: 1,
                  textInputType: TextInputType.number,
                  textAlign: TextAlign.left,
                  textInputAction: TextInputAction.next,
                  hintText: '학번',
                  isAnimatedHint: false,
                  onChanged: (value) {
                    ref.read(signUpViewModelProvider.notifier).initState();
                  },
                  prefixIcon: SvgPicture.asset(
                    'assets/images/ic_tag.svg',
                    width: 13.w,
                    height: 16.h,
                    fit: BoxFit.scaleDown,
                  ),
                  hintStyle: TextFontWidget.fontRegularStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                RoundedTextField(
                  height: 50.h,
                  readOnly: true,
                  onTab: () async {
                    ref.read(signUpViewModelProvider.notifier).initState();
                    DialogManager.instance.showMajorPickerDialog(
                      context: context,
                      defaultCollege: college,
                      defaultMajor: major,
                      onChanged: (newCollege, newMajor) {
                        logger.d('onChanged - $newCollege / $newMajor');
                      },
                      onConfirmPressed: (college, major) {
                        setState(() {
                          this.college = college;
                          this.major = major;
                          logger.d('$college - $major');
                        });
                      },
                    );
                  },
                  borderColor: state.hasError &&
                          !ErrorUtil.instance.isValid(
                              (state.error as SignUpModelError).code,
                              FieldType.major)
                      ? const Color(0xFFFF3F3F)
                      : null,
                  leftBottomCornerRadius: _newMemberSignUp ? 8.r : 0.r,
                  rightBottomCornerRadius: _newMemberSignUp ? 8.r : 0.r,
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
                  hintStyle: TextFontWidget.fontRegularStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                if (!_newMemberSignUp)
                  RoundedTextField(
                    height: 50.h,
                    textEditController: emailController,
                    leftBottomCornerRadius: 8.r,
                    rightBottomCornerRadius: 8.r,
                    leftTopCornerRadius: 0.r,
                    rightTopCornerRadius: 0.r,
                    borderWidth: 1.w,
                    maxLines: 1,
                    textInputType: TextInputType.none,
                    textAlign: TextAlign.left,
                    textInputAction: TextInputAction.done,
                    hintText: "포털 이메일 입력",
                    isAnimatedHint: false,
                    borderColor: state.hasError &&
                            !ErrorUtil.instance.isValid(
                                (state.error as SignUpModelError).code,
                                FieldType.email)
                        ? const Color(0xFFFF3F3F)
                        : null,
                    suffixIcon: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Column(
                        // 높이 에 대해서 Unbounded Contraints 를 만들어주기 위함
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFontWidget.fontRegular('@suwon.ac.kr',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF989898)),
                        ],
                      ),
                    ),
                    prefixIcon: SvgPicture.asset(
                      'assets/images/ic_mail.svg',
                      width: 16.w,
                      height: 16.h,
                      fit: BoxFit.scaleDown,
                    ),
                    hintStyle: TextFontWidget.fontRegularStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                SizedBox(
                  height: 10.h,
                ),
                if (state.hasError &&
                    isAnyFieldError(
                      (state.error as SignUpModelError),
                      [
                        FieldType.username,
                        FieldType.telephone,
                        FieldType.studentNumber,
                        FieldType.major,
                        if (!_newMemberSignUp) FieldType.email,
                      ],
                    ))
                  TextFontWidget.fontRegular(
                    '* ${ErrorUtil.instance.getErrorMessage((state.error as SignUpModelError).code)}',
                    fontSize: 12.sp,
                    color: const Color(0xFFFF3F3F),
                    fontWeight: FontWeight.w400,
                  ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Checkbox(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.r))),
                      side: BorderSide(width: 1.w),
                      activeColor: accentColor,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity: const VisualDensity(
                        horizontal: VisualDensity.minimumDensity,
                        vertical: VisualDensity.minimumDensity,
                      ),
                      value: termsOfServiceAgree,
                      onChanged: (bool? value) async {
                        final agree = await DialogManager.instance
                            .showPolicyDialog(
                                context, PolicyType.termsOfService);
                        setState(() {
                          termsOfServiceAgree = agree;
                        });
                        logger.d('이용약관 동의함 : $termsOfServiceAgree');
                      },
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "서비스 이용약관을 확인했습니다.",
                        style: TextFontWidget.fontRegularStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF989898),
                        ),
                        children: [],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                TextFontWidget.fontRegular(
                  "동구라미는 수원대학교 학생을 위한 서비스이며, 인증을 통해\n만 14세 이상만 가입할 수 있습니다.",
                  fontSize: 10.sp,
                  textScaleFactor: 0.78, // 일정 폰트 크기 이하로 줄어들지 않을때 사용
                  fontWeight: FontWeight.w300,
                  color: Color(0xFFBFBFBF),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Checkbox(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.r))),
                      side: BorderSide(width: 1.w),
                      activeColor: accentColor,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity: const VisualDensity(
                        horizontal: VisualDensity.minimumDensity,
                        vertical: VisualDensity.minimumDensity,
                      ),
                      value: privacyPolicyAgree,
                      onChanged: (bool? value) async {
                        final agree = await DialogManager.instance
                            .showPolicyDialog(
                                context, PolicyType.privacyPolicy);
                        setState(() {
                          privacyPolicyAgree = agree;
                        });
                        logger.d('개인정보 처리 방침 동의함 : $privacyPolicyAgree');
                      },
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "개인 정보 처리 방침을 확인했습니다.",
                        style: TextFontWidget.fontRegularStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF989898),
                        ),
                        children: [],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Checkbox(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.r))),
                      side: BorderSide(width: 1.w),
                      activeColor: accentColor,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity: const VisualDensity(
                        horizontal: VisualDensity.minimumDensity,
                        vertical: VisualDensity.minimumDensity,
                      ),
                      value:
                          personalInformationCollectionAndUsageAgreementAgree,
                      onChanged: (bool? value) async {
                        final agree = await DialogManager.instance.showPolicyDialog(
                            context,
                            PolicyType
                                .personalInformationCollectionAndUsageAgreement);
                        setState(() {
                          personalInformationCollectionAndUsageAgreementAgree =
                              agree;
                        });
                        logger.d(
                            '개인정보 수집 동의함 : $personalInformationCollectionAndUsageAgreementAgree');
                      },
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "개인 정보 수집에 동의합니다.",
                        style: TextFontWidget.fontRegularStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF989898),
                        ),
                        children: [],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool isAnyFieldError(SignUpModelError error, List<FieldType> fieldTypes) {
    return fieldTypes
        .any((fieldType) => !ErrorUtil.instance.isValid(error.code, fieldType));
  }

  @override
  void dispose() {
    idController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
    nameController.dispose();
    phoneNumberController.dispose();
    studentNumberController.dispose();
    emailController.dispose();
    super.dispose();
  }
}
