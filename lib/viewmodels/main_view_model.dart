import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/models/circle_list_model.dart';
import 'package:usw_circle_link/repositories/circle_list_repository.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';
import 'package:dio/dio.dart';
import '../const/data.dart';
import '../repositories/certificate_circle_repository.dart';


final circleViewModelProvider = StateNotifierProvider.autoDispose<
    CircleViewModel, AsyncValue<CircleListModel>>((ref) {
  final circleListRepository = ref.read(circleListRepositoryProvider);
  return CircleViewModel(circleListRepository: circleListRepository);
});

class CircleViewModel extends StateNotifier<AsyncValue<CircleListModel>> {
  final CircleListRepository circleListRepository;

  CircleViewModel({
    required this.circleListRepository,
  }) : super(AsyncLoading()) {
    Future.sync(() async {
      await fetchAllCircleList();
    });
  }

  Future<void> fetchAllCircleList() async {
    try {
      state = AsyncValue.loading();

      final response = await circleListRepository.fetchAllCircleList();

      state = AsyncValue.data(response);
    } on CircleListModelError catch (e) {
      logger.d(e);
      state = AsyncValue.error(e, e.stackTrace);
    } catch (e) {
      final error = CircleListModelError(
          message: '예외발생! - $e', type: CircleListModelType.all);
      logger.e(e);
      state = AsyncValue.error(error, error.stackTrace);
    }
  }

  Future<void> fetchOpenCircleList() async {
    try {
      state = AsyncValue.loading();

      final response = await circleListRepository.fetchOpenCircleList();

      state = AsyncValue.data(response);
    } on CircleListModelError catch (e) {
      state = AsyncValue.error(e, e.stackTrace);
    } catch (e) {
      logger.e(e);
      final error = CircleListModelError(
          message: '예외발생! - $e', type: CircleListModelType.department);
      state = AsyncValue.error(error, error.stackTrace);
    }
  }

  Future<void> fetchAllFilteredCircleList(
      List<String> clubCategoryUUIDs) async {
    try {
      state = AsyncValue.loading();

      final response = await circleListRepository
          .fetchAllFilteredCircleList(clubCategoryUUIDs);

      state = AsyncValue.data(response.toCircleListModel());
    } on CircleListModelError catch (e) {
      state = AsyncValue.error(e, e.stackTrace);
    } catch (e) {
      final error = CircleListModelError(
          message: '예외발생! - $e', type: CircleListModelType.filtered_all);
      logger.e(e);
      state = AsyncValue.error(error, error.stackTrace);
    }
  }

  Future<void> fetchOpenFilteredCircleList(
      List<String> clubCategoryUUIDs) async {
    try {
      final response = await circleListRepository
          .fetchOpenFilteredCircleList(clubCategoryUUIDs);
      state = AsyncValue.data(response.toCircleListModel());
    } on CircleListModelError catch (e) {
      state = AsyncValue.error(e, e.stackTrace);
    } catch (e) {
      final error = CircleListModelError(
          message: '예외발생! - $e', type: CircleListModelType.filtered_open);
      logger.e(e);
      state = AsyncValue.error(error, error.stackTrace);
    }
  }
}

extension on CircleFilteredListModel {
  CircleListModel toCircleListModel() {
    final newList = <CircleListData>[];
    for (var category in data) {
      final clubs = category.clubs;
      newList.addAll(
          clubs.map((e) => e.setDepartmentName(category.clubCategoryName)));
    }
    return CircleListModel(message: message, data: newList);
  }
}



class CertificateViewModel extends StateNotifier<AsyncValue<void>> {
  CertificateViewModel({required this.repository, required this.circleListRepository})
      : super(const AsyncValue.data(null));

  final CertificateRepository repository;
  final CircleListRepository circleListRepository;
  // final Ref ref;

  final TextEditingController _textController = TextEditingController();
// 1. 명령을 보낼 '통로' (StreamController)
  final _commandController = StreamController<String>.broadcast();

  // 2. View가 구독(listen)할 수 있도록 외부에 노출
  Stream<String> get commandStream => _commandController.stream;

  // 인증 코드 + 소속 동아리 검증
  Future<void> certificate({
    required int code,
  }) async {
    // 1️⃣ 입력값 검증
    if (code == 0) {
      state = AsyncValue.error("*인증 코드를 입력하세요.", StackTrace.current);
      return;
    }

    // 2️⃣ 코드가 지정된 코드와 일치하는지 검사 (ex: 1115)
    if (code != validCertificateCode) {
      state = AsyncValue.error("*일치하지 않은 번호입니다.", StackTrace.current);
      return;
    }

    // 3️⃣ 소속 동아리 목록 조회
    state = const AsyncValue.loading();
    try {
      final circleList = await circleListRepository.fetchMyCircleList();
      final circles = circleList.data;

      if (circles.isEmpty) {
        state = AsyncValue.error("*소속된 동아리가 없습니다.", StackTrace.current);
      }

      // ✅ 첫 번째 동아리 UUID 추출
      final clubUUID = circles.first.clubUUID;

      // 4️⃣ 서버 인증 API 호출
      final success = await repository.certificateRepository(
        clubUUID: clubUUID,
        code: code,
      );

      if(success) {
        state = const AsyncValue.data(null);
        // '명령' 보내기. (1회성 이벤트)
        _commandController.add("팔찌를 받아 입장해주세요!");
        return;
      } else {
        print("서버 인증 실패");
        return;
      }
    } catch (e, st) {
      state = AsyncValue.error("오류 발생: $e", st);
      return;
    }
  }
  // 3. (중요) ViewModel이 파괴될 때 StreamController도 닫아주기
  @override
  void dispose() {
    _commandController.close();
    super.dispose();
  }
}


final certificateViewModelProvider =
StateNotifierProvider<CertificateViewModel, AsyncValue<void>>(
      (ref) => CertificateViewModel(
    repository: ref.read(certificateRepositoryProvider),
    circleListRepository: ref.read(circleListRepositoryProvider),
  ),
);

final circleListRepositoryProvider = Provider((ref) => CircleListRepository(dio: Dio(), basePath: "/clubs"));

final certificateCommandProvider = StreamProvider<String>((ref) {
  final viewModel = ref.watch(certificateViewModelProvider.notifier);
  return viewModel.commandStream;
});