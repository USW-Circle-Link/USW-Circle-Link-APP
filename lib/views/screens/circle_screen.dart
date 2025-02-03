import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import "package:carousel_slider/carousel_slider.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:usw_circle_link/const/data.dart';
import 'package:usw_circle_link/models/application_model.dart';
import 'package:usw_circle_link/utils/dialog_manager.dart';
import 'package:usw_circle_link/utils/extensions.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';
import 'package:usw_circle_link/viewmodels/application_view_model.dart';
import 'package:usw_circle_link/viewmodels/circle_view_model.dart';
import 'package:usw_circle_link/views/widgets/circle_detail_overlay.dart';
import 'package:usw_circle_link/views/widgets/text_font_widget.dart';

class CircleScreen extends ConsumerStatefulWidget {
  final int clubId;

  const CircleScreen({required this.clubId, super.key});

  @override
  ConsumerState<CircleScreen> createState() => _CircleScreenState();
}

class _CircleScreenState extends ConsumerState<CircleScreen>
    with TickerProviderStateMixin {
  int activeIndex = 0;
  final GlobalKey _iconKey = GlobalKey();
  OverlayEntry? _overlayEntry;
  late TabController tabController;
  int selectedIndex = 0;

  void _showOverlay(String? circleRoom, String? leaderHp, String? clubInsta) {
    final RenderBox renderBox =
        _iconKey.currentContext!.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);
    final Size size = renderBox.size;
    final double width = 195.w;

    _overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          GestureDetector(
            onTap: _removeOverlay,
            child: Container(
              color: Colors.transparent,
            ),
          ),
          Positioned(
            top: offset.dy + size.height,
            left: offset.dx + size.width / 2 - width,
            child: Material(
              color: Colors.transparent,
              child: CircleDetailOverlay(
                width: width,
                circleRoom: circleRoom,
                leaderHp: leaderHp,
                clubInsta: clubInsta,
                onClose: _removeOverlay,
              ),
            ),
          ),
        ],
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      setState(() {
        selectedIndex = tabController.index;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    _removeOverlay();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final clubIntroState = ref.watch(clubIntroViewModelProvider(widget.clubId));
    ref.listen(clubIntroViewModelProvider(widget.clubId), (previous, next) {
      logger.d(next);
    });
    final applicationState = ref.watch(applicationViewModelProvider);
    ref.listen(applicationViewModelProvider, (previous, next) {
      logger.d(next);
      next.when(
        data: (data) {
          switch (data?.type) {
            case ApplicationModelType.getApplication:
              break;
            case ApplicationModelType.apply:
              break;
            case ApplicationModelType.checkAvailableForApplication:
              context.go('/circle/application_writing?clubId=${widget.clubId}');
              break;
            default:
          }
        },
        error: (error, stackTrace) {
          error = error as ApplicationModelError;
          switch (error.type) {
            case ApplicationModelType.checkAvailableForApplication:
              switch (error.code) {
                case "USR-F401":
                  DialogManager.instance.showAlertDialog(
                      context: context,
                      content: '로그인 후 이용해 주시기 바랍니다!',
                      onLeftButtonPressed: () => context.go('/login'));
                  break;
                default:
                  DialogManager.instance.showAlertDialog(
                      context: context, content: '이미 지원한 동아리 또는 소속된 동아리입니다!');
              }
              break;
            default:
          }
        },
        loading: () {},
      );
    });
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(62.h),
          child: AppBar(
            scrolledUnderElevation: 0,
            toolbarHeight: 62.h,
            centerTitle: true,
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: SizedBox(
              width: 375.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: SvgPicture.asset(
                      'assets/images/back.svg',
                      height: 36.h,
                      width: 36.w,
                    ),
                  ),
                  SizedBox(width: 78.2.w),
                  TextFontWidget.fontRegular(
                    '동아리 소개',
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w800,
                    height: 1.111.h,
                    letterSpacing: -0.45.sp,
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: !clubIntroState.hasValue
            ? SizedBox.shrink()
            : Container(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                decoration: BoxDecoration(
                  color: const Color(0xffFFFFFF),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                height: 100.h,
                alignment: Alignment.center,
                child: SizedBox(
                  width: double.infinity,
                  height: 56.h,
                  child: Builder(builder: (context) {
                    final isClosed =
                        clubIntroState.value!.recruitmentStatus == "CLOSE";
                    return OutlinedButton(
                      onPressed: isClosed
                          ? null
                          : () async {
                              await ref
                                  .read(applicationViewModelProvider.notifier)
                                  .checkAvailableForApplication(
                                      clubId: widget.clubId);
                            },
                      style: OutlinedButton.styleFrom(
                        backgroundColor:
                            isClosed ? Colors.grey : Color(0xffffB052),
                        foregroundColor: const Color(0xFFFFFFFF),
                        side: const BorderSide(
                          color: Colors.transparent,
                          width: 0.0,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                      ),
                      child: TextFontWidget.fontRegular(
                        isClosed ? '모집마감' : '지원하기',
                        fontSize: 18.sp,
                        color: const Color(0xFFFFFFFF),
                        fontWeight: FontWeight.w800,
                      ),
                    );
                  }),
                ),
              ),
        body: clubIntroState.isLoading || applicationState.isLoading
            ? Center(child: CircularProgressIndicator())
            : clubIntroState.hasError
                ? Center(
                    child: TextFontWidget.fontRegular(
                      '동아리 정보를 불러오지 못했습니다.',
                    ),
                  )
                : NestedScrollView(
                    headerSliverBuilder: (context, innerBoxScrolled) {
                      return [
                        SliverList(
                          delegate: SliverChildListDelegate(
                            [
                              SizedBox(
                                height: 250.h,
                                child: Builder(builder: (context) {
                                  final introPhotos = clubIntroState.value!
                                      .getNotEmptyIntroPhotoPath();
                                  return introPhotos != null &&
                                          introPhotos.isNotEmpty
                                      ? Stack(
                                          alignment: Alignment.bottomCenter,
                                          children: [
                                            CarouselSlider.builder(
                                              itemCount: introPhotos.length,
                                              itemBuilder:
                                                  (context, index, realIndex) {
                                                return buildImage(
                                                    introPhotos[index], index);
                                              },
                                              options: CarouselOptions(
                                                height: 250.h,
                                                viewportFraction: 1,
                                                onPageChanged: (index,
                                                        reason) =>
                                                    setState(() =>
                                                        activeIndex = index),
                                              ),
                                            ),
                                            Positioned(
                                              bottom: 7.h,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: List.generate(
                                                    introPhotos.length,
                                                    (index) {
                                                  return Container(
                                                    width: 7.w,
                                                    height: 7.h,
                                                    margin: index !=
                                                            introPhotos.length
                                                        ? EdgeInsets.only(
                                                            right: 4.w)
                                                        : null,
                                                    decoration: BoxDecoration(
                                                      color: index ==
                                                              activeIndex
                                                          ? accentColor
                                                          : Color(0xFFD9D9D9),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100.sp),
                                                    ),
                                                  );
                                                }),
                                              ),
                                            ),
                                          ],
                                        )
                                      : Container(
                                          color: const Color.fromARGB(
                                              255, 36, 36, 36),
                                        );
                                }),
                              ),
                              SizedBox(height: 16.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(width: 24.w),
                                  Container(
                                    width: 82.w,
                                    height: 82.h,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0xffc4c4c4)),
                                      borderRadius: BorderRadius.circular(12.r),
                                    ),
                                    child: Hero(
                                      transitionOnUserGestures: true,
                                      tag: 'circle_${widget.clubId}',
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(12.r),
                                        child: clubIntroState
                                                        .value!.mainPhotoPath !=
                                                    null &&
                                                clubIntroState.value!
                                                    .mainPhotoPath!.isValidUrl
                                            ? Image.network(
                                                clubIntroState
                                                    .value!.mainPhotoPath!,
                                                fit: BoxFit.cover,
                                              )
                                            : Icon(
                                                Icons.person,
                                                color: const Color.fromARGB(
                                                    255, 0, 0, 0),
                                                size: 60,
                                              ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 16.w),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 8.h),
                                        TextFontWidget.fontRegular(
                                          clubIntroState.value!.circleName,
                                          overflow: TextOverflow.ellipsis,
                                          color: Colors.black,
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w900,
                                          height: 1.h,
                                          letterSpacing: -0.45.sp,
                                        ),
                                        SizedBox(height: 5.h),
                                        RichText(
                                          overflow: TextOverflow.ellipsis,
                                          text: TextSpan(
                                            text: '동아리 회장 ',
                                            style:
                                                TextFontWidget.fontRegularStyle(
                                              color: const Color(0xFF767676),
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400,
                                              height: 1.h,
                                              letterSpacing: -0.35.sp,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: clubIntroState
                                                    .value!.leaderName,
                                                style: TextStyle(
                                                  color: Color(0xFF353549),
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 14.sp,
                                                  height: 1.h,
                                                  letterSpacing: -0.35.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 8.h),
                                        clubIntroState.whenOrNull(
                                                data: (data) =>
                                                    SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Row(
                                                        children: data
                                                                .circleHashtag
                                                                ?.map((tag) =>
                                                                    _buildChip(
                                                                        '#$tag'))
                                                                .toList() ??
                                                            [],
                                                      ),
                                                    )) ??
                                            SizedBox.shrink(),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.topCenter,
                                    child: IconButton(
                                      padding: EdgeInsets.zero,
                                      constraints: BoxConstraints(),
                                      visualDensity: VisualDensity.compact,
                                      key: _iconKey,
                                      onPressed: () {
                                        if (_overlayEntry == null) {
                                          _showOverlay(
                                              clubIntroState.value!.circleRoom,
                                              clubIntroState.value!.leaderHp,
                                              clubIntroState
                                                  .value!.circleInsta);
                                        } else {
                                          _removeOverlay();
                                        }
                                      },
                                      icon: Icon(Icons.more_vert),
                                    ),
                                  ),
                                  SizedBox(width: 12.w),
                                ],
                              ),
                              SizedBox(height: 16.h),
                            ],
                          ),
                        ),
                        SliverPersistentHeader(
                          delegate: _SliverAppBarDelegate(
                            TabBar(
                              controller: tabController,
                              labelPadding: EdgeInsets.zero,
                              labelColor: Color(0xFFFFFFFF),
                              unselectedLabelColor: Color(0xFFCECECE),
                              indicator: BoxDecoration(),
                              tabs: [
                                Tab(
                                  child: SizedBox.expand(
                                    child: Container(
                                      alignment: Alignment.center,
                                      color: selectedIndex == 0
                                          ? Color(0xFFFFB052)
                                          : Color(0xFFEBEBEB),
                                      child: TextFontWidget.fontRegular(
                                          '동아리 소개 글'),
                                    ),
                                  ),
                                ),
                                if (clubIntroState.value!.recruitmentStatus ==
                                    "OPEN")
                                  Tab(
                                    child: SizedBox.expand(
                                      child: Container(
                                        alignment: Alignment.center,
                                        color: selectedIndex == 1
                                            ? Color(0xFFFFB052)
                                            : Color(0xFFEBEBEB),
                                        child: TextFontWidget.fontRegular(
                                            '동아리 모집 글'),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          pinned: true,
                        ),
                      ];
                    },
                    body: TabBarView(
                      controller: tabController,
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.fromLTRB(24.sp, 24.sp, 24.sp, 0),
                          child: Html(data: clubIntroState.value!.introContent),
                        ),
                        if (clubIntroState.value!.recruitmentStatus == "OPEN")
                          Container(
                            alignment: Alignment.topLeft,
                            padding:
                                EdgeInsets.fromLTRB(24.sp, 24.sp, 24.sp, 0),
                            child: Html(
                              data: clubIntroState.value!.clubRecruitment,
                            ),
                          ),
                      ],
                    ),
                  ),
      ),
    );
  }

  Widget _buildChip(String label) {
    return Container(
      margin: EdgeInsets.only(right: 8.w),
      child: Chip(
        label: Text(label),
        labelStyle: TextFontWidget.fontRegularStyle(
          color: Color(0xFFFFFFFF),
          fontWeight: FontWeight.w400,
        ),
        visualDensity: VisualDensity(horizontal: 0.0, vertical: -4),
        backgroundColor: Color(0xFFC0C0C0),
        elevation: null,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
        ),
        padding: EdgeInsets.zero,
      ),
    );
  }

  Widget buildImage(String imageUrl, int index) => Container(
        color: Colors.grey,
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Center(
                child: TextFontWidget.fontRegular('이미지 준비중 ...',
                    fontSize: 14.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w800));
          },
        ),
      );
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return true;
  }
}
