import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../const/data.dart';
import '../repositories/certificate_circle_repository.dart';
import '../repositories/circle_list_repository.dart';
//
// class CertificateViewModel extends StateNotifier<AsyncValue<String>> {
//   CertificateViewModel({required this.repository, required this.circleListRepository})
//       : super(const AsyncValue.data(""));
//
//   final CertificateRepository repository;
//   final CircleListRepository circleListRepository;
//   final circleListRepositoryProvider = Provider((ref) => CircleListRepository(dio: Dio(), basePath: "/clubs"));
//
//   // 인증 코드 + 소속 동아리 검증
//   Future<bool> certificate({
//     required int code,
//   }) async {
//     // 1️⃣ 입력값 검증
//     if (code == 0) {
//       state = AsyncValue.error("*인증 코드를 입력하세요.", StackTrace.current);
//       return false;
//     }
//
//     // 2️⃣ 코드가 지정된 코드와 일치하는지 검사 (ex: 1115)
//     if (code != validCertificateCode) {
//       state = AsyncValue.error("*일치하지 않은 번호입니다.", StackTrace.current);
//       return false;
//     }
//
//     // 3️⃣ 소속 동아리 목록 조회
//     state = const AsyncValue.loading();
//     try {
//       final circleList = await circleListRepository.fetchMyCircleList();
//       final circles = circleList.data;
//
//       if (circles.isEmpty) {
//         state = AsyncValue.error("*소속된 동아리가 없습니다.", StackTrace.current);
//         return false;
//       }
//
//       // ✅ 첫 번째 동아리 UUID 추출
//       final clubUUID = circles.first.clubUUID;
//
//       // 4️⃣ 서버 인증 API 호출
//       final success = await repository.certificateRepository(
//         clubUUID: clubUUID,
//         code: code,
//       );
//
//      if(success) {
//        state = const AsyncValue.data("인증 성공!");
//        return true;
//      } else {
//        print("서버 인증 실패");
//        return false;
//      }
//     } catch (e, st) {
//      state = AsyncValue.error("오류 발생: $e", st);
//      return false;
//     }
//   }
// }
//
//
// final certificateViewModelProvider =
//     StateNotifierProvider<CertificateViewModel, AsyncValue<String>>(
//         (ref) => CertificateViewModel(
//             repository: ref.read(certificateRepositoryProvider),
//             circleListRepository: ref.read(circleListRepositoryProvider),
//         ),
//     );
//
