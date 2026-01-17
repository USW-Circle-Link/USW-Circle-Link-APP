import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/const/data.dart';
import 'package:usw_circle_link/dio/Dio.dart';
import 'package:usw_circle_link/models/application_set.dart';
import 'package:usw_circle_link/models/response/application_response.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';

import '../models/response/global_exception.dart';
import '../utils/result.dart';

final applicationRepositoryProvider = Provider<ApplicationRepository>((ref) {
  final dio = ref.watch(dioProvider);

  return ApplicationRepository(
    dio: dio,
  );
});

class ApplicationRepository {
  final Dio dio;

  ApplicationRepository({
    required this.dio,
  });

  Future<Result<bool>> checkAvailableForApplication({
    required String clubUUID,
  }) async {
    // 더미 데이터 사용
    if (USE_DUMMY_APPLICATION_DATA) {
      await Future.delayed(const Duration(milliseconds: 300));
      return Result.ok(true);
    }

    try {
      final response = await dio.get(
        '/api/clubs/$clubUUID/forms',
        options: Options(headers: {'accessToken': 'true'}),
      );

      logger.d('${response.data}');

      logger.d(
          'checkAvailableForApplication - ${response.realUri} 로 요청 성공! (${response.statusCode})');

      if (response.statusCode == 200) {
        final data = response.data;
        if (data == null || data['data'] == null) {
          return Result.ok(false);
        }
        final formData = data['data'];
        final status = formData['status'] as String?;
        return Result.ok(status == 'PUBLISHED');
      } else if (response.statusCode == 404) {
        return Result.ok(false);
      } else {
        return Result.error(GlobalException.fromJson(response.data));
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Future<Result<ApplicationSet>> getApplication({
    required String clubUUID,
  }) async {
    // 더미 데이터 사용
    if (USE_DUMMY_APPLICATION_DATA) {
      await Future.delayed(const Duration(milliseconds: 500));
      return Result.ok(getDummyApplicationSet(clubUUID));
    }

    try {
      final response = await dio.get(
        '/api/clubs/$clubUUID/forms',
        options: Options(headers: {'accessToken': 'true'}),
      );

      logger.d('${response.data}');

      logger.d(
          'getApplication - ${response.realUri} 로 요청 성공! (${response.statusCode})');

      if (response.statusCode == 200) {
        final data = response.data;
        if (data == null || data['data'] == null) {
          return Result.error(GlobalException(
            code: "CINT-202",
            message: "지원서가 등록되지 않았습니다.",
            screen: "Application_GetApplication",
          ));
        }
        final formData = data['data'];
        final applicationSet = ApplicationSet.fromJson({
          'clubId': clubUUID,
          'formId': formData['formId']?.toString(),
          'title': formData['title'],
          'description': formData['description'],
          'questions': formData['questions'] ?? [],
        });
        return Result.ok(applicationSet);
      } else {
        return Result.error(GlobalException.fromJson(response.data));
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Future<Result<void>> apply({
    required String clubUUID,
    required String formId,
    required List<Map<String, dynamic>> answers,
  }) async {
    // 더미 데이터 사용
    if (USE_DUMMY_APPLICATION_DATA) {
      await Future.delayed(const Duration(milliseconds: 800));
      logger.d('더미 데이터: 지원서 제출 완료');
      logger.d('제출된 답변: $answers');
      return Result.ok(null);
    }

    try {
      final response = await dio.post(
        '/api/clubs/$clubUUID/forms/$formId/applications',
        data: {
          'answers': answers,
        },
        options: Options(
          headers: {'accessToken': 'true'},
        ),
      );

      logger.d('${response.data}');

      logger.d('apply - ${response.realUri} 로 요청 성공! (${response.statusCode})');

      if (response.statusCode == 201 || response.statusCode == 200) {
        return Result.ok(null);
      } else {
        return Result.error(GlobalException.fromJson(response.data));
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
