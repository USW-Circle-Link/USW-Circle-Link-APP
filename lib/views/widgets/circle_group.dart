import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:usw_circle_link/const/data.dart';
import 'package:usw_circle_link/models/circle_list_model.dart';
import 'package:usw_circle_link/views/widgets/circle_item.dart';
import 'package:usw_circle_link/views/widgets/text_font_widget.dart';

class CircleGroup extends StatelessWidget {
  const CircleGroup({
    Key? key,
    required this.department,
    required this.onItemClicked,
  }) : super(key: key);

  final MapEntry<String, List<CircleListData>> department;
  final Function(int clubId) onItemClicked;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      padding: EdgeInsets.only(left: 24.w, top: 16.h, bottom: 16.h),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFontWidget.fontRegular(
            department.key.toDepartment(),
            fontSize: 16.sp,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
          SizedBox(height: 8.h), // 텍스트와 리스트 사이에 여백 추가
          SizedBox(
            height: 150.h, // ListView의 고정 높이 설정
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: department.value.length,
              itemBuilder: (context, index) {
                return CircleItem(
                  circle: department.value[index],
                  onItemClicked: onItemClicked,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

extension Department on String {
  String toDepartment() {
    if (departments.containsKey(this)) {
      return departments[this]!;
    }
    return this;
  }
}
