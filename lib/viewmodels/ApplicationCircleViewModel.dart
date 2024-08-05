import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/viewmodels/ApplicationCircleRepository.dart';
import 'package:usw_circle_link/model/Circle.dart';

final circleRepositoryProvider = Provider<Applicationcirclerepository>((ref) {
  return Applicationcirclerepository();
});

final circleListProvider = FutureProvider.family<List<Circle>, String>((ref, uuId) {
  final repository = ref.watch(circleRepositoryProvider);
  return repository.fetchCircles(uuId);
});