import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/models/update_profile_model.dart';
import 'package:usw_circle_link/repositories/update_profile_repository.dart';

// 프로필 정보를 가져오는 Provider 정의
final getProfileProvider = FutureProvider.autoDispose<Circle>((ref) async {
  final updateProfileRepository = ref.watch(UpdateProfileRepositoryProvider);

  // 프로필 정보 가져오기
  return await updateProfileRepository.getProfile();
});

// 프로필 업데이트를 처리하는 Provider 정의
final updateProfileViewModel = FutureProvider.family<void, Circle>((ref, updatedProfile) async {
  final updateProfileRepository = ref.watch(UpdateProfileRepositoryProvider);

  // 프로필 업데이트 수행
  await updateProfileRepository.updateProfile(updatedProfile);
});
