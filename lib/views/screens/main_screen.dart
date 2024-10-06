import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:usw_circle_link/main.dart';
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
    // foreground 수신처리
    FirebaseMessaging.onMessage.listen(showFlutterNotification);
    // 알림 클릭시
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
    super.initState();
  }

  void _handleMessage(RemoteMessage message) {
    // 내가 지정한 그 알람이면 지정한 화면으로 이동
    if (message.data['data1'] == 'value1') {
      // something to do ...
      // e.g) context.go(...)
    }
  }

  /// fcm 전경 처리 - 로컬 알림 보이기
  void showFlutterNotification(RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    if (notification != null && android != null && !kIsWeb) {
      // 웹이 아니면서 안드로이드이고, 알림이 있는경우
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            // TODO add a proper drawable resource to android, for now using
            //      one that already exists in example app.
            icon: 'launch_background',
          ),
        ),
      );
    }
  }

  // 알림 권한 요청
  Future<void> _requestNotificationPermission() async {
    if (Platform.isAndroid) {
      final int sdkInt = (await DeviceInfoPlugin().androidInfo).version.sdkInt;

      if (sdkInt >= 33) {
        logger.d('Permission Requested!');
        await Permission.notification.request();
      }
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
                text: '동구라미',
                fontSize: 16.sp,
                color: const Color(0xffFFC01D),
                fontweight: FontWeight.w400,
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
                        .fetchOpenCircleList();
                  },
                  style: ElevatedButton.styleFrom(
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
                    text: '모집중',
                    fontSize: 16.sp,
                    color:
                        !isAllSelected ? Colors.white : const Color(0xffCECECE),
                    fontweight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            circleListState.value is CircleListModel
                ? Expanded(
                    child: CircleList(
                    state: circleListState.value as CircleListModel,
                    onItemClicked: (clubId) {
                      context.go('/circle?clubId=$clubId');
                    },
                  ))
                : Expanded(
                    child: Center(
                        child: TextFontWidget.fontRegular(
                            text: '동아리가 없습니다',
                            fontSize: 14.sp,
                            color: Colors.black,
                            fontweight: FontWeight.w400)),
                  ),
          ],
        ),
      ),
    );
  }
}

class _NotificationOverlay extends StatefulWidget {
  final VoidCallback onDismiss;

  const _NotificationOverlay({required this.onDismiss});

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
                      final notifications =
                          ref.watch(firebaseCloudMessagingViewModelProvider);
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

  @override
  void dispose() {
    super.dispose();
  }
}
