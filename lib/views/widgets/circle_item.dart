import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:usw_circle_link/models/circle_list_model.dart';
import 'package:usw_circle_link/views/widgets/text_font_widget.dart';

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
      child: Container(
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
                    child: Icon(
                      Icons.person,
                      color: const Color.fromARGB(255, 255, 255, 255),
                      size: 60,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 8.h),
            TextFontWidget.fontRegular(
              overflow: TextOverflow.ellipsis,
              circle.clubName,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}
