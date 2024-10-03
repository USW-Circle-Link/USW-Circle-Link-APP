import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/models/circle_detail_list_model.dart';
import 'package:usw_circle_link/repositories/application_circle_repository.dart';

// ApplicationCircleRepository를 통해 동아리 데이터를 가져오는 FutureProvider 정의
final applicationCircleListProvider = FutureProvider.autoDispose<List<Circle>>((ref) async {
  // ApplicationCircleRepository를 Provider에서 가져옴
  final appCirclerepository = ref.watch(ApplicationCircleRepositoryProvider);

  // 지원한 동아리 목록을 가져오는 메서드 호출
  return await appCirclerepository.getAppCircles();
});
