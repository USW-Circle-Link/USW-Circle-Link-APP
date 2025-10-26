import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart' hide AppBar;
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../const/analytics_const.dart';
import '../../models/category_model.dart';
import '../../models/circle_list_model.dart';
import '../../models/response/global_exception.dart';
import '../../notifier/abnormal_access_notifier.dart';
import '../../notifier/network_connectivity_notifier.dart';
import '../../utils/dialog_manager.dart';
import '../../utils/error_util.dart';
import '../../utils/icons/main_icons_icons.dart';
import '../../utils/logger/logger.dart';
import '../../viewmodels/fcm_view_model.dart';
import '../../viewmodels/main_view_model.dart';
import '../../viewmodels/user_view_model.dart';
import '../../views/widgets/category_picker.dart';
import '../../views/widgets/logged_in_menu.dart';
import '../../views/widgets/logged_out_menu.dart';
import '../../views/widgets/notification_overlay.dart';
import '../../views/widgets/text_font_widget.dart';
import '../../views/widgets/circle_list.dart';
import '../../views/widgets/app_bar.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  bool isAllSelected = true;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<NotificationOverlayState> _notificationOverlayKey =
      GlobalKey<NotificationOverlayState>();
  OverlayEntry? _overlayEntry;

  List<CategoryData> selectedCategories = [];

  @override
  void initState() {
    // 알림 클릭시
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
    super.initState();
    _checkAndShowNoticeDialog();
  }

  void _handleMessage(RemoteMessage message) {
    // 내가 지정한 그 알람이면 지정한 화면으로 이동
    logger.d('_handleMessage');
    logger.d(message.notification?.title);
    logger.d(message.notification?.body);

    ref
        .read(firebaseCloudMessagingViewModelProvider.notifier)
        .addNotification(message.notification?.body ?? '');
  }

  Future<void> _checkAndShowNoticeDialog() async {
    final prefs = await SharedPreferences.getInstance();
    final dontShowAgain = prefs.getBool('notice_dont_show_again') ?? false;

    if (!dontShowAgain && mounted) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showNoticeDialog();
      });
    }
  }

  void _showNoticeDialog() {
    DialogManager.instance.showAlertDialog(
      context: context,
      title: '안내',
      content:
          '이전에 기존회원 가입을 하신 분들 중\n아이디/비밀번호 찾기 이후에도 로그인이 안 되시는 분들은\n[신규 회원가입] 후 자신이 속한 동아리에 지원해주세요.\n자세한 내용은 <공지사항>을 확인해 주세요.',
      leftButtonText: '더 이상 보지 않기',
      leftButtonTextStyle: TextFontWidget.fontRegularStyle(
        color: const Color(0xffA8A8A8),
        fontWeight: FontWeight.w700,
        fontSize: 16,
      ),
      rightButtonText: '확인',
      rightButtonTextStyle: TextFontWidget.fontRegularStyle(
        color: const Color(0xff0085FF),
        fontWeight: FontWeight.w800,
        fontSize: 16,
      ),
      onLeftButtonPressed: () async {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('notice_dont_show_again', true);
      },
      onRightButtonPressed: () async {},
      barrierDismissible: true,
    );
  }

  void _showOverlay(BuildContext context) {
    if (_overlayEntry == null) {
      _overlayEntry = OverlayEntry(
        builder: (context) => NotificationOverlay(
          key: _notificationOverlayKey,
          onDismiss: () {
            _overlayEntry?.remove();
            _overlayEntry = null;
          },
        ),
      );
      Overlay.of(context).insert(_overlayEntry!);
    } else {
      _notificationOverlayKey.currentState?.updateList();
    }
  }

