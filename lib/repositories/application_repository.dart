import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/const/data.dart';
import 'package:usw_circle_link/dio/Dio.dart';
import 'package:usw_circle_link/models/application_set.dart';
import 'package:usw_circle_link/models/response/application_detail_response.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';

import '../models/response/global_exception.dart';
import '../utils/interceptor/token_interceptor.dart';
import '../utils/result.dart';

bool _isAuthFailure(DioException e) =>
    e.response?.statusCode == 401 ||
    (e.response == null &&
        e.type == DioExceptionType.cancel &&
        (e.message == TokenInterceptor.tokenNotFoundMessage ||
            e.message == TokenInterceptor.refreshFailedMessage));

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
        '/clubs/$clubUUID/applications/eligibility',
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
        // eligibility API는 boolean 값을 직접 반환할 것으로 예상
        final eligible = data['data'] as bool?;
        return Result.ok(eligible ?? false);
      } else if (response.statusCode == 404) {
        return Result.ok(false);
      } else {
        return Result.error(GlobalException.fromJson(response.data));
      }
    } on DioException catch (e) {
      if (_isAuthFailure(e)) {
        return Result.error(GlobalException(
          code: "USR-F401",
          message: "로그인이 필요합니다",
          screen: "Application_CheckAvailableForApplication",
        ));
      }
      return Result.error(e);
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
        '/clubs/$clubUUID/forms',
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
        final questions = formData['questions'];
        final applicationSet = ApplicationSet.fromJson({
          'clubId': clubUUID,
          'formId': formData['formId']?.toString(),
          'title': formData['title'],
          'questions': questions is List ? questions : [],
        });
        return Result.ok(applicationSet);
      } else {
        return Result.error(GlobalException.fromJson(response.data));
      }
    } on DioException catch (e) {
      if (_isAuthFailure(e)) {
        return Result.error(GlobalException(
          code: "USR-F401",
          message: "로그인이 필요합니다",
          screen: "Application_GetApplication",
        ));
      }
      return Result.error(e);
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
      logger.d('제출된 답변 수: ${answers.length}');
      return Result.ok(null);
    }

    try {
      final response = await dio.post(
        '/clubs/$clubUUID/applications',
        data: {
          'formId': formId,
          'answers': answers,
        },
        options: Options(
          headers: {'accessToken': 'true'},
        ),
      );

      logger.d('${response.data}');

      logger.d('apply - ${response.realUri} 로 요청 성공! (${response.statusCode})');

      logger.d('apply - 제출된 답변 수: ${answers.length}');

      if (response.statusCode == 201 || response.statusCode == 200) {
        return Result.ok(null);
      } else {
        return Result.error(GlobalException.fromJson(response.data));
      }
    } on DioException catch (e) {
      if (_isAuthFailure(e)) {
        return Result.error(GlobalException(
          code: "USR-F401",
          message: "로그인이 필요합니다",
          screen: "Application_Apply",
        ));
      }
      return Result.error(e);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  /// 본인 지원서 질문/답변 조회
  ///
  /// 본인이 제출한 지원서의 문항과 답변 목록을 한꺼번에 조회합니다.
  ///
  /// [clubUUID]: 동아리 UUID
  /// [aplictId]: 지원서 ID
  ///
  /// return: ApplicationDetailResponse - 질문과 답변 목록을 포함하는 응답
  Future<Result<ApplicationDetailResponse>> getApplicationDetail({
    required String clubUUID,
    required String aplictId,
  }) async {
    try {
      final response = await dio.get(
        '/clubs/$clubUUID/applications/$aplictId',
        options: Options(headers: {'accessToken': 'true'}),
      );

      logger.d('${response.data}');

      logger.d('getApplicationDetail - ${response.realUri} 로 요청 성공! (${response.statusCode})');

      if (response.statusCode == 200) {
        final applicationDetailResponse =
            ApplicationDetailResponse.fromJson(response.data);
        return Result.ok(applicationDetailResponse);
      } else {
        return Result.error(GlobalException.fromJson(response.data));
      }
    } on DioException catch (e) {
      if (_isAuthFailure(e)) {
        return Result.error(GlobalException(
          code: "USR-F401",
          message: "로그인이 필요합니다",
          screen: "Application_GetApplicationDetail",
        ));
      }
      return Result.error(e);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
