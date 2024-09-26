import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/dio/dio.dart';
import 'package:usw_circle_link/const/data.dart';
import 'package:usw_circle_link/models/notice_detail_model.dart';
import 'package:usw_circle_link/models/notice_model.dart';
import 'package:usw_circle_link/utils/logger/Logger.dart';

final noticeRepositoryProvider = Provider<NoticeRepository>((ref) {
  final dio = ref.watch(dioProvider);

  return NoticeRepository(
    baseUrl: 'https://$host:$port/my-notices',
    dio: dio,
  );
});

class NoticeRepository {
  final String baseUrl;
  final Dio dio;

  NoticeRepository({
    required this.baseUrl,
    required this.dio,
  });

  Future<NoticeModel> fetchNotices() async {
    final response = await dio.get(
      baseUrl,
    );

    logger.d(response.data);

    logger.d(
        'fetchNotices - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return NoticeModel.fromJson(response.data)
          .setType(NoticeModelType.fetchAll);
    } else {
      // Bad Request
      throw NoticeModelError.fromJson(response.data)
          .setType(NoticeModelType.fetchAll);
    }
  }

  Future<NoticeDetailModel> getDetail({
    required int noticeId,
  }) async {
    final response = await dio.get(
      '$baseUrl/$noticeId/details',
    );

    logger.d(response.data);

    logger
        .d('getDetail - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return NoticeDetailModel.fromJson(response.data)
          .setType(NoticeDetailModelType.getDetail);
    } else {
      // Bad Request
      throw NoticeDetailModelError.fromJson(response.data)
          .setType(NoticeDetailModelType.getDetail);
    }
  }
}
