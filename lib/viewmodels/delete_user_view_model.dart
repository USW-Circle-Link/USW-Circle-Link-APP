import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:usw_circle_link/models/delete_user_model.dart';
import 'package:usw_circle_link/secure_storage/secure_storage.dart';
import 'package:usw_circle_link/viewmodels/user_view_model.dart';

final deleteUserViewModelProvider = StateNotifierProvider.autoDispose<
    DeleteUserViewModel, AsyncValue<DeleteUserModel?>>((ref) {
  final UserViewModel userViewModel = ref.read(userViewModelProvider.notifier);
  final FlutterSecureStorage storage = ref.read(secureStorageProvider);
  return DeleteUserViewModel(
    userViewModel: userViewModel,
    storage: storage,
  );
});

class DeleteUserViewModel extends StateNotifier<AsyncValue<DeleteUserModel?>> {
  final UserViewModel userViewModel;
  final FlutterSecureStorage storage;
  DeleteUserViewModel({
    required this.userViewModel,
    required this.storage,
  }) : super(const AsyncData(null));

  Future<void> sendCode() async {
    try {
      state = const AsyncLoading();
      final response = await userViewModel.sendCode();

      state = AsyncData(response);
    } on DeleteUserModelError catch (e) {
      state = AsyncError(e, StackTrace.current);
    } catch (e) {
      final error = DeleteUserModelError(
          message: '예외발생 - $e', type: DeleteUserModelType.sendCode);
      state = AsyncError(error, StackTrace.current);
    }
  }

  void initState() {
    state = const AsyncData(null);
  }

  Future<void> verifyCode({
    required String code,
  }) async {
    try {
      state = const AsyncLoading();
      if (code.isEmpty) {
        throw DeleteUserModelError(
          message: '인증코드가 형식에 맞지 않습니다.',
          code: 'WT-F100',
          type: DeleteUserModelType.verifyCode,
        );
      }
      final response = await userViewModel.verifyCode(
        code: code,
      );
      state = AsyncData(response);

      await userViewModel.logout();
    } on DeleteUserModelError catch (e) {
      state = AsyncError(e, StackTrace.current);
    } catch (e) {
      final error = DeleteUserModelError(
        message: '예외발생 - $e',
        type: DeleteUserModelType.verifyCode,
      );
      state = AsyncError(error, StackTrace.current);
    }
  }
}
