import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:usw_circle_link/models/circle_list_model.dart';
import 'package:usw_circle_link/views/widgets/text_font_widget.dart';
import 'package:usw_circle_link/utils/extensions.dart';

class CircleItem extends StatelessWidget {
  final CircleListData circle;
  final Function(String clubUUID) onItemClicked;

  const CircleItem({
    Key? key,
    required this.circle,
    required this.onItemClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: 120.w,
        margin: EdgeInsets.only(right: 8.w),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: Color(0xFFDEDEDE), width: 1.w),
                  ),
                  height: 143.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: Hero(
                      tag: 'circle_${circle.clubUUID}',
                      child: circle.mainPhoto?.isValidUrl ?? false
                          ? Image.network(
                              circle.mainPhoto!,
                              fit: BoxFit.cover,
                              errorBuilder: (BuildContext context,
                                  Object exception, StackTrace? stackTrace) {
                                return Container(
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    'assets/images/circle_default_image.png',
                                    fit: BoxFit.cover,
                                  ),
                                );
                              },
                            )
                          : Center(
                              child: Image.asset(
                                'assets/images/circle_default_image.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                TextFontWidget.fontRegular(
                  overflow: TextOverflow.ellipsis,
                  circle.clubName,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 8.h),
                Flexible(
                  child: LayoutBuilder(builder: (context, constraints) {
                    final margin = 5.w;
                    final width = (constraints.maxWidth - margin) / 2;
                    return Row(
                      children: List.generate(
                        circle.clubHashtags?.length ?? 0,
                        (index) => ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: 0,
                            maxWidth: width,
                            minHeight: constraints.maxHeight,
                            maxHeight: constraints.maxHeight,
                          ),
                          child: Container(
                            margin:
                                EdgeInsets.only(right: index == 0 ? margin : 0),
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.r),
                              border: Border.all(
                                  color: Color(0xFFDEDEDE), width: 1.w),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextFontWidget.fontRegular(
                                  '#${circle.clubHashtags![index]}',
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w300,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ).toList(),
                    );
                  }),
                )
              ],
            ),
            Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    onItemClicked(circle.clubUUID);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
