import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dio/Dio.dart';
import '../models/response/global_exception.dart';
import '../models/response/verify_event_response.dart';
import '../utils/logger/logger.dart';
import '../utils/result.dart';

final eventRepositoryProvider = Provider<EventRepository>((ref) {
  final dio = ref.watch(dioProvider);

  return EventRepository(
    basePath: '/users/event',
    dio: dio,
  );
});

class EventRepository {
  final String basePath;
  final Dio dio;

  EventRepository({
    required this.basePath,
    required this.dio,
  });

  Future<Result<bool>> getStatus() async {
    try {
      final response = await dio.get(
        '$basePath/status',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'accessToken': 'true',
          },
        ),
      );

      logger.d(response.data);

      logger.d(
          'getStatus - ${response.realUri} 로 요청 성공! (${response.statusCode})');

      if (response.statusCode == 200) {
        return Result.ok(response.data['data']['verified'] as bool);
      } else {
        return Result.error(GlobalException.fromJson(response.data));
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Future<Result<bool>> verify({
    required String code,
  }) async {
    try {
      final body = {
        "code": code,
      };
      final response = await dio.post(
        '$basePath/verify',
        data: body,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'accessToken': 'true',
          },
        ),
      );

      logger.d(response.data);

      logger.d(
          'verifyCode - ${response.realUri} 로 요청 성공! (${response.statusCode})');

      if (response.statusCode == 200) {
        final data = VerifyEventResponse.fromJson(response.data['data']);
        return Result.ok(data.isFirstVerify);
      } else {
        return Result.error(GlobalException.fromJson(response.data));
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
