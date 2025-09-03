import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:usw_circle_link/domain/models/change_pw/change_pw_model.dart';

import 'package:usw_circle_link/utils/regex/Regex.dart';

import 'package:usw_circle_link/data/services/change_pw/change_pw_service.dart';
import 'package:usw_circle_link/data/services/change_pw/change_pw_service_impl.dart';
import 'package:usw_circle_link/data/repositories/change_pw/change_pw_repository.dart';
import 'package:usw_circle_link/config/constants.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio(BaseOptions(baseUrl: baseUrl));
});

final changePwServiceProvider = Provider<ChangePwService>((ref) {
  return ChangePwServiceImpl(ref.read(dioProvider));
});

final changePwRepositoryProvider = Provider<ChangePwRepository>((ref) {
  return ChangePwRepository(ref.read(changePwServiceProvider));
});
final changePwViewModelProvider = StateNotifierProvider.autoDispose<
    ChangePwViewModel, AsyncValue<ChangePwModel?>>((ref) {
  final repo = ref.read(changePwRepositoryProvider);
  return ChangePwViewModel(repository: repo);
});

class ChangePwViewModel extends StateNotifier<AsyncValue<ChangePwModel?>> {
  final ChangePwRepository repository;

  ChangePwViewModel({required this.repository})
      : super(const AsyncValue.data(null));

  Future<void> changePW({
    required String userPw,
    required String newPw,
    required String confirmNewPw,
  }) async {
    // 로딩 표시
    state = const AsyncValue.loading();

    try {
      // 클라이언트 검증
      if (userPw.isEmpty) {
        throw const ChangePwClientException('현재 비밀번호가 입력되지 않았습니다.');
      }
      if (!newPw.validate()) {
        throw const ChangePwClientException('새로운 비밀번호가 형식에 맞지 않습니다.');
      }
      if (newPw != confirmNewPw) {
        throw const ChangePwClientException('비밀번호가 일치하지 않습니다.');
      }

      // Repository 호출 → 도메인 모델 반환
      final res = await repository.changePassword(
        userPw: userPw,
        newPw: newPw,
        confirmNewPw: confirmNewPw,
      );

      state = AsyncValue.data(res);
    } on ChangePwClientException catch (e, st) {
      state = AsyncValue.error(e.message, st);
    } catch (e, st) {
      state = AsyncValue.error('예외발생 - $e', st);
    }
  }

  Future<void> resetPW({
    required String newPw,
    required String confirmNewPw,
    required String uuid,
  }) async {
    state = const AsyncValue.loading();

    try {
      if (!newPw.validate()) {
        throw const ChangePwClientException('새로운 비밀번호가 형식에 맞지 않습니다.');
      }
      if (newPw != confirmNewPw) {
        throw const ChangePwClientException('비밀번호가 일치하지 않습니다.');
      }

      final res = await repository.resetPassword(
        newPw: newPw,
        confirmNewPw: confirmNewPw,
        uuid: uuid,
      );

      state = AsyncValue.data(res);
    } on ChangePwClientException catch (e, st) {
      state = AsyncValue.error(e.message, st);
    } catch (e, st) {
      state = AsyncValue.error('예외발생 - $e', st);
    }
  }
}

class ChangePwClientException implements Exception {
  final String message;
  const ChangePwClientException(this.message);
}
