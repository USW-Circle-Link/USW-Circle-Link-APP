import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/models/change_pw_model.dart';
import 'package:usw_circle_link/utils/regex/Regex.dart';
import 'package:usw_circle_link/utils/result.dart';
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
      // 첫 state는 Loading 상태
      state = ChangePwModelLoading();

      if (userPw.isEmpty) {
        throw ChangePwModelError(
            message: '현재 비밀번호가 입력되지 않았습니다.',
            code: "USR-F900",
            type: ChangePwModelType.changePW);
      }
      if (!newPw.validate()) {
        throw ChangePwModelError(
            message: '새로운 비밀번호가 형식에 맞지 않습니다.',
            code: "USR-F200",
            type: ChangePwModelType.changePW);
      }
      if (newPw != confirmNewPw) {
        throw ChangePwModelError(
            message: '비밀번호가 일치하지 않습니다.',
            code: "USR-F300",
            type: ChangePwModelType.changePW);
      }

      await userViewModel.changePW.execute(userPw, newPw, confirmNewPw);

      if (userViewModel.changePW.error) {
        final result = userViewModel.changePW.result as Error;
        final error = result.error;
        throw (error is ChangePwModelError)
            ? error.setType(ChangePwModelType.changePW)
            : ChangePwModelError(
                message: error.toString(),
                type: ChangePwModelType.changePW,
              );
      }

      final changePWResponse = ChangePwModel(
        message: '비밀번호가 변경되었습니다',
        type: ChangePwModelType.changePW,
      );

      state = changePWResponse;
    } on ChangePwModelError catch (e) {
      state = e;
    } catch (e) {
      state = ChangePwModelError(
          message: '예외발생 - $e', type: ChangePwModelType.changePW);
    }
    return Future.value(state);
  }

  Future<ChangePwModelBase> resetPW({
    required String newPw,
    required String confirmNewPw,
    required String uuid,
  }) async {
    try {
      // 첫 state는 Loading 상태
      state = ChangePwModelLoading();

      if (!newPw.validate()) {
        throw ChangePwModelError(
            message: '새로운 비밀번호가 형식에 맞지 않습니다.',
            code: "USR-F200",
            type: ChangePwModelType.resetPW);
      }
      if (newPw != confirmNewPw) {
        throw ChangePwModelError(
            message: '비밀번호가 일치하지 않습니다.',
            code: "USR-F300",
            type: ChangePwModelType.resetPW);
      }

      await userViewModel.resetPW.execute(newPw, confirmNewPw, uuid);

      if (userViewModel.resetPW.error) {
        final result = userViewModel.resetPW.result as Error;
        final error = result.error;
        throw (error is ChangePwModelError)
            ? error.setType(ChangePwModelType.resetPW)
            : ChangePwModelError(
                message: error.toString(),
                type: ChangePwModelType.resetPW,
              );
      }

      final changePWResponse = ChangePwModel(
        message: '비밀번호가 재설정되었습니다',
        type: ChangePwModelType.resetPW,
      );

      state = changePWResponse;
    } on ChangePwModelError catch (e) {
      state = e;
    } catch (e) {
      state = ChangePwModelError(
          message: '예외발생 - $e', type: ChangePwModelType.resetPW);
    }
    return Future.value(state);
  }
}
