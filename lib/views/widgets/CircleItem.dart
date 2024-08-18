import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:usw_circle_link/models/CircleListModel.dart';
import 'package:usw_circle_link/views/widgets/TextFontWidget.dart';

class CircleItem extends StatelessWidget {
  const CircleItem({Key? key, required this.circle}) : super(key: key);

  final CircleListData circle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12.h, right: 6.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            circle.mainPhoto,
            width: 120.w,
            height: 140.h,
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              SizedBox(width: 6.w),
              TextFontWidget.fontRegular(
                text: circle.clubName,
                fontSize: 14.sp,
                color: Colors.black,
                fontweight: FontWeight.w500,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
