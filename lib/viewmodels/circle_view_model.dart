import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/repositories/circle_repository.dart';
import 'package:usw_circle_link/models/my_circle_model.dart';

final circleRepositoryProvider = Provider<CircleRepository>((ref) {
  return CircleRepository();
});

final circleListProvider = FutureProvider.family<List<Circle>, String>((ref, token) {
  final repository = ref.watch(circleRepositoryProvider);
  return repository.fetchCircles(token);
});
