import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/const/analytics_const.dart';
import 'package:usw_circle_link/const/data.dart';
import 'package:usw_circle_link/repositories/certificate_circle_repository.dart';
import 'package:usw_circle_link/repositories/circle_list_repository.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';

final certificateViewModelProvider = StateNotifierProvider.autoDispose<
    CertificateViewModel, AsyncValue<String>>((ref) {
  final repository = ref.read(certificateRepositoryProvider);
  final circleListRepository = ref.read(circleListRepositoryProvider);
  
  return CertificateViewModel(
    repository: repository,
    circleListRepository: circleListRepository,
  );
});

class CertificateViewModel extends StateNotifier<AsyncValue<String>> {
  final CertificateRepository repository;
  final CircleListRepository circleListRepository;

  CertificateViewModel({
    required this.repository,
    required this.circleListRepository,
  }) : super(AsyncData(""));

  Future<bool> certificate({required int code}) async {
    try {
      state = AsyncLoading();
      
      if (code == 0) {
        state = AsyncError(
          Exception("*인증 코드를 입력하세요."),
          StackTrace.current,
        );
        return false;
      }

      if (code != validCertificateCode) {
        state = AsyncError(
          Exception("*일치하지 않은 번호입니다."),
          StackTrace.current,
        );
        return false;
      }

      final circleList = await circleListRepository.fetchMyCircleList();
      final circles = circleList.data;

      if (circles.isEmpty) {
        state = AsyncError(
          Exception("*소속된 동아리가 없습니다."),
          StackTrace.current,
        );
        return false;
      }

      final clubUUID = circles.first.clubUUID;

      final result = await repository.certificateRepository(
        clubUUID: clubUUID,
        code: code,
      );

      // 이미 인증된 사용자인지 확인
      final isAlreadyCertified = result['message'] == '이미 인증된 사용자입니다.';
      
      if (isAlreadyCertified) {
        state = AsyncData("이미 인증 완료");
      } else {
        state = AsyncData("인증 성공!");
      }
      return true;
    } on Exception catch (e, st) {
      analytics.logEvent(
        name: AnalyticsEvent.error,
        parameters: {
          AnalyticsParam.errorType: 'CertificateError',
          AnalyticsParam.errorMessage: e.toString(),
          AnalyticsParam.screen: 'Certificate_Certificate',
          AnalyticsParam.timestamp: DateTime.now().toIso8601String(),
        },
      );
      logger.e('Certificate error: $e');
      state = AsyncError(e, st);
      return false;
    } catch (e, st) {
      final error = Exception("오류 발생: $e");
      analytics.logEvent(
        name: AnalyticsEvent.error,
        parameters: {
          AnalyticsParam.errorType: e.runtimeType.toString(),
          AnalyticsParam.errorMessage: e.toString(),
          AnalyticsParam.screen: 'Certificate_Certificate',
          AnalyticsParam.timestamp: DateTime.now().toIso8601String(),
        },
      );
      logger.e('Certificate unexpected error: $e');
      state = AsyncError(error, st);
      return false;
    }
  }

  Future<Map<String, dynamic>?> getCertificateStatus() async {
    try {
      state = AsyncLoading();
      
      final status = await repository.getCertificateStatus();
      
      state = AsyncData("상태 조회 성공");
      return status;
    } on Exception catch (e, st) {
      analytics.logEvent(
        name: AnalyticsEvent.error,
        parameters: {
          AnalyticsParam.errorType: 'CertificateStatusError',
          AnalyticsParam.errorMessage: e.toString(),
          AnalyticsParam.screen: 'Certificate_GetStatus',
          AnalyticsParam.timestamp: DateTime.now().toIso8601String(),
        },
      );
      logger.e('Certificate status error: $e');
      state = AsyncError(e, st);
      return null;
    } catch (e, st) {
      final error = Exception("상태 조회 실패: $e");
      analytics.logEvent(
        name: AnalyticsEvent.error,
        parameters: {
          AnalyticsParam.errorType: e.runtimeType.toString(),
          AnalyticsParam.errorMessage: e.toString(),
          AnalyticsParam.screen: 'Certificate_GetStatus',
          AnalyticsParam.timestamp: DateTime.now().toIso8601String(),
        },
      );
      logger.e('Certificate status unexpected error: $e');
      state = AsyncError(error, st);
      return null;
    }
  }
}

