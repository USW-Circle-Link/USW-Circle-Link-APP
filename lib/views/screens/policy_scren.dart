import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:go_router/go_router.dart';
import 'package:usw_circle_link/widgets/detail_app_bar/detail_app_bar.dart';
import 'package:usw_circle_link/widgets/text_font_widget/text_font_widget.dart';

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

  String get webAssetPath {
    // 웹 환경에서는 assets/ 경로가 추가로 필요합니다
    return 'assets/${policyType.path}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DetailAppBar(
        title: policyType.title,
        onBackPressed: () {
          if (isDialog) {
            context.pop(false);
          } else {
            context.pop();
          }
        },
      ),
      bottomNavigationBar: isDialog
          ? SizedBox(
              height: 53.0,
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFF4791D7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                ),
                onPressed: () => Navigator.of(context).pop(true),
                child: TextFontWidget.fontRegular(
                  '확인',
                  color: const Color(0xFF4791D7),
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            )
          : null,
      body: Column(
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: kIsWeb
                  ? InAppWebView(
                      initialUrlRequest: URLRequest(
                        url: WebUri(webAssetPath),
                      ),
                      initialSettings: InAppWebViewSettings(
                        textZoom: 50,
                        allowFileAccessFromFileURLs: true,
                        allowUniversalAccessFromFileURLs: true,
                        allowContentAccess: true,
                        allowFileAccess: true,
                      ),
                    )
                  : InAppWebView(
                      initialFile: policyType.path,
                      initialSettings: InAppWebViewSettings(
                        textZoom: 150,
                      ),
                    ),
            ),
          ),
          const Divider(
            color: Colors.grey,
            height: 1.0,
          ),
        ],
      ),
    );
  }
}
