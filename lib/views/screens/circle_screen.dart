import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import "package:carousel_slider/carousel_slider.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:usw_circle_link/common/scroll_behavior.dart';
import 'package:usw_circle_link/const/data.dart';
import 'package:usw_circle_link/models/application_model.dart';
import 'package:usw_circle_link/utils/dialog_manager.dart';
import 'package:usw_circle_link/utils/error_util.dart';
import 'package:usw_circle_link/utils/extensions.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';
import 'package:usw_circle_link/viewmodels/application_view_model.dart';
import 'package:usw_circle_link/viewmodels/circle_view_model.dart';
import 'package:usw_circle_link/views/widgets/circle_detail_overlay.dart';
import 'package:usw_circle_link/views/widgets/text_font_widget.dart';
import 'package:usw_circle_link/views/screens/image_screen.dart';

class CircleScreen extends ConsumerStatefulWidget {
  final String clubUUID;

  const CircleScreen({required this.clubUUID, super.key});

  @override
  ConsumerState<CircleScreen> createState() => _CircleScreenState();
}

class _CircleScreenState extends ConsumerState<CircleScreen>
    with TickerProviderStateMixin {
  final ScrollController _outerScrollController = ScrollController();

  int activeIndex = 0;
  final GlobalKey _iconKey = GlobalKey();
  OverlayEntry? _overlayEntry;
  late TabController tabController;
  int selectedIndex = 0;

  // 추가: 버튼-오버레이 고정을 위한 링크와 정렬 플래그
  final LayerLink _link = LayerLink();
  bool _alignRight = false;

  void _showOverlay(String? circleRoom, String? leaderHp, String? clubInsta) {
    if (_overlayEntry != null) return;

    // 우측 여백 부족 시 오른쪽 정렬 판단
    const double overlayWidth = 195;
    final box = _iconKey.currentContext?.findRenderObject() as RenderBox?;
    if (box != null) {
      final screenWidth = MediaQuery.of(context).size.width;
      final offset = box.localToGlobal(Offset.zero);
      final spaceRight = screenWidth - (offset.dx + box.size.width);
      _alignRight = spaceRight < overlayWidth;
    } else {
      _alignRight = false;
    }

    _overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          // 바깥 클릭 시 닫기
          Positioned.fill(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: _removeOverlay,
              child: const SizedBox.shrink(),
            ),
          ),
          CompositedTransformFollower(
            link: _link,
            showWhenUnlinked: false,
            targetAnchor:
                _alignRight ? Alignment.bottomRight : Alignment.bottomLeft,
            followerAnchor:
                _alignRight ? Alignment.topRight : Alignment.topLeft,
            offset: const Offset(0, 8),
            // 버튼과 간격
            child: Material(
              color: Colors.transparent,
              child: CircleDetailOverlay(
                width: overlayWidth,
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

    // 루트 오버레이에 삽입(스크롤/리사이즈에도 고정)
    Overlay.of(context, rootOverlay: true).insert(_overlayEntry!);
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
    _outerScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final clubIntroState =
        ref.watch(clubIntroViewModelProvider(widget.clubUUID));
    ref.listen(clubIntroViewModelProvider(widget.clubUUID), (previous, next) {
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
              context.go(
                  '/circle/application_writing?clubUUID=${widget.clubUUID}');
              break;
            default:
          }
        },
        error: (error, stackTrace) {
          error = error as ApplicationModelError;
          switch (error.type) {
            case ApplicationModelType.checkAvailableForApplication:
              DialogManager.instance.showAlertDialog(
                  context: context,
                  content: ErrorUtil.instance.getErrorMessage(error.code) ??
                      "동아리 지원 중 문제가 발생했습니다.\n잠시 후 다시 시도해주세요.",
                  onLeftButtonPressed: () {
                    if ((error as ApplicationModelError).code == "USR-F401") {
                      context.go('/login');
                    }
                  });
            default:
          }
        },
        loading: () {},
      );
    });
    return Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          toolbarHeight: 62,
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: const Color(0xffFFFFFF),
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 52.0,
                  height: 52.0,
                  child: IconButton(
                    onPressed: () {
                      context.go('/');
                    },
                    icon: SvgPicture.asset(
                      'assets/images/ic_back_arrow.svg',
                    ),
                  ),
                ),
                TextFontWidget.fontRegular(
                  '동아리 소개',
                  fontSize: 18.0,
                  color: const Color(0xFF111111),
                  fontWeight: FontWeight.w800,
                ),
                const SizedBox(width: 52.0, height: 52.0)
              ],
            ),
          ),
        ),
        bottomNavigationBar: !clubIntroState.hasValue
            ? SizedBox.shrink()
            : Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
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
                height: 100,
                alignment: Alignment.center,
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
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
                                      clubUUID: widget.clubUUID);
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
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: TextFontWidget.fontRegular(
                        isClosed ? '모집마감' : '지원하기',
                        fontSize: 18,
                        color: const Color(0xFFFFFFFF),
                        fontWeight: FontWeight.w800,
                      ),
                    );
                  }),
                ),
              ),
        body: clubIntroState.isLoading || applicationState.isLoading
            ? const Center(child: CircularProgressIndicator())
            : clubIntroState.hasError
                ? Center(
                    child: TextFontWidget.fontRegular(
                      '동아리 정보를 불러오지 못했어요.\n잠시 후 다시 시도해주세요.',
                      textAlign: TextAlign.center,
                      fontSize: 14,
                      color: const Color(0xFFA1A1A1),
                      fontWeight: FontWeight.w400,
                    ),
                  )
                : ScrollConfiguration(
                    behavior: MyScrollBehavior(), // 마우스/트랙패드 드래그 허용
                    child: Scrollbar(
                      controller: _outerScrollController,
                      thumbVisibility: false,
                      trackVisibility: false,
                      child: NestedScrollView(
                        controller: _outerScrollController,
                        headerSliverBuilder: (context, innerBoxScrolled) {
                          return [
                            SliverList(
                              delegate: SliverChildListDelegate(
                                [
                                  SizedBox(
                                    height: 250,
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
                                                  itemBuilder: (context, index,
                                                      realIndex) {
                                                    return buildImage(
                                                        introPhotos, index);
                                                  },
                                                  options: CarouselOptions(
                                                    height: 250,
                                                    viewportFraction: 1,
                                                    onPageChanged:
                                                        (index, reason) =>
                                                            setState(() =>
                                                                activeIndex =
                                                                    index),
                                                  ),
                                                ),
                                                Positioned(
                                                  bottom: 7,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: List.generate(
                                                        introPhotos.length,
                                                        (index) {
                                                      return Container(
                                                        width: 7,
                                                        height: 7,
                                                        margin: index !=
                                                                introPhotos
                                                                    .length
                                                            ? const EdgeInsets
                                                                .only(right: 4)
                                                            : null,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: index ==
                                                                  activeIndex
                                                              ? accentColor
                                                              : const Color(
                                                                  0xFFD9D9D9),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100),
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
                                  const SizedBox(height: 16),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(width: 24),
                                      Container(
                                        width: 82,
                                        height: 82,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color(0xffc4c4c4)),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Hero(
                                          transitionOnUserGestures: true,
                                          tag: 'circle_${widget.clubUUID}',
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            child: clubIntroState.value!
                                                            .mainPhotoPath !=
                                                        null &&
                                                    clubIntroState
                                                        .value!
                                                        .mainPhotoPath!
                                                        .isValidUrl
                                                ? Image.network(
                                                    clubIntroState
                                                        .value!.mainPhotoPath!,
                                                    fit: BoxFit.cover,
                                                    errorBuilder:
                                                        (BuildContext context,
                                                            Object exception,
                                                            StackTrace?
                                                                stackTrace) {
                                                      return Container(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Image.asset(
                                                          'assets/images/circle_default_image.png',
                                                          fit: BoxFit.cover,
                                                        ),
                                                      );
                                                    },
                                                  )
                                                : Image.asset(
                                                    'assets/images/circle_default_image.png'),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 8),
                                            TextFontWidget.fontRegular(
                                              clubIntroState.value!.circleName,
                                              overflow: TextOverflow.ellipsis,
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w900,
                                              height: 1,
                                              letterSpacing: -0.45,
                                            ),
                                            const SizedBox(height: 5),
                                            RichText(
                                              overflow: TextOverflow.ellipsis,
                                              text: TextSpan(
                                                text: '동아리 회장 ',
                                                style: TextFontWidget
                                                    .fontRegularStyle(
                                                  color:
                                                      const Color(0xFF767676),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1,
                                                  letterSpacing: -0.35,
                                                ),
                                                children: [
                                                  TextSpan(
                                                    text: clubIntroState
                                                        .value!.leaderName,
                                                    style: const TextStyle(
                                                      color: Color(0xFF353549),
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      fontSize: 14,
                                                      height: 1,
                                                      letterSpacing: -0.35,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 8),
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
                                                const SizedBox.shrink(),
                                          ],
                                        ),
                                      ),
                                      CompositedTransformTarget(
                                        link: _link,
                                        child: Container(
                                          alignment: Alignment.topCenter,
                                          child: IconButton(
                                            padding: EdgeInsets.zero,
                                            constraints: const BoxConstraints(),
                                            visualDensity:
                                                VisualDensity.compact,
                                            key: _iconKey,
                                            onPressed: () {
                                              if (_overlayEntry == null) {
                                                _showOverlay(
                                                  clubIntroState
                                                      .value!.circleRoom,
                                                  clubIntroState
                                                      .value!.leaderHp,
                                                  clubIntroState
                                                      .value!.circleInsta,
                                                );
                                              } else {
                                                _removeOverlay();
                                              }
                                            },
                                            icon: const Icon(Icons.more_vert),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                ],
                              ),
                            ),
                            SliverPersistentHeader(
                              delegate: _SliverAppBarDelegate(
                                TabBar(
                                  controller: tabController,
                                  labelPadding: EdgeInsets.zero,
                                  labelColor: const Color(0xFFFFFFFF),
                                  unselectedLabelColor: const Color(0xFFCECECE),
                                  indicator: const BoxDecoration(),
                                  tabs: [
                                    Tab(
                                      child: SizedBox.expand(
                                        child: Container(
                                          alignment: Alignment.center,
                                          color: selectedIndex == 0
                                              ? const Color(0xFFFFB052)
                                              : const Color(0xFFEBEBEB),
                                          child: TextFontWidget.fontRegular(
                                              '동아리 소개 글'),
                                        ),
                                      ),
                                    ),
                                    if (clubIntroState
                                            .value!.recruitmentStatus ==
                                        "OPEN")
                                      Tab(
                                        child: SizedBox.expand(
                                          child: Container(
                                            alignment: Alignment.center,
                                            color: selectedIndex == 1
                                                ? const Color(0xFFFFB052)
                                                : const Color(0xFFEBEBEB),
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
                            SingleChildScrollView(
                              child: Container(
                                alignment: Alignment.topLeft,
                                padding:
                                    const EdgeInsets.fromLTRB(24, 24, 24, 0),
                                child: Html(
                                  data: clubIntroState.value!.introContent,
                                ),
                              ),
                            ),
                            if (clubIntroState.value!.recruitmentStatus ==
                                "OPEN")
                              SingleChildScrollView(
                                child: Container(
                                  alignment: Alignment.topLeft,
                                  padding:
                                      const EdgeInsets.fromLTRB(24, 24, 24, 0),
                                  child: Html(
                                    data:
                                        clubIntroState.value!.clubRecruitment ??
                                            '',
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ));
  }

  Widget _buildChip(String label) {
    return Container(
      margin: EdgeInsets.only(right: 8),
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
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        padding: EdgeInsets.zero,
      ),
    );
  }

  Widget buildImage(List<String> introPhotos, int index) => GestureDetector(
        onTap: () {
          openImageViewer(context, introPhotos, index);
        },
        child: Container(
          color: Colors.grey,
          child: Hero(
            tag: introPhotos[index],
            child: Image.network(
              introPhotos[index],
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Center(
                    child: TextFontWidget.fontRegular('이미지 준비중 ...',
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w800));
              },
            ),
          ),
        ),
      );

  void openImageViewer(
      BuildContext context, List<String> galleryItems, final int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImageScreen(
          galleryItems: galleryItems,
          backgroundDecoration: const BoxDecoration(
            color: Colors.black,
          ),
          initialIndex: index,
        ),
      ),
    );
  }
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
