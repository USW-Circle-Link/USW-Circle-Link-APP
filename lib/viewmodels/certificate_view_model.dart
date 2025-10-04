

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repositories/wristband_repository.dart';

class CertificateViewModel extends StateNotifier<AsyncValue<void>> {
  CertificateViewModel({required this.repository}) : super(const AsyncValue.data(null));

  final CertificateRepository repository;

  Future<void> certificate() async {
    /// 1. 사용자 로그인 정보(유저 id, 동아리 id) 가져 오기
    state = const AsyncValue.loading(); //로딩 시작
    try {
      await repository.certificateRepository(); // 서버 API 호출
      state = AsyncValue.data(null);
    }
    catch (e, st) {
     state = AsyncValue.error(e, st);
     print("에러 발생: $e",);
    }

    /// 2. Repository 통해 서버 호출
    /// 3. 성공/실패 상태 갱신
  }
}

final certificateViewModelProvider =
    StateNotifierProvider<CertificateViewModel, AsyncValue<void>>(
        (ref) => CertificateViewModel(repository: ref.read(certificateRepositoryProvider)),
    );

