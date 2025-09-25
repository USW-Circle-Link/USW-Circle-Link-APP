import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:usw_circle_link/models/notice_detail_model.dart';
import 'package:usw_circle_link/viewmodels/notice_detail_view_model.dart';
import 'package:usw_circle_link/viewmodels/notice_view_model.dart';
import 'package:usw_circle_link/views/screens/image_screen.dart';
import 'package:usw_circle_link/views/widgets/text_font_widget.dart';

class NoticeDetailScreen extends ConsumerWidget {
  const NoticeDetailScreen({
    super.key,
    required this.noticeUUID,
  });

  final String noticeUUID;

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
            .getDetail(noticeUUID: noticeUUID);
      }
    });
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 0.0,
        title: Padding(
          padding: EdgeInsets.only(left: 22, right: 22),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 52,
                height: 52,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: SvgPicture.asset(
                    'assets/images/ic_back_arrow.svg',
                  ),
                ),
              ),
              SizedBox(width: 52, height: 52)
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: state is NoticeDetailModel
              ? Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(top: 16),
                            padding: EdgeInsets.only(
                              left: 24,
                              right: 24,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFontWidget.fontRegular(
                                  state.data.noticeTitle,
                                  fontSize: 18,
                                  color: const Color(0xFF000000),
                                  fontWeight: FontWeight.w800,
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                TextFontWidget.fontRegular(
                                  '작성자 : ${state.data.adminName} / 작성날짜 : ${state.data.noticeCreatedAt.parseDateTime().getFormattedString()}',
                                  fontSize: 14,
                                  color: const Color(0xFF767676),
                                  fontWeight: FontWeight.w400,
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Html(data: state.data.noticeContent),
                              ],
                            )),
                      ),
                    ),
                    if (state.data.noticePhotos != null &&
                        state.data.noticePhotos!.isNotEmpty) ...[
                      Divider(
                        height: 1,
                        color: const Color(0xFFE0E0E0),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          bottom: 10,
                          left: 24,
                          top: 10,
                        ),
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal, // 가로 방향으로 스크롤
                          itemCount: state.data.noticePhotos!.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                open(context, state.data.noticePhotos!, index);
                              },
                              child: Container(
                                width: 100, // 이미지의 너비
                                margin: EdgeInsets.symmetric(
                                  horizontal: 4,
                                ), // 이미지 사이의 여백
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(8.0), // 모서리를 둥글게 설정
                                  child: Container(
                                    color: Colors.grey,
                                    child: Hero(
                                      tag: state.data.noticePhotos![index],
                                      child: Image.network(
                                        state.data.noticePhotos![index],
                                        fit: BoxFit.cover, // 이미지를 박스에 맞게 채움
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Center(
                                            child: TextFontWidget.fontRegular(
                                              '이미지 없음',
                                              fontSize: 14,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          );
                                        },
                                        // height: 100.h, // 이미지의 높이
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ],
                )
              : state is NoticeDetailLoading
                  ? Container(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(),
                    )
                  : Container(
                      alignment: Alignment.center,
                      child: TextFontWidget.fontRegular(
                        '공지사항을 불러오지 못했어요.\n잠시 후 다시 시도해주세요.',
                        fontSize: 14,
                        color: const Color(0xFFA1A1A1),
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
        ),
      ),
    );
  }

  void open(BuildContext context, List<String> galleryItems, final int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImageScreen(
          galleryItems: galleryItems,
          backgroundDecoration: const BoxDecoration(
            color: Colors.black,
          ),
          initialIndex: index,
        ),
      ),
    );
  }
}
