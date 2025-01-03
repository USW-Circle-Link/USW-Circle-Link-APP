import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:usw_circle_link/models/circle_detail_list_model.dart';
import 'package:usw_circle_link/notifier/auth_notifier.dart';
import 'package:usw_circle_link/router/refresh_observer.dart';
import 'package:usw_circle_link/views/screens/application_writing_screen.dart';
import 'package:usw_circle_link/views/screens/change_pw_screen.dart';
import 'package:usw_circle_link/views/screens/circle_screen.dart';
import 'package:usw_circle_link/views/screens/delete_user_screen.dart';
import 'package:usw_circle_link/views/screens/email_verification_screen.dart';
import 'package:usw_circle_link/views/screens/find_id_screen.dart';
import 'package:usw_circle_link/views/screens/find_pw_screen.dart';
import 'package:usw_circle_link/views/screens/image_screen.dart';
import 'package:usw_circle_link/views/screens/login_screen.dart';
import 'package:usw_circle_link/views/screens/main_screen.dart';
import 'package:usw_circle_link/views/screens/circle_list_screen.dart';
import 'package:usw_circle_link/views/screens/notice_detail_screen.dart';
import 'package:usw_circle_link/views/screens/notice_list_screen.dart';
import 'package:usw_circle_link/views/screens/sign_up_screen.dart';
import 'package:usw_circle_link/views/screens/terms_of_service_scren.dart';
import 'package:usw_circle_link/views/screens/update_profile_screen.dart';
import 'package:usw_circle_link/views/screens/web_view_screen.dart';

final webviewRouter = GoRoute(
  path: 'webview/:url',
  builder: (context, state) => WebViewScreen(
    url: state.pathParameters['url']!,
  ),
);

final routerProvider = Provider<GoRouter>((ref) {
  final provider = ref.read(authProvider);
  return GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (_, state) => MainScreen(),
        routes: [
          GoRoute(
              path: 'circle',
              builder: (_, state) => CircleScreen(
                    clubId: int.parse(state.uri.queryParameters['clubId']!),
                  ),
              routes: [
                GoRoute(
                    path: 'application_writing',
                    builder: (_, state) => ApplicationWritingScreen(
                          clubId:
                              int.parse(state.uri.queryParameters['clubId']!),
                        ),
                    routes: [webviewRouter]),
              ]),
          GoRoute(
            path: 'login',
            builder: (_, __) => LoginScreen(),
            routes: [
              GoRoute(
                path: 'find_id',
                builder: (_, __) => FindIdScreen(),
                routes: [
                  webviewRouter,
                ],
              ),
              GoRoute(
                path: 'find_pw',
                builder: (_, __) => FindPwScreen(),
                routes: [
                  webviewRouter,
                  GoRoute(
                    path: 'change_pw',
                    builder: (_, state) => ChangePwScreen(
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
                      password: Uri.decodeComponent(state.uri.queryParameters['password']!),
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
            path: 'change_pw',
            builder: (_, __) => ChangePwScreen(),
          ),
          webviewRouter,
          GoRoute(
            path: 'circle_list',
            builder: (_, state) => CircleListScreen(
              listType: state.extra as CircleListType,
            ),
          ),
          GoRoute(
            path: 'update_profile',
            builder: (_, __) => UpdateProfileScreen(),
            routes: [
              GoRoute(
                path: 'delete_user',
                builder: (_, __) => DeleteUserScreen(),
              ),
            ],
          ),
          GoRoute(
            path: 'notices',
            builder: (_, __) => NoticeListScreen(),
            routes: [
              GoRoute(
                path: ':noticeId/detail',
                builder: (_, state) => NoticeDetailScreen(
                  noticeId: int.parse(
                    state.pathParameters['noticeId']!,
                  ),
                ),
              ),
            ],
          ),
          GoRoute(
            path: 'tems_of_serice',
            builder: (_, __) => TermsOfServiceScreen(),
          ),
          GoRoute(
            path: 'image',
            name: 'image',
            builder: (_, state) =>
                ImageScreen(image: state.extra as String),
          ),
        ],
      ),
    ],
    initialLocation: '/',
    refreshListenable: provider,
    debugLogDiagnostics: true,
    observers: [
      RefreshObserver(ref: ref),
    ],
  );
});
