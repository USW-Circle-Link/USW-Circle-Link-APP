import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/models/profile_model.dart';
import 'package:usw_circle_link/utils/dialog_manager.dart';
import 'package:usw_circle_link/utils/icons/sign_up_icons_icons.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';
import 'package:usw_circle_link/viewmodels/update_profile_view_model.dart';
import 'package:usw_circle_link/widgets/detail_app_bar/detail_app_bar.dart';
import 'package:usw_circle_link/widgets/rounded_text_field/rounded_text_field.dart';
import 'package:usw_circle_link/widgets/text_font_widget/text_font_widget.dart';

class VerifyPasswordScreen extends ConsumerStatefulWidget {
  final Map<String, String>? profileData;
  const VerifyPasswordScreen({Key? key, required this.profileData})
      : super(key: key);

  @override
  _VerifyPasswordScreenState createState() => _VerifyPasswordScreenState();
}

class _VerifyPasswordScreenState extends ConsumerState<VerifyPasswordScreen> {
  final TextEditingController passwordController = TextEditingController();
  String? _passwordError; // 비밀번호 에러 메시지
  bool passwordVisible = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<ProfileModel>>(updateProfileViewModelProvider,
        (previous, next) {
      next.when(
        data: (profile) {
          if (profile.type == ProfileModelType.updateProfile) {
            Navigator.pop(context);
          }
        },
        error: (error, stackTrace) {
          logger.e('error: $error');
          if (error is ProfileModelError && error.code == "USR-204") {
            setState(() {
              _passwordError = "비밀번호가 일치하지 않습니다.";
            });
          }
        },
        loading: () {},
      );
    });
    final profileData = widget.profileData;
    logger.d('ProfileData: $profileData');

    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      resizeToAvoidBottomInset: false,
      appBar: const DetailAppBar(title: '내 정보 수정'),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(left: 32.0, right: 32.0, bottom: 16.0),
        width: double.infinity,
        height: 56.0,
        child: OutlinedButton(
          onPressed: () async {
            setState(() {
              _passwordError = null;
            });
            final password = passwordController.text.trim();
            logger.d('ProfileData: $profileData');
            if (password.isEmpty) {
              DialogManager.instance.showAlertDialog(
                context: context,
                content: "비밀번호를 입력해주세요.",
              );
              return;
            }
            if (profileData == null) {
              DialogManager.instance.showAlertDialog(
                context: context,
                content: "프로필 정보가 없습니다. 다시 시도해주세요.",
              );
              return;
            }
            // updateProfile 호출 (password 매개변수를 포함)
            await ref
                .read(updateProfileViewModelProvider.notifier)
                .updateProfile(
                  userName: profileData['name']!,
                  studentNumber: profileData['studentNumber']!,
                  userHp: profileData['userHp']!,
                  major: profileData['major']!,
                  password: password,
                );
          },
          style: OutlinedButton.styleFrom(
            backgroundColor: const Color(0xFFFFB052),
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
            '확인',
            fontSize: 18.0,
            color: const Color(0xFFFFFFFF),
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16.0),
              TextFontWidget.fontRegular(
                '비밀번호 확인',
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
              ),
              const SizedBox(height: 8.0),
              RoundedTextField(
                height: 50.0,
                obscureText: !passwordVisible,
                textEditController: passwordController,
                leftBottomCornerRadius: 8.0,
                rightBottomCornerRadius: 8.0,
                leftTopCornerRadius: 8.0,
                rightTopCornerRadius: 8.0,
                borderColor: const Color(0xffDBDBDB),
                borderWidth: 1.0,
                maxLines: 1,
                textInputType: TextInputType.text,
                textAlign: TextAlign.left,
                hintText: "비밀번호를 입력해주세요.",
                prefixIcon: const Icon(
                  SignUpIcons.ic_password,
                  color: Color(0xFF989898),
                  size: 15.0,
                ),
                suffixIcon: IconButton(
                  visualDensity: VisualDensity.compact,
                  constraints: const BoxConstraints(),
                  padding: EdgeInsets.zero,
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
                hintStyle: const TextStyle(
                  fontSize: 14.0,
                  fontFamily: 'SUIT',
                ),
              ),
              // 비밀번호 불일치 에러 메시지 영역 (빨간 텍스트)
              SizedBox(
                height: 25.0,
                child: _passwordError != null
                    ? Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          "* $_passwordError",
                          style: const TextStyle(
                              color: Colors.red, fontSize: 12.0, height: 1.0),
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
