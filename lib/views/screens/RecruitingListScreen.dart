import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:usw_circle_link/views/widgets/ClubList.dart';

class RecruitingListscreen extends StatefulWidget {
  final WidgetRef ref;

  RecruitingListscreen(this.ref);

  @override
  _RecruitingListscreenState createState() => _RecruitingListscreenState();
}

class _RecruitingListscreenState extends State<RecruitingListscreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // 디자인 기준 화면 크기
      builder: (context, child) => Scaffold(
        body: Container(
          color: Color(0xffF0F2F5),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.h), // 상단 여백
                ClubList(
                  text: '학술', // 표시할 텍스트
                  index: 4, // 예시 인덱스
                ),
                ClubList(
                  text: '공연', // 표시할 텍스트
                  index: 4, // 예시 인덱스
                ),
                ClubList(
                  text: '예술', // 표시할 텍스트
                  index: 4, // 예시 인덱스
                ),
                ClubList(
                  text: '체육', // 표시할 텍스트
                  index: 4, // 예시 인덱스
                ),
                ClubList(
                  text: '봉사', // 표시할 텍스트
                  index: 4, // 예시 인덱스
                ),
                ClubList(
                  text: '종교', // 표시할 텍스트
                  index: 4, // 예시 인덱스
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
