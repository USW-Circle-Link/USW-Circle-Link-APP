import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:usw_circle_link/const/data.dart';
import 'package:usw_circle_link/models/token_data.dart';
import 'package:usw_circle_link/secure_storage/secure_storage.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';
import 'package:usw_circle_link/utils/result.dart';

final tokenRepositoryProvider = Provider<TokenRepository>((ref) {
  final storage = ref.watch(secureStorageProvider);
  return TokenRepository(storage: storage);
});

/// 토큰 저장/조회/삭제를 담당하는 Repository
///
/// 가이드라인 2.3.1: Repository는 데이터 소스와 통신하며 Result 타입 반환
class TokenRepository {
  final FlutterSecureStorage _storage;

  TokenRepository({required FlutterSecureStorage storage}) : _storage = storage;

  /// 저장된 토큰 정보 조회
  ///
  /// Returns:
  /// - Ok<TokenData>: 토큰 조회 성공
  /// - Error: 토큰이 없거나 조회 실패
  Future<Result<TokenData>> getTokens() async {
    try {
      final accessToken = await _storage.read(key: accessTokenKey);
      final refreshToken = await _storage.read(key: refreshTokenKey);
      final clubUUIDsJsonString = await _storage.read(key: clubUUIDsKey);

      if (accessToken == null || refreshToken == null) {
        logger.d('TokenRepository - 저장된 토큰이 없습니다.');
        return Result.error(
          Exception('저장된 토큰이 없습니다.'),
        );
      }

      final List<dynamic> clubUUIDsDynamic =
          jsonDecode(clubUUIDsJsonString ?? "[]");
      final clubUUIDs = clubUUIDsDynamic.cast<String>();

      logger.d(
          'TokenRepository - 토큰 조회 성공: accessToken=$accessToken, refreshToken=$refreshToken, clubUUIDs=$clubUUIDs');

      return Result.ok(
        TokenData(
          accessToken: accessToken,
          refreshToken: refreshToken,
          clubUUIDs: clubUUIDs,
        ),
      );
    } on Exception catch (e) {
      logger.e('TokenRepository - 토큰 조회 실패: $e');
      return Result.error(e);
    }
  }

  /// 토큰 정보 저장
  ///
  /// Parameters:
  /// - accessToken: 액세스 토큰
  /// - refreshToken: 리프레시 토큰
  /// - clubUUIDs: 소속 동아리 UUID 목록
  Future<Result<void>> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    try {
      await _storage.write(key: accessTokenKey, value: accessToken);
      await _storage.write(key: refreshTokenKey, value: refreshToken);

      logger.d(
          'TokenRepository - 토큰 저장 성공: accessToken=$accessToken, refreshToken=$refreshToken');

      return Result.ok(null);
    } on Exception catch (e) {
      logger.e('TokenRepository - 토큰 저장 실패: $e');
      return Result.error(e);
    }
  }

  /// 저장된 토큰 정보 삭제
  Future<Result<void>> clearTokens() async {
    try {
      await Future.wait([
        _storage.delete(key: accessTokenKey),
        _storage.delete(key: refreshTokenKey),
        _storage.delete(key: clubUUIDsKey),
      ]);

      logger.d('TokenRepository - 토큰 삭제 성공');

      return Result.ok(null);
    } on Exception catch (e) {
      logger.e('TokenRepository - 토큰 삭제 실패: $e');
      return Result.error(e);
    }
  }
}
