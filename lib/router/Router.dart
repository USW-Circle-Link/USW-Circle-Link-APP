import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:usw_circle_link/const/data.dart';
import 'package:usw_circle_link/notifier/AuthNotifier.dart';
import 'package:usw_circle_link/views/screens/ApplicationWritingScreen.dart';
import 'package:usw_circle_link/views/screens/ChangePWScreen.dart';
import 'package:usw_circle_link/views/screens/EmailVerificationScreen.dart';
import 'package:usw_circle_link/views/screens/FindIDScreen.dart';
import 'package:usw_circle_link/views/screens/FindPWScreen.dart';
import 'package:usw_circle_link/views/screens/LoginScreen.dart';
import 'package:usw_circle_link/views/screens/MainScreen.dart';
import 'package:usw_circle_link/views/screens/SignUpScreen.dart';
import 'package:usw_circle_link/views/screens/WebViewScreen.dart';

final webviewRouter = GoRoute(
  path: 'webview/:encodedUrl',
  builder: (context, state) => WebViewScreen(
    encodedUrl: state.pathParameters['encodedUrl']!,
  ),
);

final routerProvider = Provider<GoRouter>((ref) {
  final provider = ref.read(authProvider);
  return GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (_, __) => MainScreen(),
        routes: [
          GoRoute(
            path: 'login',
            builder: (_, __) => LoginScreen(),
            routes: [
              GoRoute(
                path: 'find_id',
                builder: (_, __) => FindIDScreen(),
                routes: [
                  webviewRouter,
                ],
              ),
              GoRoute(
                path: 'find_pw',
                builder: (_, __) => FindPWScreen(),
                routes: [
                  webviewRouter,
                  GoRoute(
                    path: 'change_pw',
                    builder: (_, state) => ChangePWScreen(
                      checkCurrentPassword: false,
                      uuid: state.uri.queryParameters['uuid'] ?? "",
                    ),
                  )
                ],
              ),
              GoRoute(
                path: 'sign_up',
                builder: (_, __) => SignUpScreen(),
                routes: [
                  GoRoute(
                    path: 'email_verification',
                    builder: (_, state) => EmailVerificationScreen(
                      account: state.uri.queryParameters['account']!,
                      password: state.uri.queryParameters['password']!,
                      userName: state.uri.queryParameters['userName']!,
                      telephone: state.uri.queryParameters['telephone']!,
                      studentNumber:
                          state.uri.queryParameters['studentNumber']!,
                      major: state.uri.queryParameters['major']!,
                    ),
                    routes: [
                      webviewRouter,
                    ],
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
              path: 'application_writing',
              builder: (_, __) => ApplicationWritingScreen(),
              routes: [webviewRouter]),
          GoRoute(
            path: 'change_pw',
            builder: (_, __) => ChangePWScreen(),
          ),
          webviewRouter,
        ],
      ),
    ],
    initialLocation: '/',
    // initialLocation: '/login/find_id/webview/${Uri.encodeComponent("https://dummy.restapiexample.com/api/v1/employees")}',
    // initialLocation: '/login/sign_up/email_verification?account=${testId}&password=${testPassword}&userName=${testUserName}&telephone=${testTelephone}&studentNumber=${testStudentNumber}&major=${testMajor}',
    refreshListenable: provider,
    //redirect: provider.redirectLogic,
    debugLogDiagnostics: true,
  );
});
