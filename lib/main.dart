// Copyright 2024 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'config/flavor_config.dart';
import 'routing/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:logging/logging.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'config/dependencies.dart';
import 'data/repositories/auth_repository.dart';
import 'dart:io';

import 'firebase/firebase_options_dev.dart' as dev;
import 'firebase/firebase_options_stg.dart' as stg;

void main() => run(Flavor.production);

Future<FirebaseOptions> _initializeFirebaseOption() async {
  PackageInfo package = await PackageInfo.fromPlatform();

  String name = "";
  if (Platform.isIOS) {
    name = "com.usw.flag.temp.usw-circle-link.assignment";
  } else if (Platform.isAndroid) {
    name = "com.usw.flag.temp.usw_circle_link.assignment";
  }

  final packageName = package.packageName;
  return switch (packageName) {
    _ when packageName == name => stg.DefaultFirebaseOptions.currentPlatform,
    _ when packageName == "$name.stg" =>
    stg.DefaultFirebaseOptions.currentPlatform,
    _ when packageName == "$name.dev" =>
    dev.DefaultFirebaseOptions.currentPlatform,
    _ => throw UnimplementedError(),
  };
}

void run(Flavor flavor) async {
  Logger.root.level = Level.ALL;
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseOptions currentPlatform = await _initializeFirebaseOption();
  await Firebase.initializeApp(
    options: currentPlatform,
  );
  debugPrint('✅ Firebase initialized!');

  initializeFlavor(flavor);

  // FCM 토큰 콘솔 출력
  // final fcmService = context.read();
  // final fcmToken = await fcmService.getToken();
  // debugPrint('✅ FCM Token: ' + (fcmToken ?? 'null'));

  runApp(
    MultiProvider(
      providers: providers,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'USW Circle Link',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      routerConfig: router(context.read<AuthRepository>()),
    );
  }
}