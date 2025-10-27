import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/models/find_id_model.dart';
import 'package:usw_circle_link/models/response/global_exception.dart';
import 'package:usw_circle_link/repositories/auth_repository.dart';
import 'package:usw_circle_link/utils/regex/Regex.dart';
import 'package:usw_circle_link/utils/result.dart';

import '../utils/error_util.dart';

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
    state = AsyncLoading();

    if (email.isEmpty || !emailVerificationUrlRegExp.hasMatch(email)) {
      throw GlobalException(message: '올바른 이메일을 입력해 주세요.', code: 'EML-F100');
    }

    final result = await authRepository.findId(email: email);
    switch (result) {
      case Ok():
        state = AsyncData(result.value);
      case Error():
        var exception = result.error;
        if (exception is GlobalException) {
          state = AsyncError(exception, exception.stackTrace);
          return;
        }
        exception = exception.toGlobalException();
        await ErrorUtil.instance.logError(exception, screen: 'FindId');
        state = AsyncError(exception, exception.stackTrace);
    }
  }

  void initState() {
    state = AsyncData(null);
  }
}
