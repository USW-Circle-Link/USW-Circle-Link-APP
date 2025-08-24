// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:usw_circle_link/models/notice_model.dart';
import 'package:usw_circle_link/viewmodels/notice_view_model.dart';
import 'package:usw_circle_link/views/widgets/text_font_widget.dart';

class NoticeList extends StatelessWidget {
  NoticeList({
    Key? key,
    required this.noticeModel,
    required this.onItemClicked,
  }) : super(key: key) {
    noticeModel = NoticeModel(
        message: noticeModel.message, data: noticeModel.data.reversed.toList());
  }

  NoticeModel noticeModel;
  final Function(String noticeUUID) onItemClicked;

  @override
  Widget build(BuildContext context) {
    final notices = noticeModel.data.toList();
    return notices.isNotEmpty
        ? ListView.separated(
            separatorBuilder: (context, index) {
              return Divider(
                thickness: 1.h,
              );
            },
            itemCount: notices.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(top: index == 0 ? 16.h : 0.h),
                child: InkWell(
                  onTap: () {
                    onItemClicked(notices[index].noticeUUID);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextFontWidget.fontRegular(
                          notices[index].noticeTitle,
                          fontSize: 18.sp,
                          color: const Color(0xFF000000),
                          fontWeight: FontWeight.w800,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            TextFontWidget.fontRegular(
                              noticeModel.data[index].adminName,
                              fontSize: 14.sp,
                              color: const Color(0xFF767676),
                              fontWeight: FontWeight.w400,
                            ),
                            TextFontWidget.fontRegular(
                              noticeModel.data[index].noticeCreatedAt
                                  .parseDateTime()
                                  .getFormattedString(),
                              fontSize: 14.sp,
                              color: const Color(0xFF767676),
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          )
        : TextFontWidget.fontRegular('공지사항이 없습니다!');
  }
}
