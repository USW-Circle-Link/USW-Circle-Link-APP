import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart' hide AppBar;
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:usw_circle_link/widgets/category_filter_button/category_filter_button_styles.dart';
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
import '../../widgets/category_picker/category_picker.dart';
import '../../widgets/drawer_menu/drawer_menu.dart';
import '../../widgets/notification_popover/notification_popover.dart';
import '../../widgets/popover/popover.dart';
import '../../widgets/popover/popover_controller.dart';
import '../../widgets/popover/popover_styles.dart';
import '../../widgets/text_font_widget/text_font_widget.dart';
import '../../widgets/circle_list/circle_list.dart';
import '../../widgets/app_bar/app_bar.dart';
import '../../widgets/filter_tab_bar/filter_tab_bar.dart';
import '../../widgets/category_filter_button/category_filter_button.dart';
import '../../widgets/selected_category_chip_list/selected_category_chip_list.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  bool isAllSelected = true;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final PopoverController _notificationController = PopoverController();

  List<CategoryData> selectedCategories = [];

  @override
  void initState() {
    // 알림 클릭시 (백그라운드 → 포그라운드)
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
    super.initState();
    _checkAndShowNoticeDialog();
    // 앱 완전 종료 상태에서 알림 탭으로 열었을 때 (Cold start)
    _checkInitialMessage();
  }

  Future<void> _checkInitialMessage() async {
    final initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }
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

  @override
  void dispose() {
    _notificationController.dispose();
    super.dispose();
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
        // DialogManager.instance.showAlertDialog(
        //   context: context,
        //   content: '네트워크에 연결되지 않았습니다.\nWi-Fi 또는 데이터를 연결해 주세요.',
        //   barrierDismissible: false,
        //   canPop: false,
        //   onPopInvoked: () async {
        //     SystemNavigator.pop();
        //   },
        //   onLeftButtonPressed: () async {
        //     await ref.read(networkConnectivityProvider.notifier).checkNetwork();
        //   },
        // );
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
          Popover(
            controller: _notificationController,
            childAnchor: PopoverAnchor.bottomRight,
            popoverAnchor: PopoverAnchor.topRight,
            style: PopoverStyle.defaultStyle.copyWith(
              borderRadius: 12,
            ),
            popoverBuilder: (context, controller) =>
                const NotificationPopoverContent(),
            child: IconButton(
              onPressed: () => _notificationController.toggle(),
              icon: const Icon(MainIcons.ic_bell,
                  size: 18, color: Color(0xFF717171)),
            ),
          ),
        ],
      ),
      drawer: DrawerMenu(
        userState: userState.state.isAuthorized ? userState.state : null,
      ),
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
                  FilterTabBar(
                    isAllSelected: isAllSelected,
                    onAllSelected: () async {
                      if (isAllSelected) return;
                      setState(() => isAllSelected = true);
                      await fetchCircleList();
                    },
                    onRecruitingSelected: () async {
                      if (!isAllSelected) return;
                      setState(() => isAllSelected = false);
                      await fetchCircleList();
                    },
                  ),
                  CategoryFilterButton(
                    selectedCategories: selectedCategories,
                    onPressed: _showCategoryPicker,
                    style: CategoryFilterButtonStyle.defaultStyle.copyWith(
                      height: 32,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 1),
          if (selectedCategories.isNotEmpty) ...[
            SelectedCategoryChipList(
              selectedCategories: selectedCategories,
              onChipDeleted: (category) async {
                setState(() {
                  selectedCategories.remove(category);
                });
                await fetchCircleList();
              },
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

  Future<void> _showCategoryPicker() async {
    await showModalBottomSheet<List<CategoryData>>(
      context: context,
      useRootNavigator: false,
      isScrollControlled: true,
      builder: (ctx) {
        return CategoryPicker(
          initialCategories: selectedCategories,
          onSelectionChanged: (newSelection) {
            // Firebase Analytics: 필터 선택
            final userState = ref.read(userViewModelProvider).state;
            analytics.logEvent(
              name: AnalyticsEvent.filterSelect,
              parameters: {
                AnalyticsParam.filterCategories:
                    newSelection.map((c) => c.clubCategoryName).join(','),
                'category_count': newSelection.length,
                AnalyticsParam.studentNumber: userState.studentNumber ?? '',
                AnalyticsParam.userName: userState.userName ?? '',
                AnalyticsParam.major: userState.major ?? '',
                AnalyticsParam.userHp: userState.userHp ?? '',
                AnalyticsParam.timestamp: DateTime.now().toIso8601String(),
              },
            );

            setState(() => selectedCategories = newSelection);
            fetchCircleList();
          },
        );
      },
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
