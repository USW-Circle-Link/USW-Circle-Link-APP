// Copyright 2024 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'flavor_config.dart';
import '../data/services/api/api_service.dart';
import '../data/services/local/fcm_service.dart';
import '../data/repositories/auth/auth_repository.dart';
import '../data/repositories/club/club_repository.dart'; //import lastly

List<SingleChildWidget> get providers {
  return [
    Provider(create: (context) => FCMService()),
    flavorConfigProvider,
    Provider(create: (context) => FlutterSecureStorage()),
    Provider(
      create: (context) => CustomInterceptor(
        storage: context.read<FlutterSecureStorage>(),
        baseUrl: context.read<FlavorConfig>().apiBaseUrl,
      ),
    ),
    Provider(create: (context) {
      final dio = Dio(BaseOptions(
        baseUrl: context.read<FlavorConfig>().apiBaseUrl,
      ));
      dio.interceptors.add(context.read<CustomInterceptor>());
      return dio;
    }),
    Provider(
      create: (context) => ClubRepository(
        dio: context.read<Dio>(),
      ),
    ),
    ChangeNotifierProvider(
      create: (context) => AuthRepository(
        dio: context.read<Dio>(),
        storage: context.read<FlutterSecureStorage>(),
      ),
    ),
  ];
}