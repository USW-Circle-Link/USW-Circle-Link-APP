import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:usw_circle_link/const/data.dart';
import 'package:usw_circle_link/utils/icons/main_icons_icons.dart';
import 'package:usw_circle_link/views/widgets/text_font_widget.dart';

class LoggedOutMenu extends ConsumerWidget {
  const LoggedOutMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      backgroundColor: const Color(0xffF0F2F5),
      width: 290.w,
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
                    onTap: () => context.go('/login'),
                    child: Center(
                        child: Row(
                      children: [
                        SizedBox(width: 3.w),
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
                        SizedBox(width: 16.w),
                        TextFontWidget.fontRegular(
                          '로그인',
                          fontSize: 18.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                        ),
                        Icon(
                          MainIcons.ic_chevron_right,
                          color: Colors.black,
                          size: 24.sp,
                        ),
                      ],
                    )),
                  ),
                ),
                // 내 정보 부분 수정 시작
                SizedBox(height: 10.h),
                buildDrawerItem(
                  title: '내 정보',
                  icon: MainIcons.ic_rounded_person,
                  iconSize: 18.sp,
                  onTap: () => context.go('/login'),
                  trailingIcon: MainIcons.ic_chevron_right,
                ),
                // 내 정보 부분 수정 끝
                buildDrawerItem(
                  title: '나의 소속 동아리',
                  icon: MainIcons.ic_verified,
                  iconSize: 18.sp,
                  onTap: () => context.go('/login'),
                  trailingIcon: MainIcons.ic_chevron_right, // 추가된 부분
                ),
                buildDrawerItem(
                  title: '나의 지원 현황',
                  icon: MainIcons.ic_send_mail,
                  iconSize: 12.sp,
                  onTap: () => context.go('/login'),
                  trailingIcon: MainIcons.ic_chevron_right, // 추가된 부분
                ),
                buildDrawerItem(
                  title: '공지 사항',
                  icon: MainIcons.ic_chart,
                  iconSize: 16.sp,
                  onTap: () {
                    context.go('/notices');
                  },
                  trailingIcon: MainIcons.ic_chevron_right, // 추가된 부분
                ),
              ],
            ),
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: _launchURL,
                      child: TextFontWidget.fontRegular(
                        '피드백',
                        fontSize: 12.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () => context.go('/tems_of_serice'),
                      child: TextFontWidget.fontRegular(
                        '이용약관',
                        fontSize: 12.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: 16.w),
                    InkWell(
                      onTap: () => context.go('/privacy_policy'),
                      child: TextFontWidget.fontRegular(
                        '개인정보 처리 방침',
                        fontSize: 12.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ],
      ),
    );
  }
}

void _launchURL() async {
  const url = feedback;
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'URL을 열 수 없습니다: $url';
  }
}

Widget buildDrawerItem({
  required String title,
  required IconData icon,
  double? iconSize,
  required VoidCallback onTap,
  required IconData trailingIcon,
  Widget? subtitle,
  bool isExpanded = false,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
    child: Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8.r),
      child: InkWell(
        borderRadius: BorderRadius.circular(8.r),
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          height: isExpanded ? 100.h : 56.h,
          child: Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.only(
                  left: 16.w,
                  right: isExpanded ? 15.w : 6.w,
                ),
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(icon, size: iconSize, color: Colors.grey),
                  ],
                ),
                title: Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: TextFontWidget.fontRegular(
                    title,
                    overflow: TextOverflow.ellipsis,
                    fontSize: 15.sp,
                    color: const Color(0xff353549),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: AnimatedRotation(
                  duration: const Duration(milliseconds: 300),
                  turns: isExpanded ? 0.5 : 0,
                  child: Icon(trailingIcon, color: Colors.grey),
                ),
              ),
              if (isExpanded && subtitle != null)
                Expanded(
                  child: Container(
                    width: double.infinity,
                    child: subtitle,
                  ),
                ),
            ],
          ),
        ),
      ),
    ),
  );
}
