import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/models/FindIdModel.dart';
import 'package:usw_circle_link/repositories/auth_repository.dart';

final findIdViewModelProvider = StateNotifierProvider.autoDispose<
    FindIdViewModel, AsyncValue<FindIdModel?>>((ref) {
  final AuthRepository authRepository = ref.read(authRepositoryProvider);
  return FindIdViewModel(authRepository: authRepository);
});

class FindIdViewModel extends StateNotifier<AsyncValue<FindIdModel?>> {
  final AuthRepository authRepository;
  FindIdViewModel({
    required this.authRepository,
  }) : super(AsyncData(null));

  Future<void> findId({
    required String email,
  }) async {
    try {
      state = AsyncLoading();
      if (email.isEmpty) {
        throw FindIdModelError(message: '이메일이 형식에 맞지 않습니다.', code: 'EML-F100');
      }
      final response = await authRepository.findId(email: email);
      state = AsyncData(response);
    } on FindIdModelError catch (e, stackTrace) {
      state = AsyncError(e, stackTrace);
    } catch (e) {
      final error = FindIdModelError(message: '예외발생 - $e');
      state = AsyncError(error, error.stackTrace);
    }

    return Future.value(state);
  }

  void initState() {
    state = AsyncData(null);
  }
}
