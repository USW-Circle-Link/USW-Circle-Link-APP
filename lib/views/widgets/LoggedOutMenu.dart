import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:usw_circle_link/views/widgets/TextFontWidget.dart';

class LoggedOutMenu extends StatelessWidget {
  const LoggedOutMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        SvgPicture.asset(
                          'assets/images/profile.svg',
                        ),
                        SizedBox(width: 16.w),
                        TextFontWidget.fontRegular(
                            text: '로그인',
                            fontSize: 18.sp,
                            color: Colors.black,
                            fontweight: FontWeight.w600),
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
                  onTap: () => context.go('/login'),
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
                  onTap: () => context.go('/login'),
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
                      onPressed: () {},
                      child: TextFontWidget.fontRegular(
                          text: '이용약관',
                          fontSize: 12.sp,
                          color: Colors.black,
                          fontweight: FontWeight.w500),
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
          text: title,
          fontSize: 15.sp,
          color: const Color(0xff353549),
          fontweight: FontWeight.w500,
        ),
      ),
      trailing: SvgPicture.asset(trailingSvgPath),
      onTap: onTap,
    ),
  );
}
