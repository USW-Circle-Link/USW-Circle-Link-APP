import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/repositories/my_circle_repository.dart';
import 'package:usw_circle_link/models/my_circle_model.dart';

final MyCircleListProvider = FutureProvider<List<Circle>>((ref) async {

  final myCirclerepository = ref.watch(MyCircleRepositoryProvider);

  return await myCirclerepository.getMyCircles();
});