import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UswClubListScreen extends StatefulWidget {
  final WidgetRef ref;

  UswClubListScreen(this.ref);

  @override
  _UswClubListScreenState createState() => _UswClubListScreenState();
}

class _UswClubListScreenState extends State<UswClubListScreen> {
  @override
  Widget build(BuildContext context) {
    // Add your specific implementation for UswClubListScreen here
    return ScreenUtilInit(
       designSize: const Size(375, 812),
      builder: (context, child) => Scaffold(
        
      )
    );
  }
}
