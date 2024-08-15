import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:usw_circle_link/notifier/notification_state_notifier.dart';
import 'package:usw_circle_link/utils/logger/Logger.dart';
import 'package:usw_circle_link/viewmodels/UserViewModel.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:usw_circle_link/viewmodels/FirbaseVM.dart';
import 'package:usw_circle_link/views/widgets/CloudMessaging.dart';
import 'package:usw_circle_link/views/widgets/TextFontWidget.dart';

class MainScreen extends ConsumerStatefulWidget {
  MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  bool isAllSelected = true;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();

    // ViewModel을 통해 FCM 초기화
    ref.read(notificationViewModelProvider).initializeFCM();
  }

  void _showOverlay(BuildContext context) {
    if (_overlayEntry == null) {
      _overlayEntry = _createOverlayEntry(context);
      Overlay.of(context)?.insert(_overlayEntry!);
    } else {
      (_overlayEntry!.builder as _NotificationOverlayState).updateList();
    }
  }

  OverlayEntry _createOverlayEntry(BuildContext context) {
    return OverlayEntry(
      builder: (context) => _NotificationOverlay(
        onDismiss: () {
          _overlayEntry?.remove();
          _overlayEntry = null;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // null -> 로그아웃 상태
    // UserModel -> 로그인 상태
    final state = ref.watch(userViewModelProvider); 
    ref.listen(userViewModelProvider, (previous, next) {
      // 유저 정보 불러오기
      logger.d(next);
    });
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => Scaffold(
        key: _scaffoldKey,
        backgroundColor: const Color(0xffF0F2F5),
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          toolbarHeight: 42.h,
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: Container(
            margin: EdgeInsets.only(left: 24.w), // menubt.svg에 왼쪽 여백 추가
            child: IconButton(
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              },
              icon: Icon(
                Icons.menu_outlined,
                color: Colors.grey,
              ),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/duck.png',
                width: 19.w,
                height: 19.h,
              ),
              SizedBox(width: 8.w),
              TextFontWidget.jalnan2(
                text: '동구라미',
                fontSize: 16.sp,
                color: const Color(0xffFFC01D),
                fontweight: FontWeight.w400,
              ),
            ],
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 24.w),
              child: IconButton(
                onPressed: () {
                  _showOverlay(context);
                },
                icon: SvgPicture.asset('assets/images/bell.svg'),
              ),
            ),
          ],
        ),
        drawer: Menubar(context, ref),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isAllSelected = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isAllSelected
                        ? const Color(0xff6E78D8)
                        : const Color(0xffEBEBEB),
                    minimumSize:
                        Size(MediaQuery.of(context).size.width / 2, 46.h),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: TextFontWidget.jalnan2(
                    text: '전체',
                    fontSize: 16.sp,
                    color:
                        isAllSelected ? Colors.white : const Color(0xffCECECE),
                    fontweight: FontWeight.w400,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isAllSelected = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: !isAllSelected
                        ? const Color(0xff6E78D8)
                        : const Color(0xffEBEBEB),
                    minimumSize:
                        Size(MediaQuery.of(context).size.width / 2, 46.h),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: TextFontWidget.jalnan2(
                    text: '모집중',
                    fontSize: 16.sp,
                    color:
                        !isAllSelected ? Colors.white : const Color(0xffCECECE),
                    fontweight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  UswClubList(ref),
                  UswClubList(ref),
                  UswClubList(ref),
                  UswClubList(ref),
                  UswClubList(ref),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NotificationOverlay extends StatefulWidget {
  final VoidCallback onDismiss;

  _NotificationOverlay({required this.onDismiss});

  @override
  _NotificationOverlayState createState() => _NotificationOverlayState();
}

class _NotificationOverlayState extends State<_NotificationOverlay> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: GestureDetector(
            onTap: widget.onDismiss,
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
        ),
        Positioned(
          top: kToolbarHeight + 45.h,
          right: 24.w,
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: 208.w,
              height: 220.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.h),
                    child: Text(
                      "알림",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Consumer(builder: (context, ref, child) {
                      final notifications = ref.watch(notificationProvider);
                      return ListView.builder(
                        itemCount: notifications.length,
                        itemBuilder: (context, index) {
                          return CloudMessaging(
                            text: notifications[index],
                            index: index,
                          );
                        },
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void updateList() {
    setState(() {});
  }
}

// ignore: non_constant_identifier_names
bool isMyInfoExpanded = false; // 내 정보가 확장되었는지 여부를 확인
Widget Menubar(BuildContext context, WidgetRef ref) {
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
                  onTap: () {
                    context.go('/login');
                  },
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
                          onPressed: () {},
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
                onTap: () {
                  // 나의 소속 동아리 화면으로 이동
                },
                trailingSvgPath: 'assets/images/>.svg', // 추가된 부분
              ),
              buildDrawerItem(
                title: '지원 현황 확인하기',
                svgPath: 'assets/images/menubar3.svg',
                onTap: () {
                  // 지원 현황 확인 화면으로 이동
                },
                trailingSvgPath: 'assets/images/>.svg', // 추가된 부분
              ),
              buildDrawerItem(
                title: '공지 사항',
                svgPath: 'assets/images/menubar4.svg',
                onTap: () {
                  // 공지 사항 화면으로 이동
                },
                trailingSvgPath: 'assets/images/>.svg', // 추가된 부분
              ),
            ],
          ),
        ),
        // 하단 버튼을 화면 하단에 고정
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
                  TextButton(
                    onPressed: () async {
                      await ref.read(userViewModelProvider.notifier).logout();
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

Widget CustomCard({required Container child, required WidgetRef ref}) {
  return Container(
    margin: EdgeInsets.only(top: 12.h, right: 6.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          'assets/images/gullisae.png',
          width: 120.w,
          height: 140.h,
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            SizedBox(width: 6.w),
            TextFontWidget.fontRegular(
              text: '굴리세',
              fontSize: 14.sp,
              color: Colors.black,
              fontweight: FontWeight.w500,
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            SizedBox(width: 4.w),
            Container(
              alignment: Alignment.center,
              height: 20.h,
              width: 47.w,
              margin: EdgeInsets.only(right: 5.w),
              decoration: BoxDecoration(
                color: Color(0xffF0F2F5),
                borderRadius: BorderRadius.all(
                  Radius.circular(4.0),
                ),
              ),
              child: TextFontWidget.fontRegular(
                text: '# 볼링',
                fontSize: 12.sp,
                color: Color(0xff989898),
                fontweight: FontWeight.w400,
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 20.h,
              width: 47.w,
              margin: EdgeInsets.only(right: 5.w),
              decoration: BoxDecoration(
                color: Color(0xffF0F2F5),
                borderRadius: BorderRadius.all(
                  Radius.circular(4.0),
                ),
              ),
              child: TextFontWidget.fontRegular(
                text: '# 친목',
                fontSize: 12.sp,
                color: Color(0xff989898),
                fontweight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

// ignore: non_constant_identifier_names
Widget UswClubList(WidgetRef ref) {
  return Container(
    width: double.infinity,
    height: 250.h,
    margin: EdgeInsets.only(top: 12.h),
    padding: EdgeInsets.only(left: 24.w, top: 16.h, bottom: 16.h),
    color: Colors.white,
    child: Row(
      children: [
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
              return CustomCard(
                ref: ref,
                child: Container(
                  width: 150.w,
                  height: 200.h,
                  child: Center(
                    child: Text('Card $index'),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}
