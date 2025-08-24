import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/models/category_model.dart';
import 'package:usw_circle_link/repositories/circle_list_repository.dart';

final categoryViewModelProvider = StateNotifierProvider.autoDispose<
    CategoryViewModel, AsyncValue<CategoryModel?>>((ref) {
  final repository = ref.read(circleListRepositoryProvider);
  return CategoryViewModel(repository);
});

class CategoryViewModel extends StateNotifier<AsyncValue<CategoryModel?>> {
  final CircleListRepository _repository;

  CategoryViewModel(this._repository) : super(AsyncData(null)) {
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    try {
      state = AsyncLoading();
      final response = await _repository.fetchCategory();
      state = AsyncData(response);
    } on CategoryModelError catch (e) {
      state = AsyncError(e, e.stackTrace);
    } catch (e) {
      final error = CategoryModelError(message: '예외발생 - $e');
      state = AsyncError(error, error.stackTrace);
    }
  }
}
