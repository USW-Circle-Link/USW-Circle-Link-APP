import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/models/ChangePWModel.dart';
import 'package:usw_circle_link/viewmodels/UserViewModel.dart';

final changePWViewModelProvider = StateNotifierProvider<ChangePWViewModel, ChangePWModelBase?>((ref) {
  final userViewModel = ref.read(userViewModelProvider.notifier);
  return ChangePWViewModel(userViewModel: userViewModel);
});

class ChangePWViewModel extends StateNotifier<ChangePWModelBase?> {
  final UserViewModel userViewModel;
  ChangePWViewModel({
    required this.userViewModel,
  }): super(null);
  
  Future<ChangePWModelBase> changePW({
    required String userPw,
    required String newPw,
    required String confirmNewPw,
  }) async {
    try {
      // 첫 state는 Loading 상태
      state = ChangePWModelLoading();

      final userResponse = await userViewModel.changePW(userPw: userPw, newPw: newPw, confirmNewPw: confirmNewPw);
      
      state = userResponse;
      
      return userResponse;
    } catch (e) {
      state = ChangePWModelError(message: '비밀번호 변경 실패: $e');

      // 반환되는 값은 `UserModelError`임
      return Future.value(state);
    }
  }
}