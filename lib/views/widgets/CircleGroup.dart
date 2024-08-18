import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:usw_circle_link/models/CircleListModel.dart';
import 'package:usw_circle_link/views/widgets/CircleItem.dart';

class CircleGroup extends StatelessWidget {
  const CircleGroup({Key? key, required this.department}) : super(key: key);

  final MapEntry<String, List<CircleListData>> department;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250.h,
      margin: EdgeInsets.only(top: 12.h),
      padding: EdgeInsets.only(left: 24.w, top: 16.h, bottom: 16.h),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${department.key}'),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: department.value.length,
              itemBuilder: (context, index) {
                return CircleItem(circle:department.value[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}