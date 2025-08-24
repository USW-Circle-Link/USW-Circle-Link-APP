import 'package:flutter/material.dart';

import '../auth_viewmodel.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key, required this.viewModel});

  final LogoutViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.logout),
      onPressed: () {
        viewModel.logout.execute();
      },
    );
  }
}