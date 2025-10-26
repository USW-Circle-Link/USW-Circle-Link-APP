import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/dio/Dio.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';

final certificateRepositoryProvider = Provider<CertificateRepository>((ref) {
  final dio = ref.watch(dioProvider);

  return CertificateRepository(
    dio: dio,
    basePath: '/users/event',
  );
});

class CertificateRepository {
  final Dio dio;
  final String basePath;

  CertificateRepository({
    required this.dio,
    required this.basePath,
  });

  Future<Map<String, dynamic>> certificateRepository({
    required String clubUUID,
    required int code,
  }) async {
    try {
      final response = await dio.post(
        '$basePath/verify',
        data: {
          'clubUUID': clubUUID,
          'code': code,
        },
      );

      logger.d(response.data);

      logger.d(
          'certificateRepository - ${response.realUri} 로 요청 성공! (${response.statusCode})');

      // 200 성공 또는 400 이미 인증된 경우 모두 반환
      return response.data as Map<String, dynamic>;
    } on Exception catch (e) {
      logger.e('certificateRepository Error: $e');
      throw Exception("서버 통신 실패: $e");
    }
  }

  Future<Map<String, dynamic>> getCertificateStatus() async {
    try {
      final response = await dio.get(
        '$basePath/status',
        options: Options(
          headers: {
            'accessToken': 'true',
          },
        ),
      );

      logger.d(response.data);

      logger.d(
          'getCertificateStatus - ${response.realUri} 로 요청 성공! (${response.statusCode})');

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception("서버 통신 실패 (${response.statusCode}: ${response.data})");
      }
    } on DioException catch (e) {
      logger.e('getCertificateStatus DioException: $e');
      throw Exception("서버 통신 실패: ${e.message}");
    } catch (e) {
      logger.e('getCertificateStatus Error: $e');
      rethrow;
    }
  }
}
