import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/viewmodels/ApplicationCircleRepository.dart';
import 'package:usw_circle_link/model/ApplicationCricleModel.dart';

final circleRepositoryProvider = Provider<ApplicationCircleRepository>((ref) {
  return ApplicationCircleRepository();
});

final circleListProvider = FutureProvider.family<List<Circle>, String>((ref, token) {
  final repository = ref.watch(circleRepositoryProvider);
  return repository.fetchCircles(token);
});