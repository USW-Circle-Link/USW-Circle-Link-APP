import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:usw_circle_link/models/circle_detail_list_model.dart';
import 'package:usw_circle_link/utils/logger/Logger.dart';
import 'package:usw_circle_link/viewmodels/circle_list_screen_view_model.dart';
import 'package:usw_circle_link/views/widgets/circle_detail_item.dart';
import 'package:usw_circle_link/views/widgets/text_font_widget.dart';

class CircleListScreen extends ConsumerWidget {
  final CircleListType listType;

  const CircleListScreen({
    super.key,
    required this.listType,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(circleListScreenViewModelProvider(listType));
    ref.listen(circleListScreenViewModelProvider(listType), (previous, next) {
      logger.d('next: $next');
    });

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => Scaffold(
        backgroundColor: const Color(0xffF0F2F5),
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(62.h),
          child: AppBar(
            scrolledUnderElevation: 0,
            toolbarHeight: 62.h,
            centerTitle: true,
            elevation: 0.0,
            backgroundColor: const Color(0xffFFFFFF),
            automaticallyImplyLeading: false,
            title: SizedBox(
              width: 375.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: SvgPicture.asset(
                      'assets/images/ic_back_arrow.svg',
                      height: 36.h,
                      width: 36.w,
                    ),
                  ),
                  SizedBox(width: 62.25.w),
                  TextFontWidget.fontRegular(
                    listType.title,
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w800,
                    height: 1.111.h,
                    letterSpacing: -0.45.sp,
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
          ),
        ),
        body: state.when(
          data: (data) => data.data.isNotEmpty
              ? Padding(
                  padding: EdgeInsets.fromLTRB(0, 24.h, 0, 0),
                  child: ListView.builder(
                    itemCount: data.data.length,
                    itemBuilder: (context, index) {
                      final circle = data.data[index];
                      return CircleDetailItem(
                        clubUUID: circle.clubUUID,
                        leader: circle.leaderName,
                        name: circle.clubName,
                        imageUrl: circle.mainPhotoPath ?? '',
                        leaderHp: circle.leaderHp,
                        instaId: circle.clubInsta,
                        circleRoom: circle.clubRoomNumber,
                        // 'status'가 없으면 null로 처리
                        statusString: circle.aplictStatus,
                      );
                    },
                  ),
                )
              : Center(
                  child: TextFontWidget.fontRegular(
                    '${listType == CircleListType.myCircles ? "소속된" : "지원한"} 동아리가 없습니다.',
                  ),
                ),
          loading: () => Center(
            child: CircularProgressIndicator(),
          ),
          error: (error, stack) => Center(
            child: TextFontWidget.fontRegular(
              '동아리 목록 조회에 실패하였습니다.',
            ),
          ),
        ),
      ),
    );
  }
}
