import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/models/circle_detail_list_model.dart';
import 'package:usw_circle_link/repositories/my_circle_repository.dart';

final MyCircleListProvider = FutureProvider.autoDispose<List<Circle>>((ref) async {

  final myCirclerepository = ref.watch(MyCircleRepositoryProvider);

  return await myCirclerepository.getMyCircles();
});