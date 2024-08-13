import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/models/ChangePWModel.dart';
import 'package:usw_circle_link/utils/regex/Regex.dart';
import 'package:usw_circle_link/viewmodels/UserViewModel.dart';

final changePWViewModelProvider =
    StateNotifierProvider.autoDispose<ChangePWViewModel, ChangePWModelBase?>(
        (ref) {
  final userViewModel = ref.read(userViewModelProvider.notifier);
  return ChangePWViewModel(userViewModel: userViewModel);
});

class ChangePWViewModel extends StateNotifier<ChangePWModelBase?> {
  final UserViewModel userViewModel;
  ChangePWViewModel({
    required this.userViewModel,
  }) : super(null);

  Future<ChangePWModelBase> changePW({
    required String userPw,
    required String newPw,
    required String confirmNewPw,
  }) async {
    try {
      if (userPw.isEmpty) {
        throw ChangePWModelError(
            message: '현재 비밀번호가 입력되지 않았습니다.', code: "USR-F900", type:ChangePWModelType.changePW);
      }
      if (!passwordRegExp.hasMatch(newPw)) {
        throw ChangePWModelError(
            message: '새로운 비밀번호가 형식에 맞지 않습니다.', code: "USR-F200", type:ChangePWModelType.changePW);
      }
      if (newPw != confirmNewPw) {
        throw ChangePWModelError(message: '비밀번호가 일치하지 않습니다.', code: "USR-F300", type:ChangePWModelType.changePW);
      }

      // 첫 state는 Loading 상태
      state = ChangePWModelLoading();

      final changePWResponse = await userViewModel.changePW(
        userPw: userPw,
        newPw: newPw,
        confirmNewPw: confirmNewPw,
      );

      state = changePWResponse;
    } on ChangePWModelError catch (e) {
      state = e;
    } catch (e) {
      state = ChangePWModelError(message: '예외발생 - $e', type:ChangePWModelType.changePW);
    }
    return Future.value(state);
  }

  Future<ChangePWModelBase> resetPW({
    required String newPw,
    required String confirmNewPw,
  }) async {
    try {
      if (!passwordRegExp.hasMatch(newPw)) {
        throw ChangePWModelError(
            message: '새로운 비밀번호가 형식에 맞지 않습니다.', code: "USR-F200", type:ChangePWModelType.resetPW);
      }
      if (newPw != confirmNewPw) {
        throw ChangePWModelError(message: '비밀번호가 일치하지 않습니다.', code: "USR-F300", type:ChangePWModelType.resetPW);
      }

      // 첫 state는 Loading 상태
      state = ChangePWModelLoading();

      final changePWResponse = await userViewModel.resetPW(
        newPw: newPw,
        confirmNewPw: confirmNewPw,
      );

      state = changePWResponse;
    } on ChangePWModelError catch (e) {
      state = e;
    } catch (e) {
      state = ChangePWModelError(message: '예외발생 - $e', type:ChangePWModelType.resetPW);
    }
    return Future.value(state);
  }
}
