import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/models/floor_photo_model.dart';
import 'package:usw_circle_link/repositories/circle_repository.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';

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
    try {
      state = const AsyncValue.loading();

      final response = await circleRepository.fetchFloorPhoto(
        FloorType.parseFromCircleRoom(roomFloor),
      );

      state = AsyncValue.data(response);
    } on FloorPhotoModelError catch (e) {
      logger.d(e);
      state = AsyncValue.error(e, e.stackTrace);
    } catch (e) {
      final error = FloorPhotoModelError(message: "예외발생 - $e");
      state = AsyncValue.error(error, error.stackTrace);
    }
  }
}
