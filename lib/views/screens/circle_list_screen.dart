import 'package:flutter/material.dart' hide Badge;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:usw_circle_link/models/circle_detail_list_model.dart';
import 'package:usw_circle_link/router/circle_list_route.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';
import 'package:usw_circle_link/viewmodels/circle_list_screen_view_model.dart';
import 'package:usw_circle_link/widgets/circle_info_tile/circle_info_tile.dart';
import 'package:usw_circle_link/widgets/detail_app_bar/detail_app_bar.dart';
import 'package:usw_circle_link/widgets/text_font_widget/text_font_widget.dart';
import 'package:usw_circle_link/widgets/card/app_card.dart';
import 'package:usw_circle_link/widgets/card/app_card_styles.dart';

class CircleListScreen extends ConsumerWidget {
  final CircleListType listType;

  const CircleListScreen({
    super.key,
    required this.listType,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final state = ref.watch(circleListScreenViewModelProvider(listType));
    ref.listen(circleListScreenViewModelProvider(listType), (previous, next) {
      logger.d('next: $next');
    });

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: DetailAppBar(title: listType.title),
      body: state.when(
        data: (data) => data.data.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.only(top: 8),
                child: ListView.builder(
                  itemCount: data.data.length,
                  itemBuilder: (context, index) {
                    final circle = data.data[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 4),
                      child: AppCard(
                        style: AppCardStyle.listItemStyle.copyWith(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 0),
                        ),
                        child: InkWell(
                          onTap: () {
                            if (listType == CircleListType.myApplications &&
                                circle.aplictUUID != null) {
                              context.push(
                                '/circle_list/${listType.routeKey}/application_detail?clubUUID=${circle.clubUUID}&aplictId=${circle.aplictUUID}',
                              );
                            } else {
                              context.push(
                                '/circle?clubUUID=${circle.clubUUID}',
                              );
                            }
                          },
                          child: CircleInfoTile(
                            clubUUID: circle.clubUUID,
                            name: circle.clubName,
                            leaderName: circle.leaderName,
                            imageUrl: circle.mainPhotoPath,
                            circleRoom: circle.clubRoomNumber,
                            leaderHp: circle.leaderHp,
                            clubInsta: circle.clubInsta,
                            showMoreMenu: true,
                            status:
                                CircleInfoStatus.fromCode(circle.aplictStatus),
                          ),
                        ),
                      ),
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
            color: theme.colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
