import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:usw_circle_link/models/circle_list_model.dart';
import 'package:usw_circle_link/notifier/Notification_state_notifier.dart';
import 'package:usw_circle_link/utils/logger/Logger.dart';
import 'package:usw_circle_link/viewmodels/main_view_model.dart';
import 'package:usw_circle_link/viewmodels/user_view_model.dart';
import 'package:usw_circle_link/views/widgets/cloud_messaging.dart';
import 'package:usw_circle_link/views/widgets/logged_in_menu.dart';
import 'package:usw_circle_link/views/widgets/logged_out_menu.dart';
import 'package:usw_circle_link/views/widgets/text_font_widget.dart';
import 'package:usw_circle_link/views/widgets/circle_list.dart';

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
      Overlay.of(context).insert(_overlayEntry!);
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
    // ref.read(mainViewModelProvider.notifier).fetchAllCircleList();
    // null -> 로그아웃 상태
    // UserModel -> 로그인 상태
    final userState = ref.watch(userViewModelProvider);
    ref.listen(userViewModelProvider, (previous, next) {
      // 유저 정보 불러오기
      logger.d(next);
    });
    final circleListState = ref.watch(mainViewModelProvider);
    ref.listen(mainViewModelProvider, (previous, next) {
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
        drawer: userState.value == null ? LoggedOutMenu() : LoggedInMenu(),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    if (isAllSelected) {
                      return;
                    }
                    setState(() {
                      isAllSelected = true;
                    });
                    await ref
                        .read(mainViewModelProvider.notifier)
                        .fetchAllCircleList();
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
                  onPressed: () async {
                    if (!isAllSelected) {
                      return;
                    }
                    setState(() {
                      isAllSelected = false;
                    });
                    await ref
                        .read(mainViewModelProvider.notifier)
                        .fetchDepartmentCircleList();
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
            circleListState is CircleListModel
                ? Expanded(child: CircleList(state: circleListState))
                : Container(),
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