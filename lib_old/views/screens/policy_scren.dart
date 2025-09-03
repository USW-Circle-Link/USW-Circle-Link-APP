import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:usw_circle_link/views/widgets/text_font_widget.dart';

enum PolicyType {
  privacyPolicy('assets/html/privacy_policy.html', '개인정보 처리방침'),
  termsOfService('assets/html/terms_of_service.html', '서비스 이용약관'),
  personalInformationCollectionAndUsageAgreement(
      'assets/html/personal_information_collection_and_usage_agreement.html',
      '개인정보 수집 및 이용 동의');

  final String path;
  final String title;

  const PolicyType(this.path, this.title);
}

class PolicyScreen extends StatelessWidget {
  const PolicyScreen({
    super.key,
    required this.policyType,
    this.isDialog = false,
  });

  final PolicyType policyType;
  final bool isDialog;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 0.0,
          title: Padding(
            padding: !isDialog
                ? EdgeInsets.only(left: 22.w, right: 22.w)
                : EdgeInsets.zero,
            child: Row(
              mainAxisAlignment: isDialog
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 52.w,
                  height: 52.h,
                  child: IconButton(
                    onPressed: () {
                      // 이전 화면으로 돌아가기
                      if (isDialog) {
                        context.pop(false);
                      } else {
                        context.pop();
                      }
                    },
                    icon: SvgPicture.asset(
                      'assets/images/ic_back_arrow.svg',
                    ),
                  ),
                ),
                TextFontWidget.fontRegular(
                  policyType.title,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
                if (!isDialog)
                  SizedBox(
                    width: 52.w,
                    height: 52.h,
                  ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: isDialog
            ? SizedBox(
                height: 53.h,
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Color(0xFF4791D7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.r),
                    ),
                  ),
                  onPressed: () => Navigator.of(context).pop(true),
                  child: TextFontWidget.fontRegular(
                    '확인',
                    color: Color(0xFF4791D7),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              )
            : null,
        body: Column(
          children: [
            Flexible(
              child: InAppWebView(
                initialFile: policyType.path,
                initialSettings: InAppWebViewSettings(
                  textZoom: 150,
                ),
              ),
            ),
            Divider(
              color: Colors.grey,
              height: 1.h,
            ),
          ],
        ),
      ),
    );
  }
}
