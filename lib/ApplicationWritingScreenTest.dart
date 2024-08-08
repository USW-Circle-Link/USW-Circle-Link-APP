import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/views/screens/ApplicationWritingScreen.dart';

void main() {
  runApp(
    ProviderScope(
      child: CircleLink(),
    ),
  );
}

class CircleLink extends StatelessWidget {
  const CircleLink({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ApplicationWritingScreen(),
    );
  }
}
