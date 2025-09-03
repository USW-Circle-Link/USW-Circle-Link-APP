import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../config/constants.dart';
import 'package:logging/logging.dart';
import '../../domain/models/login_response.dart';
import '../../utils/result.dart';

class AuthRepository extends ChangeNotifier {
  AuthRepository({required this.dio, required this.storage});

  final Dio dio;
  final FlutterSecureStorage storage;
  final _log = Logger('AuthRepository');

  bool? _isAuthenticated;
  String? _accessToken;
  String? _refreshToken;

  Future<void> _fetch() async {
    final accessToken = await storage.read(key: accessTokenKey);
    final refreshToken = await storage.read(key: refreshTokenKey);
    if (accessToken != null && refreshToken != null) {
      _accessToken = accessToken;
      _refreshToken = refreshToken;
      _isAuthenticated = true;
    } else {
      _log.severe(
        'Failed to fech Token from SharedPreferences',
      );
    }
  }

  Future<bool> get isAuthenticated async {
    // Status is cached
    if (_isAuthenticated != null) {
      return _isAuthenticated!;
    }
    // No status cached, fetch from storage
    await _fetch();
    return _isAuthenticated ?? false;
  }

  Future<Result<void>> login({
    required String id,
    required String password,
    required String fcmToken,
  }) async {
    try {
      final response = await dio.post(
        '/users/login',
        data: {
          'account': id,
          'password': password,
          'fcmToken': fcmToken,
        },
      );
      debugPrint("response: ${response.data}");

      if (response.statusCode == 200) {
        _log.info('User logged int');
        final loginResponse = LoginResponse.fromJson(response.data['data']);
        await storage.write(
            key: accessTokenKey, value: loginResponse.accessToken);
        await storage.write(
            key: refreshTokenKey, value: loginResponse.refreshToken);
        _log.info('Token saved');
        _isAuthenticated = true;
        return Result.ok(null);
      } else {
        return Result.error(
          DioException(
            message: "Login error",
            requestOptions: response.requestOptions,
            response: response,
          ),
        );
      }
    } on DioException catch (e) {
      return Result.error(e);
    } finally {
      notifyListeners();
    }
  }

  Future<Result<void>> logout() async {
    _log.info('User logged out');
    try {
      final result = await dio.post(
        '/integration/logout',
        options: Options(
          headers: {
            'Authorization': 'Bearer $_accessToken',
            'Cookie': 'refreshToken=$_refreshToken',
          },
        ),
      );
      if (result.statusCode == 200) {
        _log.info('Logout api call success');
      } else {
        throw DioException(
          message: "Logout error",
          requestOptions: result.requestOptions,
          response: result,
        );
      }
      await storage.delete(key: accessTokenKey);
      await storage.delete(key: refreshTokenKey);

      _accessToken = null;
      _refreshToken = null;
      _isAuthenticated = false;

      _log.info('Token deleted');
      return Result.ok(null);
    } on Exception catch (e) {
      _log.severe('Failed to logout', e);
      return Result.error(e);
    } finally {
      notifyListeners();
    }
  }
}
