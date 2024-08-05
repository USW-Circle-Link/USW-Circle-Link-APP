import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/models/UserModel.dart';
import 'package:usw_circle_link/viewmodels/UserViewModel.dart';

final loginViewModelProvider =
    StateNotifierProvider.autoDispose<LoginViewModel, UserModelBase?>((ref) {
  final userViewModel = ref.watch(userViewModelProvider.notifier);

  return LoginViewModel(
    userViewModel: userViewModel,
  );
});

class LoginViewModel extends StateNotifier<UserModelBase?> {
  final UserViewModel userViewModel;
  LoginViewModel({
    required this.userViewModel,
  }) : super(userViewModel.state.value); // Login Page 에 들어왔다는 것은 User 정보가 없다는 얘기

  Future<UserModelBase> login({
    required String id,
    required String password,
  }) async {
    try {
      // 첫 state는 Loading 상태
      state = UserModelLoading();

      final userResponse = await userViewModel.login(id: id, password: password);
      
      state = userResponse;
      
      return userResponse;
    } catch (e) {
      state = UserModelError(message: '로그인 실패: $e');

      // 반환되는 값은 `UserModelError`임
      return Future.value(state);
    }
  }

  Future<void> logout() async {
    await userViewModel.logout();
  }
}
