import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:usw_circle_link/const/data.dart';
import 'package:usw_circle_link/models/circle_detail_list_model.dart';
import 'package:usw_circle_link/router/circle_list_route.dart';
import 'package:usw_circle_link/utils/dialog_manager.dart';
import 'package:usw_circle_link/utils/icons/main_icons_icons.dart';
import 'package:usw_circle_link/viewmodels/user_view_model.dart';
import 'package:usw_circle_link/viewmodels/state/user_state.dart';
import 'package:usw_circle_link/widgets/text_font_widget/text_font_widget.dart';

import '../../viewmodels/event_certificate_view_model.dart';
import '../drawer_item/drawer_item.dart';
import 'drawer_menu_styles.dart';

/// 드로어 메뉴 컴포넌트
///
/// [userState]가 null이거나 [userState.userName]이 null이면 로그아웃 상태로 표시됩니다.
class DrawerMenu extends ConsumerStatefulWidget {
  const DrawerMenu({
    super.key,
    this.userState,
    this.style = DrawerMenuStyle.defaultStyle,
  });

  /// 사용자 상태. null이면 로그아웃 상태로 간주
  final UserState? userState;

  /// 드로어 메뉴 스타일
  final DrawerMenuStyle style;

  @override
  ConsumerState<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends ConsumerState<DrawerMenu> {
  bool isMyInfoExpanded = false;

  /// 로그인 상태 여부
  bool get isLoggedIn =>
      widget.userState != null && widget.userState!.userName != null;

  @override
  Widget build(BuildContext context) {
    // 로그인 상태일 때만 이벤트 인증 리스너 등록
    if (isLoggedIn) {
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
            DialogManager.instance.dismissDialog(context);
            await DialogManager.instance.showCircleCertificateDialog(context);
          }
        },
      );
    }

    return Drawer(
      backgroundColor: widget.style.backgroundColor,
      width: widget.style.width,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildHeader(context),
                const SizedBox(height: 10),
                ..._buildMenuItems(context),
              ],
            ),
          ),
          _buildBottomMenu(context),
        ],
      ),
    );
  }

  /// 헤더 영역 빌드
  Widget _buildHeader(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(
        color: widget.style.headerBackgroundColor,
      ),
      child: GestureDetector(
        onTap: isLoggedIn ? null : () => context.go('/login'),
        child: Center(
          child: Row(
            children: [
              const SizedBox(width: 3),
              Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset('assets/images/profile.svg'),
                  Icon(
                    Icons.person,
                    color: widget.style.profileIconColor,
                    size: widget.style.profileIconSize,
                  ),
                ],
              ),
              const SizedBox(width: 16),
              if (isLoggedIn) ...[
                TextFontWidget.fontRegular(
                  widget.userState!.userName ?? '',
                  fontSize: widget.style.headerFontSize,
                  color: widget.style.headerColor,
                  fontWeight: widget.style.headerFontWeight,
                ),
                TextFontWidget.fontRegular(
                  ' 님',
                  fontSize: widget.style.subTextFontSize,
                  color: widget.style.subTextColor,
                  fontWeight: widget.style.subTextFontWeight,
                ),
              ] else ...[
                TextFontWidget.fontRegular(
                  '로그인',
                  fontSize: widget.style.headerFontSize,
                  color: widget.style.headerColor,
                  fontWeight: widget.style.headerFontWeight,
                ),
                Icon(
                  MainIcons.ic_chevron_right,
                  color: widget.style.arrowIconColor,
                  size: widget.style.arrowIconSize,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  /// 메뉴 아이템들 빌드
  List<Widget> _buildMenuItems(BuildContext context) {
    if (isLoggedIn) {
      return [
        // 내 정보 (확장 가능)
        buildDrawerItem(
          title: '내 정보',
          iconSize: 18,
          icon: MainIcons.ic_rounded_person,
          onTap: () {
            setState(() {
              isMyInfoExpanded = !isMyInfoExpanded;
            });
          },
          trailingIcon: MainIcons.ic_chevron_right,
          isExpanded: isMyInfoExpanded,
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
              const SizedBox(
                height: 16,
                child: VerticalDivider(
                  color: Color(0xffCECECE),
                  thickness: 1,
                ),
              ),
              TextButton(
                onPressed: () => context.go('/change_pw'),
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
        // 나의 소속 동아리
        buildDrawerItem(
          title: '나의 소속 동아리',
          icon: MainIcons.ic_verified,
          iconSize: 18,
          onTap: () =>
              context.go('/circle_list/${CircleListType.myCircles.routeKey}'),
          trailingIcon: MainIcons.ic_chevron_right,
        ),
        // 나의 지원 현황
        buildDrawerItem(
          title: '나의 지원 현황',
          icon: MainIcons.ic_send_mail,
          iconSize: 12,
          onTap: () => context
              .go('/circle_list/${CircleListType.myApplications.routeKey}'),
          trailingIcon: MainIcons.ic_chevron_right,
          trailingIconSize: 18,
        ),
        // 공지 사항
        buildDrawerItem(
          title: '공지 사항',
          icon: MainIcons.ic_chart,
          iconSize: 16,
          onTap: () => context.go('/notices'),
          trailingIcon: MainIcons.ic_chevron_right,
        ),
      ];
    } else {
      // 로그아웃 상태: 모든 메뉴 클릭 시 로그인 페이지로 이동
      return [
        buildDrawerItem(
          title: '내 정보',
          icon: MainIcons.ic_rounded_person,
          iconSize: 18,
          onTap: () => context.go('/login'),
          trailingIcon: MainIcons.ic_chevron_right,
        ),
        buildDrawerItem(
          title: '나의 소속 동아리',
          icon: MainIcons.ic_verified,
          iconSize: 18,
          onTap: () => context.go('/login'),
          trailingIcon: MainIcons.ic_chevron_right,
        ),
        buildDrawerItem(
          title: '나의 지원 현황',
          icon: MainIcons.ic_send_mail,
          iconSize: 12,
          onTap: () => context.go('/login'),
          trailingIcon: MainIcons.ic_chevron_right,
          trailingIconSize: 18,
        ),
        buildDrawerItem(
          title: '공지 사항',
          icon: MainIcons.ic_chart,
          iconSize: 16,
          onTap: () => context.go('/notices'),
          trailingIcon: MainIcons.ic_chevron_right,
        ),
      ];
    }
  }

  /// 하단 메뉴 빌드
  Widget _buildBottomMenu(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: widget.style.bottomMenuHorizontalPadding,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: _launchURL,
                child: TextFontWidget.fontRegular(
                  '문의하기',
                  fontSize: widget.style.bottomMenuFontSize,
                  color: widget.style.bottomMenuColor,
                  fontWeight: widget.style.bottomMenuFontWeight,
                ),
              ),
              if (isLoggedIn) ...[
                SizedBox(width: widget.style.bottomMenuItemSpacing),
                InkWell(
                  onTap: () => _showLogoutDialog(context),
                  child: TextFontWidget.fontRegular(
                    '로그아웃',
                    fontSize: widget.style.bottomMenuFontSize,
                    color: widget.style.bottomMenuColor,
                    fontWeight: widget.style.bottomMenuFontWeight,
                  ),
                ),
              ],
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: widget.style.bottomMenuHorizontalPadding,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () => context.go('/tems_of_serice'),
                child: TextFontWidget.fontRegular(
                  '이용약관',
                  fontSize: widget.style.bottomMenuFontSize,
                  color: widget.style.bottomMenuColor,
                  fontWeight: widget.style.bottomMenuFontWeight,
                ),
              ),
              SizedBox(width: widget.style.bottomMenuItemSpacing),
              InkWell(
                onTap: () => context.go('/privacy_policy'),
                child: TextFontWidget.fontRegular(
                  '개인정보 처리 방침',
                  fontSize: widget.style.bottomMenuFontSize,
                  color: widget.style.bottomMenuColor,
                  fontWeight: widget.style.bottomMenuFontWeight,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }

  /// 로그아웃 다이얼로그 표시
  Future<void> _showLogoutDialog(BuildContext context) async {
    await DialogManager.instance.showAlertDialog(
      context: context,
      title: '로그아웃 하시겠습니까?',
      leftButtonText: '취소',
      rightButtonText: '로그아웃',
      onRightButtonPressed: () async {
        await ref.read(userViewModelProvider.notifier).logout.execute();
      },
    );
  }

  /// 문의하기 URL 열기
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
