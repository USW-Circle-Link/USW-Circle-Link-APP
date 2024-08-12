import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/models/FindIdModel.dart';
import 'package:usw_circle_link/repositories/AuthRepository.dart';

final findIdViewModelProvider =
    StateNotifierProvider<FindIdViewModel, FindIdModelBase?>((ref) {
  final AuthRepository authRepository = ref.read(authRepositoryProvider);
  return FindIdViewModel(authRepository: authRepository);
});

class FindIdViewModel extends StateNotifier<FindIdModelBase?> {
  final AuthRepository authRepository;
  FindIdViewModel({
    required this.authRepository,
  }) : super(null);

  Future<FindIdModelBase> findId({
    required String email,
  }) async {
    try {
      if (email.isEmpty) {
        throw FindIdModelError(message: '이메일이 형식에 맞지 않습니다.', code: 'EML-F100');
      }
      final response = await authRepository.findId(email: email);
      state = response;
    } on FindIdModelError catch (e) {
      state = e;
    } catch (e) {
      state =
          FindIdModelError(message: '예외발생 - $e', type: FindIdModelType.findId);
    }

    return Future.value(state);
  }

  void initState() {
    state = null;
  }
}
