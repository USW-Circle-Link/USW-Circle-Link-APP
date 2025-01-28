import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart' hide AppBar;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:usw_circle_link/models/circle_list_model.dart';
import 'package:usw_circle_link/models/profile_model.dart';
import 'package:usw_circle_link/models/user_model.dart';
import 'package:usw_circle_link/utils/error_util.dart';
import 'package:usw_circle_link/utils/logger/Logger.dart';
import 'package:usw_circle_link/viewmodels/main_view_model.dart';
import 'package:usw_circle_link/viewmodels/profile_view_model.dart';
import 'package:usw_circle_link/viewmodels/user_view_model.dart';
import 'package:usw_circle_link/views/widgets/group_picker.dart';
import 'package:usw_circle_link/views/widgets/logged_in_menu.dart';
import 'package:usw_circle_link/views/widgets/logged_out_menu.dart';
import 'package:usw_circle_link/views/widgets/notification_overlay.dart';
import 'package:usw_circle_link/views/widgets/text_font_widget.dart';
import 'package:usw_circle_link/views/widgets/circle_list.dart';
import 'package:usw_circle_link/views/widgets/app_bar.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  bool isAllSelected = true;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  OverlayEntry? _overlayEntry;

  List<String> selectedGroups = [];

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
      (_overlayEntry!.builder as NotificationOverlayState).updateList();
    }
  }

  OverlayEntry _createOverlayEntry(BuildContext context) {
    return OverlayEntry(
      builder: (context) => NotificationOverlay(
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

    final circleListState = ref.watch(circleViewModelProvider);
    ref.listen(circleViewModelProvider, (previous, next) {
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
            SizedBox(
              height: 1.h,
            ),
            Container(
              color: Colors.white,
              // height: 60.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        DecoratedBox(
                          decoration: isAllSelected
                              ? BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(color: Colors.black)),
                                )
                              : BoxDecoration(),
                          child: TextButton(
                            onPressed: () async {
                              if (isAllSelected) {
                                return;
                              }
                              setState(() {
                                isAllSelected = true;
                              });
                              await fetchCircleList();
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: const Color(0xffffB052),
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.w,
                                vertical: 20.h,
                              ),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                            ),
                            child: TextFontWidget.fontRegular(
                              '전체',
                              fontSize: 16.sp,
                              color: isAllSelected
                                  ? Colors.black
                                  : const Color(0xffA8A8A8),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        DecoratedBox(
                          decoration: !isAllSelected
                              ? BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(color: Colors.black)),
                                )
                              : BoxDecoration(),
                          child: TextButton(
                            onPressed: () async {
                              if (!isAllSelected) {
                                return;
                              }
                              setState(() {
                                isAllSelected = false;
                              });
                              await fetchCircleList();
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: const Color(0xffffB052),
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.w,
                                vertical: 20.h,
                              ),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                            ),
                            child: TextFontWidget.fontRegular(
                              '모집 중',
                              fontSize: 16.sp,
                              color: !isAllSelected
                                  ? Colors.black
                                  : const Color(0xffA8A8A8),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                    OutlinedButton(
                      onPressed: () async {
                        final result = await showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) {
                            return GroupPicker(initialGroups: selectedGroups);
                          },
                        );
                        setState(() {
                          selectedGroups = result;
                        });
                        await fetchCircleList();
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: selectedGroups.isEmpty
                            ? Colors.white
                            : Color(0xFFFFB052),
                        foregroundColor: selectedGroups.isEmpty
                            ? Color(0xFFFFB052)
                            : Colors.white,
                        minimumSize: Size.zero,
                        padding: EdgeInsets.symmetric(
                          horizontal: 7.w,
                          vertical: 5.h,
                        ),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        side: BorderSide(
                          color: selectedGroups.isEmpty
                              ? Color(0xFF959595)
                              : Color(0xFFFF9A21),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.r))),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/ic_filter.svg',
                            colorFilter: selectedGroups.isEmpty
                                ? null
                                : ColorFilter.mode(
                                    Colors.white,
                                    BlendMode.srcIn,
                                  ),
                          ),
                          TextFontWidget.fontRegular(
                            '필터',
                            fontWeight: FontWeight.w500,
                            color: selectedGroups.isEmpty
                                ? Color(0xffa8a8a8)
                                : Colors.white,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            ...selectedGroups.isEmpty
                ? []
                : [
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.only(left: 24.w),
                      height: 60.h,
                      alignment: Alignment.centerLeft,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Wrap(
                          spacing: 10.w,
                          children: selectedGroups.map((label) {
                            return _buildChip(label);
                          }).toList(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
            Expanded(
              child: circleListState.when<Widget>(
                  data: (circleList) {
                    return circleList.data.isNotEmpty
                        ? CircleList(
                            state: circleListState.value as CircleListModel,
                            onItemClicked: (clubId) {
                              context.go('/circle?clubId=$clubId');
                            },
                          )
                        : Center(
                            child: TextFontWidget.fontRegular(
                              '동아리가 없습니다',
                              fontSize: 14.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          );
                  },
                  error: (error, stackTrace) {
                    final _error = error as CircleListModelError;
                    return Center(
                      child: TextFontWidget.fontRegular(
                        ErrorUtil.instance.getErrorMessage(_error.code) ??
                            '동아리를 불러오지 못했습니다...',
                        fontSize: 14.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    );
                  },
                  loading: () => Center(child: CircularProgressIndicator())),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChip(String label) {
    return Chip(
      labelPadding: EdgeInsets.only(left: 10.w),
      label: Text(label),
      deleteIcon: Icon(Icons.close, size: 16.sp),
      onDeleted: () async {
        setState(() {
          selectedGroups.remove(label);
        });
        await fetchCircleList();
      },
      labelStyle: TextFontWidget.fontRegularStyle(
        color: Color(0xFF434343),
        fontWeight: FontWeight.w300,
      ),
      backgroundColor: Colors.white,
      elevation: null,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Color(0xFFFF9A21)),
        borderRadius: BorderRadius.all(Radius.circular(15.r)),
      ),
      padding: EdgeInsets.all(0),
    );
  }

  Future<void> fetchCircleList() async {
    if (selectedGroups.isEmpty) {
      if (isAllSelected) {
        await ref.read(circleViewModelProvider.notifier).fetchAllCircleList();
      } else {
        await ref.read(circleViewModelProvider.notifier).fetchOpenCircleList();
      }
    } else {
      if (isAllSelected) {
        await ref
            .read(circleViewModelProvider.notifier)
            .fetchAllFilteredCircleList(selectedGroups);
      } else {
        await ref
            .read(circleViewModelProvider.notifier)
            .fetchOpenFilteredCircleList(selectedGroups);
      }
    }
  }
}
