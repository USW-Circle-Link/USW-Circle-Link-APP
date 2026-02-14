import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/models/floor_photo_model.dart';
import 'package:usw_circle_link/repositories/circle_repository.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';
import 'package:usw_circle_link/utils/result.dart';

final floorPhotoViewModelProvider = StateNotifierProvider.autoDispose
    .family<FloorPhotoViewModel, AsyncValue<FloorPhotoModel?>, String>(
        (ref, roomFloor) {
  final circleRepository = ref.watch(circleRepositoryProvider);

  return FloorPhotoViewModel(
    circleRepository: circleRepository,
    roomFloor: roomFloor,
  );
});

class FloorPhotoViewModel extends StateNotifier<AsyncValue<FloorPhotoModel?>> {
  final CircleRepository circleRepository;
  final String roomFloor;

  FloorPhotoViewModel({
    required this.circleRepository,
    required this.roomFloor,
  }) : super(const AsyncValue.data(null)) {
    getFloorPhoto(roomFloor: roomFloor);
  }

  Future<void> getFloorPhoto({
    required String roomFloor,
  }) async {
    state = const AsyncValue.loading();

    final result = await circleRepository.fetchFloorPhoto(
      FloorType.parseFromCircleRoom(roomFloor),
    );

    switch (result) {
      case Ok(:final value):
        state = AsyncValue.data(value);
      case Error(:final error):
        if (error is FloorPhotoModelError) {
          logger.d(error);
          state = AsyncValue.error(error, error.stackTrace);
        } else {
          final modelError = FloorPhotoModelError(message: "예외발생 - $error");
          state = AsyncValue.error(modelError, modelError.stackTrace);
        }
    }
  }
}
