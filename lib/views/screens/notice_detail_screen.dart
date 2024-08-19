import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:usw_circle_link/models/notice_detail_model.dart';
import 'package:usw_circle_link/models/notice_model.dart';
import 'package:usw_circle_link/viewmodels/notice_detail_view_model.dart';
import 'package:usw_circle_link/viewmodels/notice_view_model.dart';
import 'package:usw_circle_link/views/widgets/text_font_widget.dart';

class NoticeDetailScreen extends ConsumerWidget {
  const NoticeDetailScreen({
    super.key,
    required this.noticeId,
  });

  final int noticeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(noticeDetailViewModelProvider);
    ref.listen(noticeDetailViewModelProvider, (previous, next) {
      if (next is NoticeDetailModel) {
        switch (next.type) {
          case NoticeDetailModelType.getDetail:
            break;
          default:
        }
      } else if (next is NoticeDetailModelError) {

      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (state == null) {
        await ref
            .read(noticeDetailViewModelProvider.notifier)
            .getDetail(noticeId: noticeId);
      }
    });
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 0.0,
          title: Padding(
            padding: EdgeInsets.only(left: 22.w, right: 22.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 52.w,
                  height: 52.h,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: SvgPicture.asset(
                      'assets/images/ic_back_arrow.svg',
                    ),
                  ),
                ),
                SizedBox(width: 52.w, height: 52.h)
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 16.h),
            padding: EdgeInsets.only(left: 32.w, right: 32.w),
            child: state is NoticeDetailModel
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFontWidget.fontRegular(
                        text: state.data.noticeTitle,
                        fontSize: 18.sp,
                        color: const Color(0xFF000000),
                        fontweight: FontWeight.w600,
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      TextFontWidget.fontRegular(
                        text:
                            '작성자 : ${state.data.adminName} / 작성날짜 : ${state.data.noticeCreatedAt.parseDateTime().getFormattedString()}',
                        fontSize: 14.sp,
                        color: const Color(0xFF767676),
                        fontweight: FontWeight.w400,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      TextFontWidget.fontRegular(
                        text: state.data.noticeContent ?? "",
                        fontSize: 14.sp,
                        color: const Color(0xFF000000),
                        fontweight: FontWeight.w400,
                      ),
                    ],
                  )
                : Container(),
          ),
        ),
      ),
    );
  }
}
