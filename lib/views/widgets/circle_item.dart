import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:usw_circle_link/models/circle_list_model.dart';

class CircleItem extends StatelessWidget {
  final CircleListData circle;
  final Function(int clubId) onItemClicked;

  const CircleItem({
    Key? key,
    required this.circle,
    required this.onItemClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onItemClicked(circle.clubId);
      },
      child: Flexible(
        child:
        Container(
          width: 100.w,
          margin: EdgeInsets.only(right: 3.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 106.h,
                child: Image.network(
                  circle.mainPhoto ?? "",
                  fit: BoxFit.cover,
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return Container(
                      alignment: Alignment.center,
                      color: const Color.fromARGB(255, 164, 164, 164),
                      child: Text('이미지 없음'),
                    );
                  },
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                overflow: TextOverflow.ellipsis,
                circle.clubName,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
