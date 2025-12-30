import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:usw_circle_link/const/data.dart';
import 'package:usw_circle_link/main.dart';
import 'package:usw_circle_link/models/profile_model.dart';
import 'package:usw_circle_link/utils/dialog_manager.dart';
import 'package:usw_circle_link/utils/error_util.dart';
import 'package:usw_circle_link/utils/icons/sign_up_icons_icons.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';
import 'package:usw_circle_link/utils/regex/Regex.dart';
import 'package:usw_circle_link/viewmodels/update_profile_view_model.dart';
import 'package:usw_circle_link/widgets/detail_app_bar/detail_app_bar.dart';
import 'package:usw_circle_link/widgets/rounded_text_field/rounded_text_field.dart';
import 'package:usw_circle_link/widgets/text_font_widget/text_font_widget.dart';

class UpdateProfileScreen extends ConsumerStatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  _UpdateProfileScreenState createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends ConsumerState<UpdateProfileScreen>
    with RouteAware {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phonenumberController = TextEditingController();
  final TextEditingController studentnumberController = TextEditingController();
  String? college;
  String? major;

  String? nameError;
  String? phoneError;
  String? studentNumberError;
  String? majorError;

  //데이터가 다시 채워지는 걸 막기 위한 플래그
  bool _isInitialBindDone = false;
  bool _hasUserEdited = false;
  bool _isBinding = false;

  @override
  void initState() {
    super.initState();
    nameController.addListener(() {
      if (!_isBinding) _hasUserEdited = true;
    });
    phonenumberController.addListener(() {
      if (!_isBinding) _hasUserEdited = true;
    });
    studentnumberController.addListener(() {
      if (!_isBinding) _hasUserEdited = true;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final ModalRoute<dynamic>? route = ModalRoute.of(context);
    if (route is PageRoute) {
      routeObserver.subscribe(this, route);
    }
    ref.invalidate(updateProfileViewModelProvider);
    _isInitialBindDone = false;
  }

  @override
  void didPopNext() {
    setState(() {
      _isInitialBindDone = false;
    });
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    nameController.dispose();
    phonenumberController.dispose();
    studentnumberController.dispose();
    super.dispose();
  }

  void validateFields() {
    setState(() {
      // 이름 검증 (영어 또는 한글만 허용)
      final name = nameController.text.trim();
      if (name.isEmpty) {
        nameError = "이름을 입력해주세요. (특수문자 제외)";
      } else if (!nameRegExp.hasMatch(name)) {
        nameError = "올바른 이름을 입력해주세요. (특수문자 제외)";
      } else {
        nameError = null;
      }

      // 전화번호 검증 (11자리 숫자)
      final telephone = phonenumberController.text.trim();
      if (telephone.isEmpty) {
        phoneError = "전화번호를 입력해주세요. (- 제외 11자)";
      } else if (!telephoneRegExp.hasMatch(telephone)) {
        phoneError = "전화번호는 11자리 숫자여야 합니다. (- 제외)";
      } else {
        phoneError = null;
      }

      // 학번 검증 (8자리 숫자)
      final studentNum = studentnumberController.text.trim();
      if (studentNum.isEmpty) {
        studentNumberError = "학번을 입력해주세요. (숫자 8자)";
      } else if (!studentNumberRegExp.hasMatch(studentNum)) {
        studentNumberError = "학번은 8자리 숫자여야 합니다.";
      } else {
        studentNumberError = null;
      }

      // 학과 검증
      if (college == null || major == null) {
        majorError = "단과대/학부(학과)를 선택해주세요.";
      } else {
        majorError = null;
      }

      logger.d(
          "Validation Results: nameError=$nameError, phoneError=$phoneError, "
          "studentNumberError=$studentNumberError, majorError=$majorError");
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(updateProfileViewModelProvider);

    if (!_isInitialBindDone && !_hasUserEdited) {
      state.whenData((profile) {
        if (nameController.text.isEmpty &&
            phonenumberController.text.isEmpty &&
            studentnumberController.text.isEmpty) {
          bind(profile);
          _isInitialBindDone = true;
        }
      });
    }

    ref.listen(updateProfileViewModelProvider, (previous, next) {
      logger.d(next);
      next.when(
        data: (profile) {
          logger.d('data - $profile');
          switch (next.value?.type) {
            case ProfileModelType.getProfile:
              break;
            case ProfileModelType.updateProfile:
              DialogManager.instance.showAlertDialog(
                context: context,
                content: '수정이 완료되었습니다.',
                onLeftButtonPressed: () => context.pop(),
              );
              break;
            default:
          }
        },
        error: (error, stackTrace) async {
          error = (error as ProfileModelError);
          logger.d('error - $stackTrace');
          switch (error.type) {
            case ProfileModelType.getProfile:
              break;
            case ProfileModelType.updateProfile:
              if (error.code == "USR-204") {
                // USR-204는 다른 화면에서 처리
              } else {
                DialogManager.instance.showAlertDialog(
                  context: context,
                  content: ErrorUtil.instance.getErrorMessage(error.code) ??
                      "내 정보 수정 중 문제가 발생했습니다.\n잠시 후 다시 시도해주세요.",
                );
              }
              break;
            default:
          }
        },
        loading: () {
          logger.d('loading');
        },
      );
    });

    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      resizeToAvoidBottomInset: false,
      appBar: const DetailAppBar(title: '내 정보 수정'),
      body: state.when(
        data: (data) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 18),
                  // 이름 필드
                  TextFontWidget.fontRegular(
                    '이름',
                    color: const Color(0xff000000),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 1.12,
                  ),
                  SizedBox(height: 12),
                  RoundedTextField(
                    height: 50,
                    textEditController: nameController,
                    leftBottomCornerRadius: 8,
                    rightBottomCornerRadius: 8,
                    leftTopCornerRadius: 8,
                    rightTopCornerRadius: 8,
                    borderColor: nameError == null
                        ? const Color(0xffDBDBDB)
                        : Colors.red,
                    borderWidth: 1,
                    maxLines: 1,
                    textInputType: TextInputType.text,
                    textAlign: TextAlign.left,
                    hintText: "이름",
                    prefixIcon: Icon(
                      SignUpIcons.ic_person,
                      color: Color(0xFF989898),
                      size: 15,
                    ),
                    hintStyle: TextStyle(
                      fontSize: 14,
                      fontFamily: 'SUIT',
                    ),
                    textStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff707070),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                    child: nameError != null
                        ? Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: Text(
                              '* ' + nameError!,
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 12,
                                height: 1,
                              ),
                            ),
                          )
                        : null,
                  ),
                  SizedBox(height: 12),

                  // 전화번호 필드
                  TextFontWidget.fontRegular(
                    '전화번호',
                    color: const Color(0xff000000),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 1.12,
                  ),
                  SizedBox(height: 12),
                  RoundedTextField(
                    height: 50,
                    textEditController: phonenumberController,
                    leftBottomCornerRadius: 8,
                    rightBottomCornerRadius: 8,
                    leftTopCornerRadius: 8,
                    rightTopCornerRadius: 8,
                    borderColor: phoneError == null
                        ? const Color(0xffDBDBDB)
                        : Colors.red,
                    borderWidth: 1,
                    maxLines: 1,
                    textInputType: TextInputType.text,
                    textAlign: TextAlign.left,
                    prefixIcon: Icon(
                      SignUpIcons.ic_phone,
                      color: Color(0xFF989898),
                      size: 15,
                    ),
                    hintText: "전화번호 (- 제외입력)",
                    hintStyle: TextStyle(
                      fontSize: 14,
                      fontFamily: 'SUIT',
                    ),
                    textStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff707070),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                    child: phoneError != null
                        ? Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: Text(
                              '* ' + phoneError!,
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 12,
                                height: 1,
                              ),
                            ),
                          )
                        : null,
                  ),
                  SizedBox(height: 12),

                  // 학번 필드
                  TextFontWidget.fontRegular(
                    '학번',
                    color: const Color(0xff000000),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 1.12,
                  ),
                  SizedBox(height: 12),
                  RoundedTextField(
                    height: 50,
                    textEditController: studentnumberController,
                    leftBottomCornerRadius: 8,
                    rightBottomCornerRadius: 8,
                    leftTopCornerRadius: 8,
                    rightTopCornerRadius: 8,
                    borderColor: studentNumberError == null
                        ? const Color(0xffDBDBDB)
                        : Colors.red,
                    borderWidth: 1,
                    maxLines: 1,
                    textInputType: TextInputType.text,
                    textAlign: TextAlign.left,
                    prefixIcon: Icon(
                      SignUpIcons.ic_tag,
                      color: Color(0xFF989898),
                      size: 15,
                    ),
                    hintText: "학번",
                    hintStyle: TextStyle(
                      fontSize: 14,
                      fontFamily: 'SUIT',
                    ),
                    textStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff707070),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                    child: studentNumberError != null
                        ? Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: Text(
                              '* ' + studentNumberError!,
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 12,
                                height: 1,
                              ),
                            ),
                          )
                        : null,
                  ),
                  SizedBox(height: 12),

                  // 학과 필드
                  TextFontWidget.fontRegular(
                    '학부(학과)',
                    color: const Color(0xff000000),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 1.12,
                  ),
                  SizedBox(height: 12),
                  RoundedTextField(
                    height: 50,
                    readOnly: true,
                    onTab: () async {
                      // 드롭다운을 여는 순간 true
                      setState(() {
                        _hasUserEdited = true;
                      });
                      await DialogManager.instance.showMajorPickerDialog(
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
                            logger.d('${this.college} - ${this.major}');
                          });
                        },
                      );
                    },
                    leftBottomCornerRadius: 8,
                    rightBottomCornerRadius: 8,
                    leftTopCornerRadius: 8,
                    rightTopCornerRadius: 8,
                    borderColor: majorError == null
                        ? const Color(0xffDBDBDB)
                        : Colors.red,
                    borderWidth: 1,
                    maxLines: 1,
                    textInputType: TextInputType.none,
                    textAlign: TextAlign.left,
                    textInputAction: TextInputAction.done,
                    hintText: (college == null && major == null)
                        ? '단과대/학부(학과)'
                        : '${college ?? ""} / ${major ?? ""}',
                    isAnimatedHint: false,
                    prefixIcon: Icon(
                      SignUpIcons.ic_bookmark,
                      color: Color(0xFF989898),
                      size: 15,
                    ),
                    hintStyle: TextStyle(
                      fontSize: 14,
                      fontFamily: 'SUIT',
                    ),
                    textStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff707070),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                    child: majorError != null
                        ? Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: Text(
                              '* ' + majorError!,
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 12,
                                height: 1,
                              ),
                            ),
                          )
                        : null,
                  ),
                  SizedBox(height: 68),
                ],
              ),
            ),
          );
        },
        error: (error, _) {
          return Center(
            child: TextFontWidget.fontRegular(
              '내 정보를 불러오지 못했어요.\n잠시 후 다시 시도해주세요.',
              textAlign: TextAlign.center,
              fontSize: 14,
              color: Color(0xFFA1A1A1),
              fontWeight: FontWeight.w400,
            ),
          );
        },
        loading: () {
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(32, 12, 32, 12),
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 안내 문구
              TextFontWidget.fontRegular(
                '허위 정보 기재 시 서비스 이용에 제한이 있을 수 있습니다.',
                color: const Color(0xFF868686),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
              const SizedBox(height: 12),
              // 수정 완료 버튼
              SizedBox(
                width: double.infinity,
                height: 56,
                child: OutlinedButton(
                  onPressed: () {
                    validateFields();
                    if (nameError == null &&
                        phoneError == null &&
                        studentNumberError == null &&
                        majorError == null) {
                      final profileData = {
                        'name': nameController.text.trim(),
                        'userHp': phonenumberController.text.trim(),
                        'studentNumber': studentnumberController.text.trim(),
                        'major': major ?? '',
                      };
                      logger.d('ProfileData: $profileData');
                      context.go('/update_profile/verify_password',
                          extra: profileData);
                    }
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFB052),
                    foregroundColor: const Color(0xFFFFFFFF),
                    side:
                        const BorderSide(color: Colors.transparent, width: 0.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: TextFontWidget.fontRegular(
                    '수정 완료',
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              // 회원 탈퇴 버튼
              TextButton(
                onPressed: () {
                  context.go('/update_profile/delete_user');
                },
                child: TextFontWidget.fontRegular(
                  '회원 탈퇴',
                  color: const Color(0xffABABAB),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool isValid(AsyncValue<ProfileModel> state, FieldType fieldType) {
    final error = state.error as ProfileModelError?;
    return ErrorUtil.instance.isValid(error?.code, fieldType);
  }

  void bind(ProfileModel profile) {
    _isBinding = true;
    nameController.text = profile.data.userName;
    phonenumberController.text = profile.data.userHp;
    studentnumberController.text = profile.data.studentNumber;
    setState(() {
      major = profile.data.major;
      college = majors.findCollegeByMajor(major);
    });
    _isBinding = false;
  }
}

extension FindCollegeByMajor on Map<String, List> {
  String? findCollegeByMajor(String? target) {
    if (target == null) return null;
    for (var entry in entries) {
      for (var major in entry.value) {
        if (major == target) return entry.key;
      }
    }
    return null;
  }
}
