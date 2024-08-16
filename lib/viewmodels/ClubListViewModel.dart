import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:usw_circle_link/models/UswClubModel.dart';
import 'package:usw_circle_link/repositories/ClubListRepository.dart';

// 상태 정의
class RecruitingListState {
  final List<Club> clubs;
  final bool isLoading;
  final String? errorMessage;

  RecruitingListState({
    this.clubs = const [],
    this.isLoading = false,
    this.errorMessage,
  });
}

// ViewModel 정의
class RecruitingListViewModel extends StateNotifier<RecruitingListState> {
  final Dio dio;
  final String token;

  RecruitingListViewModel(this.dio, this.token) : super(RecruitingListState());

  Future<void> fetchClubs() async {
    state = RecruitingListState(isLoading: true);

    try {
      final repository = RecuitingClubRepository(dio);
      final clubs = await repository.fetchClubs(token);
      state = RecruitingListState(clubs: clubs);
    } catch (e) {
      state = RecruitingListState(errorMessage: '동아리 목록을 불러오는 데 실패했습니다: $e');
    }
  }
}

// Provider 정의
final recruitingListViewModelProvider =
    StateNotifierProvider<RecruitingListViewModel, RecruitingListState>((ref) {
  final dio = Dio();
  final token = "YOUR_TOKEN_HERE"; // 실제 토큰으로 변경 필요
  return RecruitingListViewModel(dio, token);
});
