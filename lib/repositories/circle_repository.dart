import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/dio/Dio.dart';
import 'package:usw_circle_link/models/circle_detail_model.dart';
import 'package:usw_circle_link/models/floor_photo_model.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';

import '../utils/result.dart';

enum FloorType {
  B1,
  F1,
  F2;

  const FloorType();

  factory FloorType.parseFromCircleRoom(String circleRoom) {
    if (circleRoom.startsWith('B1')) {
      return FloorType.B1;
    } else if (circleRoom.startsWith('1')) {
      return FloorType.F1;
    } else if (circleRoom.startsWith('2')) {
      return FloorType.F2;
    } else {
      throw Exception('Invalid circle room: $circleRoom');
    }
  }
}

final circleRepositoryProvider = Provider<CircleRepository>((ref) {
  final dio = ref.read(dioProvider);
  final basePath = '/clubs';
  return CircleRepository(dio: dio, basePath: basePath);
});

class CircleRepository {
  final Dio dio;
  final String basePath;

  CircleRepository({required this.dio, required this.basePath});

  Future<Result<CircleDetailModel>> fetchClubIntro(String clubUUID) async {
    try {
      final response = await dio.get(
        '$basePath/$clubUUID',
      );

      logger.d(response.data['data']);

      logger.d(
          'fetchClubIntro - ${response.realUri} 로 요청 성공! (${response.statusCode})');

      return Result.ok(CircleDetailModel.fromJson(response.data['data']));
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Future<Result<FloorPhotoModel>> fetchFloorPhoto(FloorType floorType) async {
    try {
      final response = await dio.get(
        '/users/clubs/${floorType.name}/photo',
        options: Options(
          headers: {
            'accessToken': 'true',
          },
        ),
      );

      logger.d(response.data);

      logger.d(
          'fetchFloorPhoto - ${response.realUri} 로 요청 성공! (${response.statusCode})');

      final responseData = response.data;
      if (responseData == null || responseData['data'] == null) {
        return Result.error(
          FloorPhotoModelError(message: "층별 배치도 사진이 등록되지 않았습니다."),
        );
      }

      return Result.ok(FloorPhotoModel.fromJson(responseData));
    } on FloorPhotoModelError catch (e) {
      return Result.error(e);
    } catch (e) {
      return Result.error(
        FloorPhotoModelError(message: "예외발생 - $e"),
      );
    }
  }
}
