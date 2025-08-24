// Copyright 2024 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'package:flutter/material.dart';
import '../data/repositories/auth/auth_repository.dart'; // Need to Add
import '../ui/club/club_viewmodel.dart'; // Need to Add
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../data/repositories/club/club_repository.dart'; // Need to Add
import 'routes.dart';
import '../ui/auth/login/login_screen.dart'; // Need to Add
import '../ui/club/main_screen.dart'; // Need to Add
import '../ui/auth/login/login_viewmodel.dart'; // Need to Add
import '../data/services/local/fcm_service.dart'; // Need to Add

GoRouter router(AuthRepository authRepository) => GoRouter(
  initialLocation: Routes.home,
  debugLogDiagnostics: true,
  redirect: _redirect,
  refreshListenable: authRepository,
  routes: [
    GoRoute(
      path: Routes.login,
      builder: (context, state) {
        return LoginScreen(
          viewModel: LoginViewModel(
            authRepository: context.read<AuthRepository>(),
            fcmService: context.read<FCMService>(),
          ),
        );
      },
    ),
    GoRoute(
      path: Routes.home,
      builder: (context, state) => MainScreen(
        viewModel: ClubsViewModel(
          clubRepository: context.read<ClubRepository>(),
        ),
      ),
    ),
  ],
);

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen((_) => notifyListeners());
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

// From https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/redirection.dart
Future<String?> _redirect(BuildContext context, GoRouterState state) async {
  // if the user is not logged in, they need to login
  final loggedIn = await context.read<AuthRepository>().isAuthenticated;
  final loggingIn = state.matchedLocation == Routes.login;
  if (!loggedIn) {
    return Routes.login;
  }

  // if the user is logged in but still on the login page, send them to
  // the home page
  if (loggingIn) {
    return Routes.home;
  }

  // no need to redirect at all
  return null;
}