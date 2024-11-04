import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/models/change_pw_model.dart';
import 'package:usw_circle_link/utils/regex/regex.dart';
import 'package:usw_circle_link/viewmodels/user_view_model.dart';

final changePwViewModelProvider =
    StateNotifierProvider.autoDispose<ChangePwViewModel, ChangePwModelBase?>(
        (ref) {
  final userViewModel = ref.read(userViewModelProvider.notifier);
  return ChangePwViewModel(userViewModel: userViewModel);
});

class ChangePwViewModel extends StateNotifier<ChangePwModelBase?> {
  final UserViewModel userViewModel;
  ChangePwViewModel({
    required this.userViewModel,
  }) : super(null);

  Future<ChangePwModelBase> changePW({
    required String userPw,
    required String newPw,
    required String confirmNewPw,
  }) async {
    try {
      if (userPw.isEmpty) {
        throw ChangePwModelError(
            message: '현재 비밀번호가 입력되지 않았습니다.', code: "USR-F900", type:ChangePwModelType.changePW);
      }
      if (!newPw.validate()) {
        throw ChangePwModelError(
            message: '새로운 비밀번호가 형식에 맞지 않습니다.', code: "USR-F200", type:ChangePwModelType.changePW);
      }
      if (newPw != confirmNewPw) {
        throw ChangePwModelError(message: '비밀번호가 일치하지 않습니다.', code: "USR-F300", type:ChangePwModelType.changePW);
      }

      // 첫 state는 Loading 상태
      state = ChangePwModelLoading();

      final changePWResponse = await userViewModel.changePW(
        userPw: userPw,
        newPw: newPw,
        confirmNewPw: confirmNewPw,
      );

      state = changePWResponse;
    } on ChangePwModelError catch (e) {
      state = e;
    } catch (e) {
      state = ChangePwModelError(message: '예외발생 - $e', type:ChangePwModelType.changePW);
    }
    return Future.value(state);
  }

  Future<ChangePwModelBase> resetPW({
    required String newPw,
    required String confirmNewPw,
    required String uuid,
  }) async {
    try {
      if (!newPw.validate()) {
        throw ChangePwModelError(
            message: '새로운 비밀번호가 형식에 맞지 않습니다.', code: "USR-F200", type:ChangePwModelType.resetPW);
      }
      if (newPw != confirmNewPw) {
        throw ChangePwModelError(message: '비밀번호가 일치하지 않습니다.', code: "USR-F300", type:ChangePwModelType.resetPW);
      }

      // 첫 state는 Loading 상태
      state = ChangePwModelLoading();

      final changePWResponse = await userViewModel.resetPW(
        newPw: newPw,
        confirmNewPw: confirmNewPw,
        uuid: uuid,
      );

      state = changePWResponse;
    } on ChangePwModelError catch (e) {
      state = e;
    } catch (e) {
      state = ChangePwModelError(message: '예외발생 - $e', type:ChangePwModelType.resetPW);
    }
    return Future.value(state);
  }
}
