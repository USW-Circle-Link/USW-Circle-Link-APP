import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/viewmodels/ClubListViewModel.dart';
// ViewModel 파일 경로 수정 필요

class RecruitingListScreen extends ConsumerWidget {
  RecruitingListScreen(WidgetRef ref);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModelState = ref.watch(recruitingListViewModelProvider);

    // Fetch clubs when the screen is loaded
    Future.microtask(
        () => ref.read(recruitingListViewModelProvider.notifier).fetchClubs());

    return Scaffold(
      appBar: AppBar(
        title: Text('모집 중인 동아리 리스트'),
      ),
      body: viewModelState.isLoading
          ? Center(child: CircularProgressIndicator())
          : viewModelState.errorMessage != null
              ? Center(child: Text(viewModelState.errorMessage!))
              : viewModelState.clubs.isEmpty
                  ? Center(child: Text('모집 중인 동아리가 없습니다.'))
                  : ListView.builder(
                      itemCount: viewModelState.clubs.length,
                      itemBuilder: (context, index) {
                        final club = viewModelState.clubs[index];
                        return ListTile(
                          title: Text(club.clubName),
                          subtitle: Text(club.departmentName),
                          onTap: () {
                            // 동아리 상세 페이지로 이동하는 코드 추가
                          },
                        );
                      },
                    ),
    );
  }
}
