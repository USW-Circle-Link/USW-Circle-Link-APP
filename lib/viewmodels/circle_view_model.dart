import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/viewmodels/CircleRepository.dart';
import 'package:usw_circle_link/model/MyCircleModel.dart';

final circleRepositoryProvider = Provider<CircleRepository>((ref) {
  return CircleRepository();
});

final circleListProvider = FutureProvider.family<List<Circle>, String>((ref, token) {
  final repository = ref.watch(circleRepositoryProvider);
  return repository.fetchCircles(token);
});
