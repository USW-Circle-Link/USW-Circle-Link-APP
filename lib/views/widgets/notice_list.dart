import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:usw_circle_link/models/notice_model.dart';
import 'package:usw_circle_link/views/widgets/text_font_widget.dart';

class NoticeList extends StatelessWidget {
  const NoticeList({
    Key? key,
    required this.state,
    required this.onItemClicked,
  }) : super(key: key);

  final NoticeModel state;
  final Function(int noticeId) onItemClicked;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Divider(thickness: 1.h,);
      },
      itemCount: state.data.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(top: index == 0 ? 16.h : 0.h),
          child: InkWell(
            onTap: (){
              onItemClicked(state.data[index].noticeId);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFontWidget.fontRegular(
                    text: state.data[index].noticeTitle,
                    fontSize: 18.sp,
                    color: const Color(0xFF000000),
                    fontweight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFontWidget.fontRegular(
                        text: state.data[index].adminName,
                        fontSize: 14.sp,
                        color: const Color(0xFF767676),
                        fontweight: FontWeight.w400,
                      ),
                      TextFontWidget.fontRegular(
                        text: state.data[index].noticeCreatedAt,
                        fontSize: 14.sp,
                        color: const Color(0xFF767676),
                        fontweight: FontWeight.w400,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