// dart
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

    ref.listen(abnormalAccessNotifierProvider, (previous, next) {
      logger.d(next);
      DialogManager.instance.showAlertDialog(
        context: context,
        content: '알 수 없는 오류가 발생했어요.\n문제가 계속될 시, 관리자에게 문의해 주세요.',
        barrierDismissible: false,
        onLeftButtonPressed: () {
          context.go('/');
        },
      );
    });

    ref.listen(networkConnectivityProvider, (previous, next) async {
      logger.d(next);
      if (next == false) {
        DialogManager.instance.showAlertDialog(
          context: context,
          content: '네트워크에 연결되지 않았습니다.\nWi-Fi 또는 데이터를 연결해 주세요.',
          barrierDismissible: false,
          canPop: false,
          onPopInvoked: () async {
            SystemNavigator.pop();
          },
          onLeftButtonPressed: () async {
            await ref.read(networkConnectivityProvider.notifier).checkNetwork();
          },
        );
      } else if (next == true) {
        DialogManager.instance.dismissDialog(context);
        await fetchCircleList();
      }
    });

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xffF0F2F5),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
          icon: const Icon(Icons.menu, color: Color(0xff717171), size: 24),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/dongurami.png', width: 19, height: 19),
            const SizedBox(width: 8),
            TextFontWidget.jalnan2(
              '동구라미',
              fontSize: 16,
              color: const Color(0xffFFC01D),
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () => _showOverlay(context),
            icon: const Icon(MainIcons.ic_bell,
                size: 18, color: Color(0xFF717171)),
          ),
        ],
      ),
      drawer: userState.state.isAuthorized
          ? LoggedInMenu(state: userState.state)
          : const LoggedOutMenu(),
      body: Column(
        children: [
          const SizedBox(height: 1),
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      DecoratedBox(
                        decoration: isAllSelected
                            ? const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.black)),
                              )
                            : const BoxDecoration(),
                        child: TextButton(
                          onPressed: () async {
                            if (isAllSelected) return;
                            setState(() => isAllSelected = true);
                            await fetchCircleList();
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: const Color(0xffffB052),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero),
                          ),
                          child: TextFontWidget.fontRegular(
                            '전체',
                            fontSize: 16,
                            color: isAllSelected
                                ? Colors.black
                                : const Color(0xffA8A8A8),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      DecoratedBox(
                        decoration: !isAllSelected
                            ? const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.black)),
                              )
                            : const BoxDecoration(),
                        child: TextButton(
                          onPressed: () async {
                            if (!isAllSelected) return;
                            setState(() => isAllSelected = false);
                            await fetchCircleList();
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: const Color(0xffffB052),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero),
                          ),
                          child: TextFontWidget.fontRegular(
                            '모집 중',
                            fontSize: 16,
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
                      final result =
                          await showModalBottomSheet<List<CategoryData>>(
                        context: context,
                        useRootNavigator: false,
                        isScrollControlled: true,
                        builder: (ctx) {
                          return CategoryPicker(
                            initialCategories: selectedCategories,
                            onSelectionChanged: (newSelection) {
                              // Firebase Analytics: 필터 선택
                              final userState =
                                  ref.read(userViewModelProvider).state;
                              analytics.logEvent(
                                name: AnalyticsEvent.filterSelect,
                                parameters: {
                                  AnalyticsParam.filterCategories: newSelection
                                      .map((c) => c.clubCategoryName)
                                      .join(','),
                                  'category_count': newSelection.length,
                                  AnalyticsParam.studentNumber:
                                      userState.studentNumber ?? '',
                                  AnalyticsParam.userName:
                                      userState.userName ?? '',
                                  AnalyticsParam.major: userState.major ?? '',
                                  AnalyticsParam.userHp: userState.userHp ?? '',
                                  AnalyticsParam.timestamp:
                                      DateTime.now().toIso8601String(),
                                },
                              );

                              setState(() => selectedCategories = newSelection);
                              fetchCircleList();
                            },
                          );
                        },
                      );
                      if (result != null) {
                        setState(() => selectedCategories = result);
                        await fetchCircleList();
                      }
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: selectedCategories.isEmpty
                          ? Colors.white
                          : const Color(0xFFFFB052),
                      foregroundColor: selectedCategories.isEmpty
                          ? const Color(0xFFFFB052)
                          : Colors.white,
                      minimumSize: Size.zero,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 12),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      side: BorderSide(
                        color: selectedCategories.isEmpty
                            ? const Color(0xFF959595)
                            : const Color(0xFFFF9A21),
                      ),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          MainIcons.ic_filter,
                          size: 18,
                          color: selectedCategories.isEmpty
                              ? const Color(0xffa8a8a8)
                              : Colors.white,
                        ),
                        const SizedBox(width: 4),
                        TextFontWidget.fontRegular(
                          '필터',
                          fontWeight: FontWeight.w500,
                          color: selectedCategories.isEmpty
                              ? const Color(0xffa8a8a8)
                              : Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 1),
          ...selectedCategories.isEmpty
              ? []
              : [
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.only(left: 24),
                    height: 60,
                    alignment: Alignment.centerLeft,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Wrap(
                        spacing: 10,
                        children: selectedCategories.map((category) {
                          return _buildChip(category);
                        }).toList(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
          Expanded(
            child: circleListState.when<Widget>(
              data: (circleList) {
                return circleList.data.isNotEmpty
                    ? CircleList(
                        state: circleListState.value as CircleListModel,
                        onItemClicked: (clubUUID) {
                          // Firebase Analytics: 동아리 클릭
                          final userState =
                              ref.read(userViewModelProvider).state;
                          analytics.logEvent(
                            name: AnalyticsEvent.clubClick,
                            parameters: {
                              AnalyticsParam.clubUUID: clubUUID,
                              AnalyticsParam.studentNumber:
                                  userState.studentNumber ?? '',
                              AnalyticsParam.userName: userState.userName ?? '',
                              AnalyticsParam.major: userState.major ?? '',
                              AnalyticsParam.userHp: userState.userHp ?? '',
                              AnalyticsParam.timestamp:
                                  DateTime.now().toIso8601String(),
                            },
                          );

                          context.go('/circle?clubUUID=$clubUUID');
                        },
                      )
                    : Center(
                        child: TextFontWidget.fontRegular(
                          '동아리가 없습니다',
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      );
              },
              error: (error, stackTrace) {
                final errorModel = error as GlobalException;
                return Center(
                  child: TextFontWidget.fontRegular(
                    ErrorUtil.instance.getErrorMessage(errorModel.code) ??
                        '동아리 목록을 불러오지 못했어요.\n잠시 후 다시 시도해주세요.',
                    textAlign: TextAlign.center,
                    fontSize: 14,
                    color: const Color(0xFFA1A1A1),
                    fontWeight: FontWeight.w400,
                  ),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChip(CategoryData category) {
    return Chip(
      labelPadding: EdgeInsets.only(left: 10),
      label: Text(category.clubCategoryName),
      deleteIcon: Icon(Icons.close, size: 16),
      onDeleted: () async {
        setState(() {
          selectedCategories.remove(category);
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
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      padding: EdgeInsets.all(0),
    );
  }

  Future<void> fetchCircleList() async {
    if (selectedCategories.isEmpty) {
      if (isAllSelected) {
        await ref.read(circleViewModelProvider.notifier).fetchAllCircleList();
      } else {
        await ref.read(circleViewModelProvider.notifier).fetchOpenCircleList();
      }
    } else {
      final selectedCategoryUUIDs = selectedCategories
          .map((category) => category.clubCategoryUUID)
          .toList();
      if (isAllSelected) {
        await ref
            .read(circleViewModelProvider.notifier)
            .fetchAllFilteredCircleList(selectedCategoryUUIDs);
      } else {
        await ref
            .read(circleViewModelProvider.notifier)
            .fetchOpenFilteredCircleList(selectedCategoryUUIDs);
      }
    }
  }
}
