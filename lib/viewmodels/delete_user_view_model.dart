

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:usw_circle_link/models/delete_user_model.dart';
import 'package:usw_circle_link/secure_storage/secure_storage.dart';
import 'package:usw_circle_link/viewmodels/user_view_model.dart';

final deleteUserViewModelProvider =
    StateNotifierProvider.autoDispose<DeleteUserViewModel, DeleteUserModelBase?>((ref) {
  final UserViewModel userViewModel  = ref.read(userViewModelProvider.notifier);
  final FlutterSecureStorage storage = ref.read(secureStorageProvider);
  return DeleteUserViewModel(
    userViewModel: userViewModel,
    storage: storage,
  );
});

class DeleteUserViewModel extends StateNotifier<DeleteUserModelBase?> {
  final UserViewModel userViewModel;
  final FlutterSecureStorage storage;
  DeleteUserViewModel({
    required this.userViewModel,
    required this.storage,
  }) : super(null);

  Future<DeleteUserModelBase> sendCode() async {
    try {
      state = DeleteUserModelLoading();
      final response =
          await userViewModel.sendCode();

      state = response;
    } on DeleteUserModelError catch (e) {
      state = e;
    } catch (e) {
      state = DeleteUserModelError(
          message: '예외발생 - $e', type: DeleteUserModelType.sendCode);
    }

    return Future.value(state);
  }

  void initState() {
    state = null;
  }

  Future<void> verifyCode({
    required String code,
  }) async {
    try {
      if (code.isEmpty) {
        throw DeleteUserModelError(
          message: '인증코드가 형식에 맞지 않습니다.',
          code: 'WT-F100',
          type: DeleteUserModelType.verifyCode,
        );
      }
      state = DeleteUserModelLoading();
      final response = await userViewModel.verifyCode(
        code: code,
      );
      state = response;

      await userViewModel.logout();
    } on DeleteUserModelError catch (e) {
      state = e;
    } catch (e) {
      state = DeleteUserModelError(
        message: '예외발생 - $e',
        type: DeleteUserModelType.verifyCode,
      );
    }
  }
}
