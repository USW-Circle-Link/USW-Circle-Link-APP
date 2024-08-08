import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:usw_circle_link/router/AuthNotifier.dart';
import 'package:usw_circle_link/views/screens/ApplicationWritingScreen.dart';
import 'package:usw_circle_link/views/screens/ChangePWScreen.dart';
import 'package:usw_circle_link/views/screens/EmailVerificationScreen.dart';
import 'package:usw_circle_link/views/screens/FindIDScreen.dart';
import 'package:usw_circle_link/views/screens/FindPWScreen.dart';
import 'package:usw_circle_link/views/screens/LoginScreen.dart';
import 'package:usw_circle_link/views/screens/MainScreen.dart';
import 'package:usw_circle_link/views/screens/SignUpScreen.dart';
import 'package:usw_circle_link/views/screens/WebViewScreen.dart';

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
              ),
              GoRoute(
                path: 'find_pw',
                builder: (_, __) => FindPWScreen(),
              ),
              GoRoute(
                path: 'sign_up',
                builder: (_, __) => SignUpScreen(),
                routes: [
                  GoRoute(
                      path: 'email_verification',
                      builder: (_, __) => EmailVerificationScreen()),
                ],
              ),
            ],
          ),
          GoRoute(
              path: 'application_writing',
              builder: (_, __) => ApplicationWritingScreen(),
              routes: [
                GoRoute(
                    path: ':encodedUrl',
                    builder: (context, state) =>
                        WebViewScreen(encodedUrl: state.pathParameters['encodedUrl']!))
              ]),
        ],
      ),
    ],
    initialLocation: '/application_writing/${Uri.encodeComponent("https://forms.gle/JhcnYwrtzE8ja5mV8")}',
    refreshListenable: provider,
    //redirect: provider.redirectLogic,
    debugLogDiagnostics: true,
  );
});
