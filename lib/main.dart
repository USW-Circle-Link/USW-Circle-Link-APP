import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/router/Router.dart';

void main() async {
  
  runApp(
    ProviderScope(
      child: CircleLink(),
    ),
  );
}

class CircleLink extends ConsumerWidget {
  const CircleLink({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: ref.read(routerProvider),
    );
  }
}
