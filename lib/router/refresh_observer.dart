import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';
import 'package:usw_circle_link/viewmodels/fcm_view_model.dart';
import 'package:usw_circle_link/viewmodels/profile_view_model.dart';

class RefreshObserver extends NavigatorObserver {
  
  RefreshObserver({required this.ref});
  
  final Ref ref;

  @override
  void didPush(Route route, Route? previousRoute) async {
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route route, Route? previousRoute) async {
    logger.d('didPop - called!');
    logger.d(route);
    logger.d(previousRoute);
    if (previousRoute?.settings.name == '/'){
      await ref.read(profileViewModelProvider.notifier).getProfile();
      await ref.read(firebaseCloudMessagingViewModelProvider.notifier).loadNotifications();
    }
    super.didPop(route, previousRoute);
  }
}