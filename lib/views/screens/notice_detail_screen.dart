import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:usw_circle_link/models/notice_detail_model.dart';
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
      } else if (next is NoticeDetailModelError) {}
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
        body: SafeArea(
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 16.h),
                    padding: EdgeInsets.only(
                      left: 32.w,
                      right: 32.w,
                      bottom: 100.h, // image height size 만큼 올려줘야함
                    ),
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
                              Html(data: state.data.noticeContent),
                            ],
                          )
                        : Container(),
                  ),
                ),
                Positioned(
                  bottom: 4.h,
                  child: state is NoticeDetailModel &&
                          state.data.noticePhotos != null
                      ? SizedBox(
                          height: 100.h,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal, // 가로 방향으로 스크롤
                            itemCount: state.data.noticePhotos!.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  context.push('/image',
                                      extra: state.data.noticePhotos?[index]);
                                },
                                child: Container(
                                  width: 100.w, // 이미지의 너비
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 4.w,
                                  ), // 이미지 사이의 여백
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        8.0), // 모서리를 둥글게 설정
                                    child: Container(
                                      color: Colors.grey,
                                      child: Image.network(
                                        state.data.noticePhotos![index],
                                        fit: BoxFit.cover, // 이미지를 박스에 맞게 채움
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Center(
                                            child: TextFontWidget.fontRegular(
                                                text: '이미지 없음',
                                                fontSize: 14.sp,
                                                color: Colors.black,
                                                fontweight: FontWeight.w400),
                                          );
                                        },
                                        // height: 100.h, // 이미지의 높이
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      : Container(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
