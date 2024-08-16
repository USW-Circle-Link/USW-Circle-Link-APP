import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UswClubListScreen extends StatelessWidget {
  final WidgetRef ref;

  UswClubListScreen(this.ref);

  @override
  Widget build(BuildContext context) {
    // Add your specific implementation for UswClubListScreen here
    return Container(
      child: Center(
        child: Text(
          'Usw Club List',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
