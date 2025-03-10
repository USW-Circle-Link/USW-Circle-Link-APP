import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/dio/dio.dart';
import 'package:usw_circle_link/models/circle_detail_model.dart';
import 'package:usw_circle_link/models/floor_photo_model.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';

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

  Future<CircleDetailModel> fetchClubIntro(String clubUUID) async {
    try {
      final response = await dio.get(
        '$basePath/intro/$clubUUID',
      );

      logger.d(response.data['data']);

      logger.d(
          'fetchClubIntro - ${response.realUri} 로 요청 성공! (${response.statusCode})');

      return CircleDetailModel.fromJson(response.data['data']);
    } catch (e) {
      throw CircleDetailModelError(message: "에외발생 - $e");
    }
  }

  Future<FloorPhotoModel> fetchFloorPhoto(FloorType floorType) async {
    try {
      final response = await dio.get('/mypages/clubs/${floorType.name}/photo');

      logger.d(response.data);

      logger.d(
          'fetchFloorPhoto - ${response.realUri} 로 요청 성공! (${response.statusCode})');

      return FloorPhotoModel.fromJson(response.data);
    } catch (e) {
      throw FloorPhotoModelError(message: "에외발생 - $e");
    }
  }
}
