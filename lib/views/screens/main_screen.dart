import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:usw_circle_link/models/circle_list_model.dart';
import 'package:usw_circle_link/models/profile_model.dart';
import 'package:usw_circle_link/models/user_model.dart';
import 'package:usw_circle_link/utils/logger/Logger.dart';
import 'package:usw_circle_link/viewmodels/main_view_model.dart';
import 'package:usw_circle_link/viewmodels/profile_view_model.dart';
import 'package:usw_circle_link/viewmodels/user_view_model.dart';
import 'package:usw_circle_link/viewmodels/fcm_view_model.dart';
import 'package:usw_circle_link/views/widgets/cloud_messaging.dart';
import 'package:usw_circle_link/views/widgets/logged_in_menu.dart';
import 'package:usw_circle_link/views/widgets/logged_out_menu.dart';
import 'package:usw_circle_link/views/widgets/text_font_widget.dart';
import 'package:usw_circle_link/views/widgets/circle_list.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  bool isAllSelected = true;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    // 알림 클릭시
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
    super.initState();
  }

  void _handleMessage(RemoteMessage message) {
    // 내가 지정한 그 알람이면 지정한 화면으로 이동
    logger.d('_handleMessage');
    if (message.data['data1'] == 'value1') {
      // something to do ...
      // e.g) context.go(...)
    }
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
    final userState = ref.watch(userViewModelProvider);
    ref.listen(userViewModelProvider, (previous, next) {
      logger.d(next);
    });

    final circleListState = ref.watch(mainViewModelProvider);
    ref.listen(mainViewModelProvider, (previous, next) {
      logger.d(next);
    });

    final profileState = ref.watch(profileViewModelProvider);
    ref.listen(profileViewModelProvider, (previous, next) {
      logger.d(next);
    });

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => Scaffold(
        key: _scaffoldKey,
        backgroundColor: const Color(0xffF0F2F5),
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          toolbarHeight: 42.h,
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            icon: Icon(
              Icons.menu_outlined,
              color: Colors.grey,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/dongurami.png',
                width: 19.w,
                height: 19.h,
              ),
              SizedBox(width: 8.w),
              TextFontWidget.jalnan2(
                '동구라미',
                fontSize: 16.sp,
                color: const Color(0xffFFC01D),
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                _showOverlay(context);
              },
              icon: SvgPicture.asset('assets/images/bell.svg'),
            ),
          ],
        ),
        drawer:
            userState.value is UserModel && profileState.value is ProfileModel
                ? LoggedInMenu(state: profileState.value as ProfileModel)
                : LoggedOutMenu(),
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
                    foregroundColor: !isAllSelected
                        ? const Color(0xffffB052)
                        : const Color(0xffEBEBEB),
                    backgroundColor: isAllSelected
                        ? const Color(0xffffB052)
                        : const Color(0xffEBEBEB),
                    minimumSize:
                        Size(MediaQuery.of(context).size.width / 2, 46.h),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: TextFontWidget.jalnan2(
                    '전체',
                    fontSize: 16.sp,
                    color:
                        isAllSelected ? Colors.white : const Color(0xffCECECE),
                    fontWeight: FontWeight.w400,
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
                        .fetchOpenCircleList();
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: !isAllSelected
                        ? const Color(0xffEBEBEB)
                        : const Color(0xffffB052),
                    backgroundColor: !isAllSelected
                        ? const Color(0xffffB052)
                        : const Color(0xffEBEBEB),
                    minimumSize:
                        Size(MediaQuery.of(context).size.width / 2, 46.h),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: TextFontWidget.jalnan2(
                    '모집중',
                    fontSize: 16.sp,
                    color:
                        !isAllSelected ? Colors.white : const Color(0xffCECECE),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: circleListState.when<Widget>(
                    data: (circleList) {
                      return circleList.data.isNotEmpty
                          ? CircleList(
                              state: circleListState.value as CircleListModel,
                              onItemClicked: (clubId) {
                                context.go('/circle?clubId=$clubId');
                              },
                            )
                          : TextFontWidget.fontRegular(
                              '동아리가 없습니다',
                              fontSize: 14.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            );
                    },
                    error: (error, stackTrace) {
                      return TextFontWidget.fontRegular(
                        '동아리를 불러오지 못했습니다...',
                        fontSize: 14.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      );
                    },
                    loading: () => CircularProgressIndicator()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NotificationOverlay extends ConsumerStatefulWidget {
  final VoidCallback onDismiss;

  const _NotificationOverlay({required this.onDismiss});

  @override
  _NotificationOverlayState createState() => _NotificationOverlayState();
}

class _NotificationOverlayState extends ConsumerState<_NotificationOverlay> {
  @override
  Widget build(BuildContext context) {
    final notifications = ref.watch(firebaseCloudMessagingViewModelProvider);
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
                    padding: EdgeInsets.only(top: 16.h),
                    child: TextFontWidget.fontRegular(
                      "알림",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Expanded(
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: ListView.builder(
                        itemCount: notifications.length,
                        itemBuilder: (context, index) {
                          return CloudMessaging(
                            text: notifications[index],
                            index: index,
                          );
                        },
                      ),
                    ),
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

  @override
  void dispose() {
    super.dispose();
  }
}
