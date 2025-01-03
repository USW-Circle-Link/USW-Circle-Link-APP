import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';
import 'package:usw_circle_link/viewmodels/profile_view_model.dart';

class RefreshObserver extends NavigatorObserver {
  
  RefreshObserver({required this.ref});
  
  final Ref ref;

  @override
  void didPop(Route route, Route? previousRoute) async {
    logger.d('didPop - called!');
    logger.d(route);
    logger.d(previousRoute);
    if (previousRoute?.settings.name == '/'){
      await ref.read(profileViewModelProvider.notifier).getProfile();
    }
    super.didPop(route, previousRoute);
  }
}