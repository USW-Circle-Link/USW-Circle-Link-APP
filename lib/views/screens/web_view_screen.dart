import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';
import 'package:usw_circle_link/views/widgets/text_font_widget.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:url_launcher/url_launcher.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({Key? key, required this.url}) : super(key: key);
  final String url;

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  final GlobalKey _webViewKey = GlobalKey();
  InAppWebViewController? _webViewController;
  PullToRefreshController? _pullToRefreshController;

  Uri? _currentUri;
  double _progress = 0;

  @override
  void initState() {
    super.initState();

    final parsed = Uri.tryParse(widget.url);
    _currentUri = _ensureEmbeddedGoogleForm(parsed);

    if (!kIsWeb) {
      _pullToRefreshController = PullToRefreshController(
        settings: PullToRefreshSettings(color: Colors.blue),
        onRefresh: () async {
          if (defaultTargetPlatform == TargetPlatform.android) {
            _webViewController?.reload();
          } else if (defaultTargetPlatform == TargetPlatform.iOS ||
              defaultTargetPlatform == TargetPlatform.macOS) {
            final url = await _webViewController?.getUrl();
            if (url != null) {
              _webViewController?.loadUrl(urlRequest: URLRequest(url: url));
            }
          }
        },
      );
    }
  }

  Uri? _ensureEmbeddedGoogleForm(Uri? uri) {
    if (uri == null) return null;
    final isGoogleForm =
        uri.host.contains('docs.google.com') && uri.path.contains('/forms/');
    if (!isGoogleForm) return uri;
    final qp = Map<String, String>.from(uri.queryParameters);
    qp['embedded'] = 'true';
    return uri.replace(queryParameters: qp);
  }

  bool _isGoogleAuthOrForm(Uri? uri) {
    if (uri == null) return false;
    final host = uri.host.toLowerCase();
    final path = uri.path.toLowerCase();

    final isGoogleForm = host == 'docs.google.com' && path.contains('/forms/');
    final isGoogleAuthHost =
        host == 'accounts.google.com' || host.endsWith('.google.com');
    final isAuthPath = path.contains('/servicelogin') ||
        path.contains('/signin') ||
        path.contains('/o/oauth2') ||
        path.contains('/v3/signin') ||
        path.contains('/embedded/lookup');

    return isGoogleForm || (isGoogleAuthHost && isAuthPath);
  }

  Future<void> _openExternallyOrTopLevel(Uri uri) async {
    if (kIsWeb) {
      await launchUrl(uri, webOnlyWindowName: '_self');
    } else {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  Uri? _toUriFromWebUri(WebUri? webUri) {
    if (webUri == null) return null;
    try {
      // flutter_inappwebview 6.x 기준
      // ignore: invalid_use_of_visible_for_testing_member
      return webUri.uriValue;
    } catch (_) {
      return Uri.tryParse(webUri.toString());
    }
  }


  @override
  Widget build(BuildContext context) {
    final hasValidUrl = _currentUri != null && _currentUri!.hasAbsolutePath;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 52,
                height: 52,
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: SvgPicture.asset('assets/images/ic_back_arrow.svg'),
                ),
              ),
              const SizedBox(width: 52, height: 52),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: PopScope(
          onPopInvokedWithResult: (didPop, result) => _goBack(context),
          child: Column(
            children: [
              _progress < 1
                  ? LinearProgressIndicator(
                value: _progress,
                color: Colors.blue,
              )
                  : const SizedBox.shrink(),
              Expanded(
                child: !hasValidUrl
                    ? Center(
                  child: TextFontWidget.fontRegular(
                    '페이지를 불러올 수 없습니다...',
                  ),
                )
                    : (kIsWeb
                    ? _buildWebViewWrapped()
                    : Stack(
                  clipBehavior: Clip.none,
                  children: [
                    _buildWebViewCore(),
                  ],
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWebViewWrapped() {
    return PointerInterceptor(
      child: _buildWebViewCore(),
    );
  }

  Widget _buildWebViewCore() {
    return InAppWebView(
      key: _webViewKey,
      initialUrlRequest: URLRequest(url: WebUri.uri(_currentUri!)),
      initialSettings: InAppWebViewSettings(
        isInspectable: kDebugMode,
        javaScriptCanOpenWindowsAutomatically: true,
        javaScriptEnabled: true,
        domStorageEnabled: true,
        transparentBackground: true,
        useOnDownloadStart: true,
        useOnLoadResource: true,
        mediaPlaybackRequiresUserGesture: true,
        allowFileAccessFromFileURLs: true,
        allowUniversalAccessFromFileURLs: true,
        verticalScrollBarEnabled: true,
        userAgent:
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36',
        useHybridComposition: true,
        allowContentAccess: true,
        builtInZoomControls: true,
        thirdPartyCookiesEnabled: true,
        allowFileAccess: true,
        supportMultipleWindows: true,
        allowsInlineMediaPlayback: true,
        allowsBackForwardNavigationGestures: true,
      ),
      pullToRefreshController: _pullToRefreshController,
      onWebViewCreated: (controller) {
        _webViewController = controller;
      },
      shouldOverrideUrlLoading: (controller, navigationAction) async {
        final reqUrl = navigationAction.request.url;
        Uri? target = _toUriFromWebUri(reqUrl) ??
            Uri.tryParse(navigationAction.request.url.toString());

        if (_isGoogleAuthOrForm(target)) {
          target = _ensureEmbeddedGoogleForm(target);
          if (target != null) {
            await _openExternallyOrTopLevel(target);
            return NavigationActionPolicy.CANCEL;
          }
        }

        return NavigationActionPolicy.ALLOW;
      },
      onLoadStart: (controller, pageUri) {
        final uri = _toUriFromWebUri(pageUri);
        logger.d('onLoadStart - $uri');
        setState(() => _currentUri = _ensureEmbeddedGoogleForm(uri));
      },
      onReceivedError: (controller, request, error) {
        logger.e('url - ${request.url} message - ${error.description}');
      },
      onReceivedHttpError: (controller, request, errorResponse) {
        logger.e(
            'url - ${request.url} ( code - ${errorResponse.statusCode} )');
      },
      onLoadStop: (controller, pageUri) {
        final uri = _toUriFromWebUri(pageUri);
        logger.d('onLoadStop - $uri');
        setState(() => _currentUri = _ensureEmbeddedGoogleForm(uri));
        _pullToRefreshController?.endRefreshing();
      },
      onProgressChanged: (controller, progress) {
        if (progress == 100) {
          _pullToRefreshController?.endRefreshing();
        }
        setState(() {
          _progress = progress / 100;
        });
      },
      onPermissionRequest: (controller, permissionRequest) async {
        return PermissionResponse(
          resources: permissionRequest.resources,
          action: PermissionResponseAction.GRANT,
        );
      },
      onCreateWindow: (controller, createWindowRequest) async {
        final urlStr = createWindowRequest.request.url.toString();
        Uri? uri = Uri.tryParse(urlStr);

        if (_isGoogleAuthOrForm(uri)) {
          uri = _ensureEmbeddedGoogleForm(uri);
          if (uri != null) {
            await _openExternallyOrTopLevel(uri);
            return false;
          }
        }

        final encodedUrl = Uri.encodeComponent(urlStr);
        if (context.mounted) {
          context.push('/webview/$encodedUrl');
        }
        return true;
      },
    );
  }

  Future<bool> _goBack(BuildContext context) async {
    final controller = _webViewController;
    if (controller != null && await controller.canGoBack()) {
      controller.goBack();
      return false;
    }
    return true;
  }
}
