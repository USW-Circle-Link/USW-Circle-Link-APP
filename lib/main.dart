import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:usw_circle_link/router/router.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _requestNotificationPermission();
  runApp(
    ProviderScope(
      child: CircleLink(),
    ),
  );
}

// 알림 권한 요청
Future<void> _requestNotificationPermission() async {
  logger.d('@@@@');
  await Permission.notification.request();
  logger.d('@@@@');
  if (Platform.isAndroid) {
    final int sdkInt = (await DeviceInfoPlugin().androidInfo).version.sdkInt;

    if (sdkInt >= 33) {}
  }
}

class CircleLink extends ConsumerWidget {
  const CircleLink({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: ref.read(routerProvider),
    );
  }
}
