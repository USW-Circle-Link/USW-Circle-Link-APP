// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:usw_circle_link/const/data.dart';
import 'package:usw_circle_link/utils/dialog_manager.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';
import 'package:usw_circle_link/views/screens/policy_screen.dart';
import 'package:usw_circle_link/widgets/detail_app_bar/detail_app_bar.dart';
import 'package:usw_circle_link/widgets/text_font_widget/text_font_widget.dart';

class PolicyAgreeScreen extends StatefulWidget {
  PolicyAgreeScreen({
    super.key,
    required this.newMemberSignUp,
  });
  bool newMemberSignUp;
  @override
  _PolicyAgreeScreenState createState() => _PolicyAgreeScreenState();
}

class _PolicyAgreeScreenState extends State<PolicyAgreeScreen> {
  bool olderThan14YearsOld = false;
  bool privacyPolicyAgree = false;
  bool personalInformationCollectionAndUsageAgreementAgree = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DetailAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFontWidget.fontRegular(
              '동구라미 이용약관에\n동의해주세요.',
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF111111),
            ),
            const SizedBox(height: 48.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Checkbox(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(2.0))),
                  side: const BorderSide(width: 1.0),
                  activeColor: accentColor,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  value: olderThan14YearsOld,
                  onChanged: (bool? value) {
                    setState(() {
                      olderThan14YearsOld = !olderThan14YearsOld;
                    });
                    logger.d('만 14세 이상 : $olderThan14YearsOld');
                  },
                  visualDensity: const VisualDensity(
                    horizontal: VisualDensity.minimumDensity,
                    vertical: VisualDensity.minimumDensity,
                  ),
                ),
                const SizedBox(width: 12.0),
                InkWell(
                  onTap: () async {
                    setState(() {
                      olderThan14YearsOld = !olderThan14YearsOld;
                    });
                    logger.d('만 14세 이상 : $olderThan14YearsOld');
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFontWidget.fontRegular(
                        "만 14세 이상입니다. (필수)",
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF111111),
                      ),
                      const SizedBox(height: 12.0),
                      TextFontWidget.fontRegular(
                        '동구라미는 수원대학교 학생을 위한 서비스이며,\n인증을 통해 만 14세 이상만 가입할 수 있습니다.',
                        fontSize: 12.0,
                        fontWeight: FontWeight.w300,
                        color: const Color(0xFF888888),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 28.0),
            // 서비스 이용약관
            Row(
              children: [
                Checkbox(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(2.0))),
                  value: privacyPolicyAgree,
                  onChanged: (bool? value) async {
                    final agree = await DialogManager.instance
                        .showPolicyDialog(context, PolicyType.termsOfService);
                    setState(() {
                      privacyPolicyAgree = agree;
                    });
                    logger.d('서비스 이용약관 동의함 : $privacyPolicyAgree');
                  },
                  visualDensity: const VisualDensity(
                    horizontal: VisualDensity.minimumDensity,
                    vertical: VisualDensity.minimumDensity,
                  ),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  side: const BorderSide(width: 1.0),
                  activeColor: accentColor,
                ),
                const SizedBox(width: 12.0),
                InkWell(
                  onTap: () async {
                    final agree = await DialogManager.instance
                        .showPolicyDialog(context, PolicyType.termsOfService);
                    setState(() {
                      privacyPolicyAgree = agree;
                    });
                    logger.d('서비스 이용약관 동의함 : $privacyPolicyAgree');
                  },
                  child: TextFontWidget.fontRegular(
                    "서비스 이용약관을 확인했습니다. (필수)",
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF111111),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 37.0),
            // 개인정보 수집 동의
            Row(
              children: [
                Checkbox(
                  value: personalInformationCollectionAndUsageAgreementAgree,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(2.0))),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  side: const BorderSide(width: 1.0),
                  activeColor: accentColor,
                  visualDensity: const VisualDensity(
                    horizontal: VisualDensity.minimumDensity,
                    vertical: VisualDensity.minimumDensity,
                  ),
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
                const SizedBox(width: 12.0),
                InkWell(
                  onTap: () async {
                    final agree = await DialogManager.instance.showPolicyDialog(
                        context,
                        PolicyType
                            .personalInformationCollectionAndUsageAgreement);
                    setState(() {
                      personalInformationCollectionAndUsageAgreementAgree =
                          agree;
                    });
                  },
                  child: TextFontWidget.fontRegular(
                    "개인 정보 수집에 동의합니다. (필수)",
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF111111),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24.0),
        height: 56.0,
        child: OutlinedButton(
          onPressed: olderThan14YearsOld &&
                  privacyPolicyAgree &&
                  personalInformationCollectionAndUsageAgreementAgree
              ? () {
                  context.go(
                      '/login/sign_up_option/policy_agree/${widget.newMemberSignUp ? "email_verification" : "select_circle"}');
                }
              : null,
          style: OutlinedButton.styleFrom(
            backgroundColor: olderThan14YearsOld &&
                    privacyPolicyAgree &&
                    personalInformationCollectionAndUsageAgreementAgree
                ? accentColor
                : const Color(0xFFB8B8B8),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            side: BorderSide.none,
          ),
          child: TextFontWidget.fontRegular(
            '다음',
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
