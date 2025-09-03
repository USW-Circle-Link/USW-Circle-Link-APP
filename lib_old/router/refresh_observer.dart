import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';
import 'package:usw_circle_link/viewmodels/profile_view_model.dart';

class RefreshObserver extends NavigatorObserver {
  RefreshObserver({required this.ref});

  final Ref ref;

  @override
  void didPop(Route route, Route? previousRoute) async {
    if (previousRoute?.settings.name == '/') {
      logger.d('didPop - called!');
      await ref.read(profileViewModelProvider.notifier).getProfile();
    }
    super.didPop(route, previousRoute);
  }
}
