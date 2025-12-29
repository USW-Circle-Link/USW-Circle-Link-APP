import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/const/analytics_const.dart';
import 'package:usw_circle_link/const/data.dart';
import 'package:usw_circle_link/repositories/delete_user_repository.dart';
import 'package:usw_circle_link/secure_storage/secure_storage.dart';
import 'package:usw_circle_link/utils/error_util.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';
import 'package:usw_circle_link/viewmodels/state/delete_user_state.dart';
import 'package:usw_circle_link/viewmodels/user_view_model.dart';

import '../models/response/global_exception.dart';

final deleteUserViewModelProvider =
    AutoDisposeNotifierProvider<DeleteUserViewModel, DeleteUserState>(
        DeleteUserViewModel.new);

class DeleteUserViewModel extends AutoDisposeNotifier<DeleteUserState> {
  @override
  DeleteUserState build() {
    return DeleteUserState();
  }

  Future<void> sendCode() async {
    try {
      state = state.copyWith(
        isLoading: true,
        error: null,
        isSendCodeSuccess: false,
        isVerifyCodeSuccess: false,
        isCodeError: false,
      );

      final result = await ref
          .read(deleteUserRepositoryProvider)
          .sendCode(); // true or exception

      if (result) {
        state = state.copyWith(
          isLoading: false,
          isSendCodeSuccess: true,
        );
      }
    } on GlobalException catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: ErrorUtil.instance.getErrorMessage(e.code) ??
            '이메일 전송에 실패했습니다. 잠시 후 다시 시도해주세요.',
      );
    } on Exception catch (e) {
      final exception = e.toGlobalException(screen: 'DeleteUser_SendCode');
      await ErrorUtil.instance.logError(exception);
      state = state.copyWith(
        isLoading: false,
        error: '이메일 전송에 실패했습니다. 잠시 후 다시 시도해주세요.',
      );
    }
  }

  Future<void> verifyCode() async {
    try {
      state = state.copyWith(
        isLoading: true,
        isVerifyCodeSuccess: false,
        error: null,
        isCodeError: false,
      );

      final code = state.code;

      if (code.isEmpty) {
        state = state.copyWith(
          isLoading: false,
          error: '인증코드를 입력해 주세요.',
          isCodeError: true,
        );
        return;
      }

      final userState = ref.read(userViewModelProvider);

      final result =
          await ref.read(deleteUserRepositoryProvider).verifyCode(code: code);

      if (result) {
        // Firebase Analytics: 회원탈퇴 성공
        analytics.logEvent(
          name: AnalyticsEvent.deleteAccount,
          parameters: {
            AnalyticsParam.timestamp: DateTime.now().toIso8601String(),
            AnalyticsParam.major: userState.state.major ?? 'unknown',
            AnalyticsParam.userName: userState.state.userName ?? 'unknown',
            AnalyticsParam.studentNumber:
                userState.state.studentNumber ?? 'unknown',
            AnalyticsParam.userHp: userState.state.userHp ?? 'unknown',
          },
        );

        state = state.copyWith(
          isLoading: false,
          isVerifyCodeSuccess: true,
        );

        await Future.wait([
          ref.read(secureStorageProvider).delete(key: accessTokenKey),
          ref.read(secureStorageProvider).delete(key: refreshTokenKey),
          ref.read(secureStorageProvider).delete(key: clubUUIDsKey),
        ]);

        await ref.read(userViewModelProvider.notifier).logout.execute();
      }
    } on GlobalException catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: ErrorUtil.instance.getErrorMessage(e.code) ??
            '인증 코드 확인 중 문제가 발생했습니다. 잠시 후 다시 시도해주세요.',
        isCodeError: true,
      );
    } on Exception catch (e) {
      final exception = e.toGlobalException(screen: 'DeleteUser_VerifyCode');
      await ErrorUtil.instance.logError(exception);
      state = state.copyWith(
        isLoading: false,
        error: '인증 코드 확인 중 문제가 발생했습니다. 잠시 후 다시 시도해주세요.',
        isCodeError: true,
      );
    }
  }

  Future<void> getEmail() async {
    final result = await ref.read(deleteUserRepositoryProvider).getEmail();
    logger.d(result);
    state = state.copyWith(
      email: result,
    );
  }

  void setCode(String value) {
    state = state.copyWith(
      code: value,
    );
  }
}
