import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:usw_circle_link/models/profile_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:usw_circle_link/const/data.dart';
import 'package:usw_circle_link/utils/dialog_manager.dart';
import 'package:usw_circle_link/viewmodels/user_view_model.dart';
import 'package:usw_circle_link/views/widgets/text_font_widget.dart';

class LoggedInMenu extends ConsumerStatefulWidget {
  const LoggedInMenu({
    Key? key,
    required this.state,
  }) : super(key: key);

  final ProfileModel state;

  @override
  _LoggedInMenuState createState() => _LoggedInMenuState();
}

class _LoggedInMenuState extends ConsumerState<LoggedInMenu> {
  bool isMyInfoExpanded = false;

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
                    onTap: null,
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
                              color: const Color(0xFFFDF5EC),
                              size: 30.w,
                            ),
                          ],
                        ),
                        SizedBox(width: 16.w),
                        TextFontWidget.fontRegular(
                            text: widget.state.data.userName,
                            fontSize: 18.sp,
                            color: Colors.black,
                            fontweight: FontWeight.w600),
                        TextFontWidget.fontRegular(
                            text: ' 님',
                            fontSize: 14.sp,
                            color: const Color(0xFF767676),
                            fontweight: FontWeight.w500),
                      ],
                    )),
                  ),
                ),
                // 내 정보 부분 수정 시작
                SizedBox(height: 10.h),
                buildDrawerItem(
                  title: '내 정보',
                  svgPath: 'assets/images/menubar1.svg',
                  onTap: () {
                    // 내 정보 부분 클릭 시 확장 상태 변경
                    isMyInfoExpanded = !isMyInfoExpanded;
                    // 상태 갱신
                    (context as Element).markNeedsBuild();
                  },
                  trailingSvgPath: isMyInfoExpanded
                      ? 'assets/images/under<.svg'
                      : 'assets/images/>.svg',
                  isExpanded:
                      isMyInfoExpanded, // 내 정보가 확장되었을 때 마진과 border radius를 없애기 위해 전달
                ),
                // 내 정보 확장 시 나타나는 항목들
                if (isMyInfoExpanded) ...[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Container(
                      margin: EdgeInsets.only(bottom: 12.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(8.r),
                        ), // 확장된 경우 위쪽 radius는 제거, 아래쪽만 둥글게 유지
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            onPressed: () => context.go('/update_profile'),
                            child: TextFontWidget.fontRegular(
                              text: '내 정보 수정',
                              fontSize: 12.sp,
                              color: const Color(0xff353549),
                              fontweight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 16.h,
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
                              text: '비밀번호 변경',
                              fontSize: 12.sp,
                              color: const Color(0xff353549),
                              fontweight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
                // 내 정보 부분 수정 끝
                buildDrawerItem(
                  title: '나의 소속 동아리',
                  svgPath: 'assets/images/menubar2.svg',
                  onTap: () => context.go('/my_circle'),
                  trailingSvgPath: 'assets/images/>.svg', // 추가된 부분
                ),
                buildDrawerItem(
                  title: '지원 현황 확인하기',
                  svgPath: 'assets/images/menubar3.svg',
                  onTap: () => context.go('/application_circle'),
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
                          text: '이용약관',
                          fontSize: 12.sp,
                          color: Colors.black,
                          fontweight: FontWeight.w500),
                    ),
                    TextButton(
                      onPressed: _launchURL,
                      child: TextFontWidget.fontRegular(
                          text: '피드백',
                          fontSize: 12.sp,
                          color: Colors.black,
                          fontweight: FontWeight.w500),
                    ),
                    TextButton(
                      onPressed: () async {
                        await DialogManager.instance.showAlertDialog(
                          context: context,
                          title: '로그아웃 하시겠습니까?',
                          leftButtonText: '취소',
                          rightButtonText: '로그아웃',
                          onRightButtonPressed: () async {
                            await ref
                                .read(userViewModelProvider.notifier)
                                .logout();
                          },
                        );
                      },
                      child: TextFontWidget.fontRegular(
                          text: '로그아웃',
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

void _launchURL() async {
  const url = '$feedback';
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
      contentPadding:
          EdgeInsets.only(left: 16.w, right: isExpanded ? 15.w : 6.w), // 패딩 조정
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
