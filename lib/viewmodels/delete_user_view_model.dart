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
import '../utils/result.dart';

final deleteUserViewModelProvider =
    AutoDisposeNotifierProvider<DeleteUserViewModel, DeleteUserState>(
        DeleteUserViewModel.new);

class DeleteUserViewModel extends AutoDisposeNotifier<DeleteUserState> {
  @override
  DeleteUserState build() {
    return DeleteUserState();
  }

  Future<void> sendCode() async {
    state = state.copyWith(
      isLoading: true,
      error: null,
      isSendCodeSuccess: false,
      isVerifyCodeSuccess: false,
      isCodeError: false,
    );

    final result = await ref.read(deleteUserRepositoryProvider).sendCode();
    switch (result) {
      case Ok(:final value):
        state = state.copyWith(
          isLoading: false,
          isSendCodeSuccess: true,
          email: value,
        );
      case Error(:final error):
        if (error is GlobalException) {
          state = state.copyWith(
            isLoading: false,
            error: ErrorUtil.instance.getErrorMessage(error.code) ??
                '이메일 전송에 실패했습니다. 잠시 후 다시 시도해주세요.',
          );
        } else {
          final exception =
              error.toGlobalException(screen: 'DeleteUser_SendCode');
          await ErrorUtil.instance.logError(exception);
          state = state.copyWith(
            isLoading: false,
            error: '이메일 전송에 실패했습니다. 잠시 후 다시 시도해주세요.',
          );
        }
    }
  }

  Future<void> verifyCode() async {
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

    final result =
        await ref.read(deleteUserRepositoryProvider).verifyCode(code: code);
    switch (result) {
      case Ok(:final value):
        if (value) {
          // Firebase Analytics: 회원탈퇴 성공 (PII 제외)
          analytics.logEvent(
            name: AnalyticsEvent.deleteAccount,
            parameters: {
              AnalyticsParam.timestamp: DateTime.now().toIso8601String(),
            },
          );

          // 토큰 삭제를 state 변경 전에 수행 (AutoDispose로 인한 누락 방지)
          await Future.wait([
            ref.read(secureStorageProvider).delete(key: accessTokenKey),
            ref.read(secureStorageProvider).delete(key: refreshTokenKey),
            ref.read(secureStorageProvider).delete(key: clubUUIDsKey),
          ]);

          await ref.read(userViewModelProvider.notifier).logout.execute();

          state = state.copyWith(
            isLoading: false,
            isVerifyCodeSuccess: true,
          );
        } else {
          state = state.copyWith(
            isLoading: false,
            isVerifyCodeSuccess: false,
          );
        }
      case Error(:final error):
        if (error is GlobalException) {
          state = state.copyWith(
            isLoading: false,
            error: ErrorUtil.instance.getErrorMessage(error.code) ??
                '인증 코드 확인 중 문제가 발생했습니다. 잠시 후 다시 시도해주세요.',
            isCodeError: true,
          );
        } else {
          final exception =
              error.toGlobalException(screen: 'DeleteUser_VerifyCode');
          await ErrorUtil.instance.logError(exception);
          state = state.copyWith(
            isLoading: false,
            error: '인증 코드 확인 중 문제가 발생했습니다. 잠시 후 다시 시도해주세요.',
            isCodeError: true,
          );
        }
    }
  }

  Future<void> getEmail() async {
    final result = await ref.read(deleteUserRepositoryProvider).getEmail();
    switch (result) {
      case Ok(:final value):
        logger.d(value);
        state = state.copyWith(email: value);
      case Error(:final error):
        logger.e('getEmail 실패 - $error');
    }
  }

  void setCode(String value) {
    state = state.copyWith(
      code: value,
    );
  }
}
