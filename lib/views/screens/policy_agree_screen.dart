import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:usw_circle_link/const/data.dart';
import 'package:usw_circle_link/utils/dialog_manager.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';
import 'package:usw_circle_link/views/screens/policy_scren.dart';
import 'package:usw_circle_link/views/widgets/text_font_widget.dart';

class PolicyAgreeScreen extends StatefulWidget {
  @override
  _PolicyAgreeScreenState createState() => _PolicyAgreeScreenState();
}

class _PolicyAgreeScreenState extends State<PolicyAgreeScreen> {
  bool olderThan14YearsOld = false;
  bool privacyPolicyAgree = false;
  bool personalInformationCollectionAndUsageAgreementAgree = false;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 0.0,
          title: Padding(
            padding: EdgeInsets.only(left: 22.w),
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
        body: Padding(
          padding: EdgeInsets.all(24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFontWidget.fontRegular(
                '동구라미 이용약관에\n동의해주세요.',
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF111111),
              ),
              SizedBox(height: 48.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Checkbox(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(2.r))),
                    side: BorderSide(width: 1.w),
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
                  SizedBox(width: 12.w),
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
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF111111),
                        ),
                        SizedBox(height: 12.h),
                        TextFontWidget.fontRegular(
                          '동구라미는 수원대학교 학생을 위한 서비스이며,\n인증을 통해 만 14세 이상만 가입할 수 있습니다.',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w300,
                          color: const Color(0xFF888888),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 28.h),
              // 서비스 이용약관
              Row(
                children: [
                  Checkbox(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(2.r))),
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
                    side: BorderSide(width: 1.w),
                    activeColor: accentColor,
                  ),
                  SizedBox(width: 12.w),
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
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF111111),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 37.h),
              // 개인정보 수집 동의
              Row(
                children: [
                  Checkbox(
                    value: personalInformationCollectionAndUsageAgreementAgree,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(2.r))),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    side: BorderSide(width: 1.w),
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
                  SizedBox(width: 12.w),
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
                      fontSize: 14.sp,
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
          margin: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 24.h),
          height: 56.h,
          child: OutlinedButton(
            onPressed: olderThan14YearsOld &&
                    privacyPolicyAgree &&
                    personalInformationCollectionAndUsageAgreementAgree
                ? () {
                    context.go(
                        '/login/sign_up_option/policy_agree/email_verification');
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
                borderRadius: BorderRadius.circular(8.r),
              ),
              side: BorderSide.none,
            ),
            child: TextFontWidget.fontRegular(
              '다음',
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
