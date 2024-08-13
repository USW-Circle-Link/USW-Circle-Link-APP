import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:usw_circle_link/utils/logger/Logger.dart';
import 'package:usw_circle_link/utils/regex/Regex.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({Key? key, required this.encodedUrl}) : super(key: key);

  final String encodedUrl;

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  final GlobalKey webViewKey = GlobalKey();
  late final InAppWebViewController webViewController;
  late final PullToRefreshController pullToRefreshController;
  double progress = 0;

  @override
  void initState() {
    super.initState();

    pullToRefreshController = (kIsWeb
        ? null
        : PullToRefreshController(
            options: PullToRefreshOptions(
              color: Colors.blue,
            ),
            onRefresh: () async {
              if (defaultTargetPlatform == TargetPlatform.android) {
                webViewController.reload();
              } else if (defaultTargetPlatform == TargetPlatform.iOS ||
                  defaultTargetPlatform == TargetPlatform.macOS) {
                webViewController.loadUrl(
                    urlRequest:
                        URLRequest(url: await webViewController.getUrl()));
              }
            },
          ))!;
  }

  @override
  Widget build(BuildContext context) {
    Uri uri = Uri.parse(Uri.decodeComponent(widget.encodedUrl));
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
                    SizedBox(width: 52.w, height: 52.h)
                  ],
                ),
              ),
            ),
            body: SafeArea(
                child: PopScope(
                    onPopInvoked: (_) => _goBack(context),
                    child: Column(children: <Widget>[
                      progress < 1.0
                          ? LinearProgressIndicator(
                              value: progress, color: Colors.blue)
                          : Container(),
                      Expanded(
                          child: Stack(children: [
                        InAppWebView(
                          key: webViewKey,
                          initialUrlRequest: URLRequest(url: uri),
                          initialOptions: InAppWebViewGroupOptions(
                            crossPlatform: InAppWebViewOptions(
                                javaScriptCanOpenWindowsAutomatically: true,
                                javaScriptEnabled: true,
                                useOnDownloadStart: true,
                                useOnLoadResource: true,
                                useShouldOverrideUrlLoading: true,
                                mediaPlaybackRequiresUserGesture: true,
                                allowFileAccessFromFileURLs: true,
                                allowUniversalAccessFromFileURLs: true,
                                verticalScrollBarEnabled: true,
                                userAgent:
                                    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36'),
                            android: AndroidInAppWebViewOptions(
                                useHybridComposition: true,
                                allowContentAccess: true,
                                builtInZoomControls: true,
                                thirdPartyCookiesEnabled: true,
                                allowFileAccess: true,
                                supportMultipleWindows: true),
                            ios: IOSInAppWebViewOptions(
                              allowsInlineMediaPlayback: true,
                              allowsBackForwardNavigationGestures: true,
                            ),
                          ),
                          pullToRefreshController: pullToRefreshController,
                          onLoadStart:
                              (InAppWebViewController controller, _uri) {
                            logger.d('onLoadStart - $_uri');
                            setState(() {
                              uri = _uri!;
                            });
                          },
                          onLoadError: (controller, url, code, message) {
                            logger.e(
                                "url - $url (code : $code) / message - $message");
                          },
                          onLoadHttpError:
                              (controller, url, statusCode, description) {
                            logger.e(
                                "url - $url (code : $statusCode) / message - $description");
                          },
                          onLoadStop:
                              (InAppWebViewController controller, _uri) {
                            logger.d('onLoadStop - $_uri');
                            setState(() {
                              uri = _uri!;
                            });
                          },
                          onProgressChanged: (controller, progress) {
                            if (progress == 100) {
                              pullToRefreshController.endRefreshing();
                            }
                            setState(() {
                              this.progress = progress / 100;
                            });
                          },
                          androidOnPermissionRequest:
                              (controller, origin, resources) async {
                            return PermissionRequestResponse(
                                resources: resources,
                                action: PermissionRequestResponseAction.GRANT);
                          },
                          onWebViewCreated:
                              (InAppWebViewController controller) {
                            webViewController = controller;
                          },
                          onCreateWindow:
                              (controller, createWindowRequest) async {
                            final url =
                                createWindowRequest.request.url.toString();
                            final encodedUrl = Uri.encodeComponent(url);
                            context.push('/webview/$encodedUrl');
                            return true;
                          },
                        )
                      ]))
                    ])))));
  }

  Future<bool> _goBack(BuildContext context) async {
    if (await webViewController.canGoBack()) {
      webViewController.goBack();
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }
}
