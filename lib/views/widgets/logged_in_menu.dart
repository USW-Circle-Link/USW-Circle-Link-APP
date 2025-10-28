import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:usw_circle_link/models/circle_detail_list_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:usw_circle_link/const/data.dart';
import 'package:usw_circle_link/router/circle_list_route.dart';
import 'package:usw_circle_link/utils/dialog_manager.dart';
import 'package:usw_circle_link/utils/icons/main_icons_icons.dart';
import 'package:usw_circle_link/viewmodels/user_view_model.dart';
import 'package:usw_circle_link/viewmodels/state/user_state.dart';
import 'package:usw_circle_link/views/widgets/text_font_widget.dart';

import '../../viewmodels/event_certificate_view_model.dart';
import 'drawer_event_item.dart';
import 'drawer_item.dart';

class LoggedInMenu extends ConsumerStatefulWidget {
  const LoggedInMenu({
    Key? key,
    required this.state,
  }) : super(key: key);

  final UserState state;

  @override
  _LoggedInMenuState createState() => _LoggedInMenuState();
}

class _LoggedInMenuState extends ConsumerState<LoggedInMenu> {
  bool isMyInfoExpanded = false;

  @override
  Widget build(BuildContext context) {
    ref.listen(
        eventCertificateViewModelProvider
            .select((value) => [value.isDialogError, value.error]),
        (previous, next) async {
      final isDialogError = next[0] as bool;
      final error = next[1] as String?;
      if (isDialogError && error != null) {
        DialogManager.instance.dismissDialog(context);
        DialogManager.instance
            .showAlertDialog(context: context, content: error);
      } else if (!isDialogError && error == null) {
        // Dialog 닫기
        DialogManager.instance.dismissDialog(context);
        await DialogManager.instance.showCircleCertificateDialog(context);
      }
    });
    return Drawer(
      backgroundColor: const Color(0xffF0F2F5),
      width: 290,
      child: Column(
        children: [
          Expanded(
            // ListView를 Expanded로 감싸서 가변적 높이를 할당
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: GestureDetector(
                    onTap: null,
                    child: Center(
                        child: Row(
                      children: [
                        SizedBox(width: 3),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/images/profile.svg',
                            ),
                            Icon(
                              Icons.person,
                              color: const Color.fromARGB(255, 255, 255, 255),
                              size: 30,
                            ),
                          ],
                        ),
                        SizedBox(width: 16),
                        TextFontWidget.fontRegular(
                          widget.state.userName ?? '',
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                        ),
                        TextFontWidget.fontRegular(
                          ' 님',
                          fontSize: 14,
                          color: const Color(0xFF767676),
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    )),
                  ),
                ),
                // 내 정보 부분 수정 시작
                SizedBox(height: 10),
                buildDrawerItem(
                  title: '내 정보',
                  iconSize: 18,
                  icon: MainIcons.ic_rounded_person,
                  onTap: () {
                    // 내 정보 부분 클릭 시 확장 상태 변경
                    isMyInfoExpanded = !isMyInfoExpanded;
                    // 상태 갱신
                    (context as Element).markNeedsBuild();
                  },
                  trailingIcon: MainIcons.ic_chevron_right,
                  isExpanded:
                      isMyInfoExpanded, // 내 정보가 확장되었을 때 마진과 border radius를 없애기 위해 전달
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () => context.go('/update_profile'),
                        child: TextFontWidget.fontRegular(
                          '내 정보 수정',
                          fontSize: 12,
                          color: const Color(0xff353549),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                        child: VerticalDivider(
                          color: Color(0xffCECECE),
                          thickness: 1,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          context.go('/change_pw');
                        },
                        child: TextFontWidget.fontRegular(
                          '비밀번호 변경',
                          fontSize: 12,
                          color: const Color(0xff353549),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                // 내 정보 확장 시 나타나는 항목들

                // 내 정보 부분 수정 끝
                buildDrawerItem(
                  title: '나의 소속 동아리',
                  icon: MainIcons.ic_verified,
                  iconSize: 18,
                  onTap: () => context
                      .go('/circle_list/${CircleListType.myCircles.routeKey}'),
                  trailingIcon: MainIcons.ic_chevron_right,
                ),
                buildDrawerItem(
                  title: '나의 지원 현황',
                  icon: MainIcons.ic_send_mail,
                  iconSize: 12,
                  onTap: () => context.go(
                      '/circle_list/${CircleListType.myApplications.routeKey}'),
                  trailingIcon: MainIcons.ic_chevron_right,
                ),
                buildDrawerItem(
                  title: '공지 사항',
                  icon: MainIcons.ic_chart,
                  iconSize: 16,
                  onTap: () {
                    context.go('/notices');
                  },
                  trailingIcon: MainIcons.ic_chevron_right, // 추가된 부분
                ),
                buildDrawerEventItem(
                  title: '동아리의 밤 입장하기',
                  onTap: () async {
                    await ref
                        .read(eventCertificateViewModelProvider.notifier)
                        .getStatus();
                  },
                ),
              ],
            ),
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: _launchURL,
                      child: TextFontWidget.fontRegular(
                        '문의하기',
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: 16),
                    InkWell(
                      onTap: () async {
                        await DialogManager.instance.showAlertDialog(
                          context: context,
                          title: '로그아웃 하시겠습니까?',
                          leftButtonText: '취소',
                          rightButtonText: '로그아웃',
                          onRightButtonPressed: () async {
                            await ref
                                .read(userViewModelProvider.notifier)
                                .logout
                                .execute();
                          },
                        );
                      },
                      child: TextFontWidget.fontRegular(
                        '로그아웃',
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () => context.go('/tems_of_serice'),
                      child: TextFontWidget.fontRegular(
                        '이용약관',
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: 16),
                    InkWell(
                      onTap: () => context.go('/privacy_policy'),
                      child: TextFontWidget.fontRegular(
                        '개인정보 처리 방침',
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ],
      ),
    );
  }

  void _launchURL() async {
    const url = inquiry;
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'URL을 열 수 없습니다: $url';
    }
  }
}
