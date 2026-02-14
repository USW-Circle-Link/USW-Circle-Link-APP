import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/models/category_model.dart';
import 'package:usw_circle_link/repositories/circle_list_repository.dart';
import 'package:usw_circle_link/utils/result.dart';

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
    state = AsyncLoading();
    final result = await _repository.fetchCategory();
    switch (result) {
      case Ok(:final value):
        state = AsyncData(value);
      case Error(:final error):
        if (error is CategoryModelError) {
          state = AsyncError(error, error.stackTrace);
        } else {
          final categoryError = CategoryModelError(message: '예외발생 - $error');
          state = AsyncError(categoryError, categoryError.stackTrace);
        }
    }
  }
}
