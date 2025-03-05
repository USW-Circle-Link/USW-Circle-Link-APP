import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/models/find_id_model.dart';
import 'package:usw_circle_link/repositories/auth_repository.dart';
import 'package:usw_circle_link/utils/regex/Regex.dart';

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

      if (email.isEmpty || !emailVerificationUrlRegExp.hasMatch(email)) {
        throw FindIdModelError(message: '올바른 이메일을 입력해 주세요.', code: 'EML-F100');
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
