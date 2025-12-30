import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:usw_circle_link/models/notice_model.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';
import 'package:usw_circle_link/viewmodels/notice_view_model.dart';
import 'package:usw_circle_link/widgets/detail_app_bar/detail_app_bar.dart';
import 'package:usw_circle_link/widgets/notice_list/notice_list.dart';
import 'package:usw_circle_link/widgets/text_font_widget/text_font_widget.dart';

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
    return Scaffold(
      appBar: const DetailAppBar(title: '공지사항'),
      body: Center(
        child: state.when<Widget>(
          data: (noticeModel) {
            return Container(
                padding: EdgeInsets.only(left: 16, right: 16),
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
            return TextFontWidget.fontRegular(
              '공지사항을 불러오지 못했어요.\n잠시 후 다시 시도해주세요.',
              textAlign: TextAlign.center,
              fontSize: 14,
              color: Color(0xFFA1A1A1),
              fontWeight: FontWeight.w400,
            );
          },
          loading: () => CircularProgressIndicator(),
        ),
      ),
    );
  }
}
