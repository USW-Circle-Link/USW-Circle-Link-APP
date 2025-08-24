import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../auth/auth_viewmodel.dart';
import '../auth/logout/logout_button.dart';
import 'club_viewmodel.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key, required this.viewModel});
  final ClubsViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: viewModel.loadClubs,
        builder: (context, child) {
          if (viewModel.loadClubs.error) {
            viewModel.loadClubs.clearResult();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('동아리 목록 로드 실패'),
                action: SnackBarAction(
                  label: '다시 시도',
                  onPressed: viewModel.loadClubs.execute,
                ),
              ),
            );
          }

          return ListenableBuilder(
              listenable: viewModel,
              builder: (context, child) {
                final clubs = viewModel.clubs;
                return Scaffold(
                  appBar: AppBar(
                    title: const Text('동아리 목록'),
                    actions: [
                      LogoutButton(
                        viewModel: LogoutViewModel(
                          authRepository: context.read(),
                        ),
                      ),
                    ],
                  ),
                  body: ListView.builder(
                    itemCount: clubs.length,
                    itemBuilder: (context, index) {
                      // _log.fine('Club: ${clubs[index].clubName}');
                      final club = clubs[index];
                      return Text(club.clubName);
                    },
                  ),
                );
              });
        });
  }
}