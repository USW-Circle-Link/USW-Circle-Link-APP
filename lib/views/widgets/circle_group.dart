import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:usw_circle_link/models/circle_list_model.dart';
import 'package:usw_circle_link/views/widgets/circle_item.dart';
import 'package:usw_circle_link/views/widgets/text_font_widget.dart';

class CircleGroup extends StatelessWidget {
  const CircleGroup({Key? key, required this.department}) : super(key: key);

  final MapEntry<String, List<CircleListData>> department;

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
            text: department.key,
            fontSize: 16.sp,
            color: Colors.black,
            fontweight: FontWeight.w400,
          ),
          SizedBox(height: 8.h), // 텍스트와 리스트 사이에 여백 추가
          SizedBox(
            height: 170.h, // ListView의 고정 높이 설정
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: department.value.length,
              itemBuilder: (context, index) {
                return CircleItem(
                  imagePath: department.value[index].mainPhoto,
                  title: department.value[index].clubName,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
