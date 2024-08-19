import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/repositories/application_circle_repository.dart';
import 'package:usw_circle_link/models/application_cricle_model.dart';

final circleRepositoryProvider = Provider<ApplicationCircleRepository>((ref) {
  return ApplicationCircleRepository();
});

final circleListProvider = FutureProvider.family<List<Circle>, String>((ref, token) {
  final repository = ref.watch(circleRepositoryProvider);
  return repository.fetchCircles(token);
});