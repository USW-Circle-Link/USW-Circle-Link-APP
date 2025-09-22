import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:usw_circle_link/models/circle_detail_list_model.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';
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

    // ScreenUtilInit 위젯을 제거하고 바로 Scaffold를 반환합니다.
    return Scaffold(
      backgroundColor: const Color(0xffF0F2F5),
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(62),
        child: AppBar(
          scrolledUnderElevation: 0,
          toolbarHeight: 62,
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: const Color(0xffFFFFFF),
          automaticallyImplyLeading: false,
          title: SizedBox(
            width: 375,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: SvgPicture.asset(
                    'assets/images/ic_back_arrow.svg',
                    height: 36,
                    width: 36,
                  ),
                ),
                SizedBox(width: 62.25),
                TextFontWidget.fontRegular(
                  listType.title,
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  height: 1.111,
                  letterSpacing: -0.45,
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
          padding: EdgeInsets.fromLTRB(0, 24, 0, 0),
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
            listType == CircleListType.myCircles
                ? '나의 소속 동아리를 불러오지 못했어요.\n잠시 후 다시 시도해주세요.'
                : '나의 지원 현황을 불러오지 못했어요.\n잠시 후 다시 시도해주세요.',
            textAlign: TextAlign.center,
            fontSize: 14,
            color: Color(0xFFA1A1A1),
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}