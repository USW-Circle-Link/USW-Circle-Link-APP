import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/models/find_id_model.dart';
import 'package:usw_circle_link/models/response/global_exception.dart';
import 'package:usw_circle_link/repositories/auth_repository.dart';
import 'package:usw_circle_link/utils/regex/Regex.dart';
import 'package:usw_circle_link/utils/result.dart';

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
        throw GlobalException(message: '올바른 이메일을 입력해 주세요.', code: 'EML-F100');
      }

      final result = await authRepository.findId(email: email);
      switch (result) {
        case Ok():
          state = AsyncData(result.value);
        case Error():
          final error = GlobalException(message: result.error.toString());
          state = AsyncError(error, error.stackTrace);
      }
    } on GlobalException catch (e, stackTrace) {
      state = AsyncError(e, stackTrace);
    } catch (e) {
      final error = GlobalException(message: '예외발생 - $e');
      state = AsyncError(error, error.stackTrace);
    }

    return Future.value(state);
  }

  void initState() {
    state = AsyncData(null);
  }
}
