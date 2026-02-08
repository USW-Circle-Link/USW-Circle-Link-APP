import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:usw_circle_link/models/circle_list_model.dart';
import 'package:usw_circle_link/router/circle_list_route.dart';
import 'package:usw_circle_link/router/refresh_observer.dart';
import 'package:usw_circle_link/views/screens/application_writing_screen.dart';
import 'package:usw_circle_link/views/screens/application_detail_screen.dart';
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
import 'package:usw_circle_link/views/screens/policy_agree_screen.dart';
import 'package:usw_circle_link/views/screens/select_circle_screen.dart';
import 'package:usw_circle_link/views/screens/sign_up_option_screen.dart';
import 'package:usw_circle_link/views/screens/sign_up_screen.dart';
import 'package:usw_circle_link/views/screens/policy_screen.dart';
import 'package:usw_circle_link/views/screens/sign_up_success_screen.dart';
import 'package:usw_circle_link/views/screens/update_profile_screen.dart';
import 'package:usw_circle_link/views/screens/verify_password_screen.dart';
import 'package:usw_circle_link/views/screens/web_view_screen.dart';

final webviewRouter = GoRoute(
  path: 'webview/:url',
  builder: (context, state) => WebViewScreen(
    url: state.pathParameters['url']!,
  ),
);

final signUpRouter = GoRoute(
  path: 'sign_up',
  builder: (_, state) => SignUpScreen(
    newMemberSignUp: state.uri.queryParameters['newMember'] == 'true',
    emailTokenUUID: state.uri.queryParameters['emailTokenUUID'],
    signupUUID: state.uri.queryParameters['signupUUID'],
    selectedCircles: state.extra as List<CircleListData>?,
  ),
  routes: [
    GoRoute(
      path: 'success',
      builder: (_, __) => SignUpSuccessScreen(),
    ),
  ],
);
final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (_, state) {
          return MainScreen();
        },
        routes: [
          GoRoute(
              path: 'circle',
              builder: (_, state) => CircleScreen(
                    clubUUID: state.uri.queryParameters['clubUUID']!,
                  ),
              routes: [
                GoRoute(
                    path: 'application_writing',
                    builder: (_, state) => ApplicationWritingScreen(
                          clubUUID: state.uri.queryParameters['clubUUID']!,
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
                path: 'sign_up_option',
                builder: (_, __) => SignUpOptionScreen(),
                routes: [
                  GoRoute(
                    path: 'policy_agree',
                    builder: (context, state) => PolicyAgreeScreen(
                      newMemberSignUp:
                          (state.uri.queryParameters['newMemberSignUp'] ??
                                  'true') ==
                              'true',
                    ),
                    routes: [
                      GoRoute(
                        path: 'select_circle',
                        builder: (_, __) => SelectCircleScreen(),
                        routes: [
                          signUpRouter,
                        ],
                      ),
                      GoRoute(
                        path: 'email_verification',
                        builder: (_, state) => EmailVerificationScreen(),
                        routes: [
                          webviewRouter,
                          signUpRouter,
                        ],
                      ),
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
            path: 'circle_list/:type',
            builder: (_, state) {
              final typeParam = state.pathParameters['type'];
              final listType = parseCircleListType(typeParam);
              return CircleListScreen(listType: listType);
            },
          ),
          GoRoute(
            path: 'circle_list/:type/application_detail',
            builder: (_, state) => ApplicationDetailScreen(
              clubUUID: state.uri.queryParameters['clubUUID']!,
              aplictId: state.uri.queryParameters['aplictId']!,
            ),
          ),
          GoRoute(
            path: 'update_profile',
            builder: (_, __) => UpdateProfileScreen(),
            routes: [
              GoRoute(
                path: 'verify_password',
                builder: (context, state) {
                  final profileData = state.extra as Map<String, String>?;
                  return VerifyPasswordScreen(profileData: profileData);
                },
              ),
              GoRoute(
                path: 'delete_user',
                builder: (_, __) => DeleteUserScreen(),
                routes: [
                  webviewRouter,
                ],
              ),
            ],
          ),
          GoRoute(
            path: 'notices',
            builder: (_, __) => NoticeListScreen(),
            routes: [
              GoRoute(
                path: ':noticeUUID/detail',
                builder: (_, state) => NoticeDetailScreen(
                  noticeUUID: state.pathParameters['noticeUUID']!,
                ),
              ),
            ],
          ),
          GoRoute(
            path: 'terms_of_service',
            builder: (_, __) => PolicyScreen(
                policyType: PolicyType.termsOfService, isDialog: false),
          ),
          GoRoute(
            path: 'privacy_policy',
            builder: (_, __) => PolicyScreen(
                policyType: PolicyType.privacyPolicy, isDialog: false),
          ),
          GoRoute(
            path: 'personal_information_collection_and_usage_agreement',
            builder: (_, __) => PolicyScreen(
                policyType:
                    PolicyType.personalInformationCollectionAndUsageAgreement,
                isDialog: false),
          ),
          GoRoute(
              path: 'image',
              name: 'image',
              builder: (_, state) {
                final Map<String, dynamic> extra =
                    (state.extra as Map<String, dynamic>);
                return ImageScreen(
                  galleryItems: extra['galleryItems'],
                  backgroundDecoration: extra['backgroundDecoration'],
                  initialIndex: extra['index'],
                );
              }),
        ],
      ),
    ],
    initialLocation: '/',
    debugLogDiagnostics: true,
    observers: [
      RefreshObserver(ref: ref),
    ],
  );
});
