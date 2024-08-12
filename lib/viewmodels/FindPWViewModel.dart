import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/models/FindPWModel.dart';
import 'package:usw_circle_link/repositories/AuthRepository.dart';

final findPWViewModelProvider =
    StateNotifierProvider<FindPWViewModel, FindPWModelBase?>((ref) {
  final AuthRepository authRepository = ref.read(authRepositoryProvider);
  return FindPWViewModel(authRepository: authRepository);
});

class FindPWViewModel extends StateNotifier<FindPWModelBase?> {
  final AuthRepository authRepository;
  FindPWViewModel({
    required this.authRepository,
  }) : super(null);

  Future<FindPWModelBase> findPW({
    required String account,
    required String email,
  }) async {
    try {
      if (account.isEmpty) {
        throw FindPWModelError(message: '아이디가 형식에 맞지 않습니다.', code: 'EML-F200', type: FindPWModelType.findPW);
      }
      if (email.isEmpty) {
        throw FindPWModelError(message: '이메일이 형식에 맞지 않습니다.', code: 'EML-F100', type: FindPWModelType.findPW);
      }
      final response = await authRepository.findPW(account: account, email: email);
      state = response;
    } on FindPWModelError catch (e) {
      state = e;
    } catch (e) {
      state =
          FindPWModelError(message: '예외발생 - $e', type: FindPWModelType.findPW);
    }

    return Future.value(state);
  }

  void initState() {
    state = null;
  }
}
