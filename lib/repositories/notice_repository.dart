import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/dio/Dio.dart';
import 'package:usw_circle_link/models/notice_detail_model.dart';
import 'package:usw_circle_link/models/notice_model.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';

import '../utils/result.dart';

final noticeRepositoryProvider = Provider<NoticeRepository>((ref) {
  final dio = ref.watch(dioProvider);

  return NoticeRepository(
    basePath: '/notices',
    dio: dio,
  );
});

class NoticeRepository {
  final String basePath;
  final Dio dio;

  NoticeRepository({
    required this.basePath,
    required this.dio,
  });

  Future<Result<NoticeModel>> fetchNotices({
    int page = 0,
    int size = 10,
  }) async {
    try {
      final response = await dio.get(
        '/notices',
        queryParameters: {
          'page': page,
          'size': size,
        },
      );

      logger.d(response.data);

      logger.d(
          'fetchNotices - ${response.realUri} 로 요청 성공! (${response.statusCode})');

      if (response.statusCode == 200) {
        return Result.ok(
          NoticeModel.fromJson(response.data)
              .setType(NoticeModelType.fetchAll),
        );
      } else {
        return Result.error(
          NoticeModelError.fromJson(response.data)
              .setType(NoticeModelType.fetchAll),
        );
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Future<Result<NoticeDetailModel>> getDetail({
    required String noticeUUID,
  }) async {
    try {
      final response = await dio.get(
        '/notices/$noticeUUID',
      );

      logger.d(response.data);

      logger.d(
          'getDetail - ${response.realUri} 로 요청 성공! (${response.statusCode})');

      if (response.statusCode == 200) {
        return Result.ok(
          NoticeDetailModel.fromJson(response.data)
              .setType(NoticeDetailModelType.getDetail),
        );
      } else {
        return Result.error(
          NoticeDetailModelError.fromJson(response.data)
              .setType(NoticeDetailModelType.getDetail),
        );
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
