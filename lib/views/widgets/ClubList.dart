import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/views/widgets/ClubCard.dart';
import 'package:usw_circle_link/views/widgets/TextFontWidget.dart';

class ClubList extends ConsumerStatefulWidget {
  final String text;
  final int index;

  const ClubList({
    Key? key,
    required this.text,
    required this.index,
  }) : super(key: key);

  @override
  _ClubListState createState() => _ClubListState();
}

class _ClubListState extends ConsumerState<ClubList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 240.h,
      margin: EdgeInsets.only(top: 10.h),
      padding: EdgeInsets.only(left: 24.w, top: 16.h, bottom: 16.h),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFontWidget.fontRegular(
            text: widget.text,
            fontSize: 16.sp,
            color: Colors.black,
            fontweight: FontWeight.w400,
          ),
          SizedBox(height: 8.h), // 텍스트와 리스트 사이에 여백 추가
          SizedBox(
            height: 170.h, // ListView의 고정 높이 설정
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return ClubCard(
                  imagePath: 'assets/images/gullisae.png',
                  title: 'Club $index',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
