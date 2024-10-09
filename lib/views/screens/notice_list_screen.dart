import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:usw_circle_link/models/notice_model.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';
import 'package:usw_circle_link/viewmodels/notice_view_model.dart';
import 'package:usw_circle_link/views/widgets/notice_list.dart';
import 'package:usw_circle_link/views/widgets/text_font_widget.dart';

class NoticeListScreen extends ConsumerStatefulWidget {
  const NoticeListScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NoticeListScreenState();
}

class _NoticeListScreenState extends ConsumerState<NoticeListScreen> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(noticeViewModelProvider);
    ref.listen(noticeViewModelProvider, (previous, next) {
      logger.d(next);
      next.when(
        data: (data) {},
        error: (error, stackTrace) {},
        loading: () {},
      );
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
                TextFontWidget.fontRegular(
                    text: '공지사항',
                    fontSize: 18.sp,
                    color: Color(0xFF111111),
                    fontweight: FontWeight.w600),
                SizedBox(width: 52.w, height: 52.h)
              ],
            ),
          ),
        ),
        body: Center(
          child: state.when<Widget>(
            data: (noticeModel) {
              return Container(
                  padding: EdgeInsets.only(left: 16.w, right: 16.w),
                  child: NoticeList(
                    noticeModel: noticeModel,
                    onItemClicked: (noticeId) {
                      context.go('/notices/$noticeId/detail');
                    },
                  ));
            },
            error: (error, stackTrace) {
              error = error as NoticeModelError;
              switch (error.type) {
                case NoticeModelType.fetchAll:
                  break;
                default:
              }
              return Text('공지사항을 불러오지 못했습니다...');
            },
            loading: () => CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
