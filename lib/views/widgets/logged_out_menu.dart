import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:usw_circle_link/const/data.dart';
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
                        SvgPicture.asset(
                          'assets/images/>.svg',
                        ),
                      ],
                    )),
                  ),
                ),
                // 내 정보 부분 수정 시작
                SizedBox(height: 10.h),
                buildDrawerItem(
                  title: '내 정보',
                  svgPath: 'assets/images/menubar1.svg',
                  //onTap: () => context.go('/login'),
                  onTap: () => context.go('/verify_password'),
                  trailingSvgPath: 'assets/images/>.svg',
                ),
                // 내 정보 부분 수정 끝
                buildDrawerItem(
                  title: '나의 소속 동아리',
                  svgPath: 'assets/images/menubar2.svg',
                  onTap: () => context.go('/login'),
                  trailingSvgPath: 'assets/images/>.svg', // 추가된 부분
                ),
                buildDrawerItem(
                  title: '지원 현황 확인하기',
                  svgPath: 'assets/images/menubar3.svg',
                  onTap: () => context.go('/login'),
                  trailingSvgPath: 'assets/images/>.svg', // 추가된 부분
                ),
                buildDrawerItem(
                  title: '공지 사항',
                  svgPath: 'assets/images/menubar4.svg',
                  onTap: () {
                    context.go('/notices');
                  },
                  trailingSvgPath: 'assets/images/>.svg', // 추가된 부분
                ),
              ],
            ),
          ),
          Column(
            children: [
              Container(
                height: 150.h,
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () => context.go('/tems_of_serice'),
                      child: TextFontWidget.fontRegular(
                        '이용약관',
                        fontSize: 12.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextButton(
                      onPressed: _launchURL,
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
  required String svgPath,
  required VoidCallback onTap,
  required String trailingSvgPath,
  bool isExpanded = false, // 확장 상태 전달받기
}) {
  return Container(
    alignment: Alignment.center,
    margin: EdgeInsets.only(
      left: 24.w,
      right: 24.w,
      bottom: isExpanded ? 0.h : 12.h,
    ), // 확장 시 마진 제거
    width: 242.w,
    height: 56.h,
    decoration: BoxDecoration(
      borderRadius: isExpanded
          ? BorderRadius.vertical(
              top: Radius.circular(8.r),
              bottom: Radius.circular(0),
            )
          : BorderRadius.circular(8.r), // 확장 시 위쪽 radius 제거
      color: const Color(0xffFFFFFF),
    ),
    child: ListTile(
      contentPadding: EdgeInsets.only(left: 16.w, right: 6), // 패딩 조정
      leading: SvgPicture.asset(svgPath),
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
      trailing: SvgPicture.asset(trailingSvgPath),
      onTap: onTap,
    ),
  );
}
