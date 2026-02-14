import 'package:flutter/material.dart' hide Badge;
import 'package:flutter_html/flutter_html.dart';
import "package:carousel_slider/carousel_slider.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../common/scroll_behavior.dart';
import '../../const/data.dart';
import '../../models/enums/recruitment_status.dart';
import '../../viewmodels/circle_view_model.dart';
import '../../widgets/circle_info_tile/circle_info_tile.dart';
import '../../widgets/detail_app_bar/detail_app_bar.dart';
import '../../widgets/text_font_widget/text_font_widget.dart';
import '../screens/image_screen.dart';
import '../../utils/dialog_manager.dart';

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
  TabController? _tabController;
  int _currentTabCount = 0;
  int selectedIndex = 0;

  TabController get tabController => _tabController!;

  void _initOrUpdateTabController(int tabCount) {
    if (_currentTabCount == tabCount && _tabController != null) return;
    _tabController?.removeListener(_onTabChanged);
    _tabController?.dispose();
    _currentTabCount = tabCount;
    selectedIndex = 0;
    _tabController = TabController(length: tabCount, vsync: this);
    _tabController!.addListener(_onTabChanged);
  }

  void _onTabChanged() {
    setState(() {
      selectedIndex = _tabController!.index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _tabController?.removeListener(_onTabChanged);
    _tabController?.dispose();
    _outerScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(clubIntroViewModelProvider(widget.clubUUID)
        .select((state) => state.isLoading));
    ref.listen(
        clubIntroViewModelProvider(widget.clubUUID)
            .select((state) => state.canApply), (previous, next) {
      if (next == null) {
      } else if (next) {
        context.go('/circle/application_writing?clubUUID=${widget.clubUUID}');
      } else {
        DialogManager.instance.showAlertDialog(
          context: context,
          content: '지원 가능한 동아리가 아닙니다.',
        );
      }
    });
    final circleDetail = ref.watch(clubIntroViewModelProvider(widget.clubUUID)
        .select((state) => state.circleDetail));
    // recruitmentStatus에 따라 TabController 동적 설정
    if (circleDetail != null) {
      final tabCount = circleDetail.recruitmentStatus == RecruitmentStatus.open ? 2 : 1;
      _initOrUpdateTabController(tabCount);
    }
    ref.listen(
        clubIntroViewModelProvider(widget.clubUUID)
            .select((state) => state.error), (prev, next) {
      if (next != null) {
        DialogManager.instance.showAlertDialog(
          context: context,
          content: next,
        );
      }
    });
    return Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        resizeToAvoidBottomInset: false,
        appBar: DetailAppBar(
          title: '동아리 소개',
          onBackPressed: () => context.go('/'),
        ),
        bottomNavigationBar: circleDetail == null
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
                    final isClosed = circleDetail.recruitmentStatus == RecruitmentStatus.close;
                    return OutlinedButton(
                      onPressed: isClosed
                          ? null
                          : () async {
                              await ref
                                  .read(clubIntroViewModelProvider(
                                          widget.clubUUID)
                                      .notifier)
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
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : circleDetail == null
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
                                      final introPhotos = circleDetail
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
                                  CircleInfoTile(
                                    clubUUID: widget.clubUUID,
                                    name: circleDetail.circleName,
                                    leaderName: circleDetail.leaderName,
                                    imageUrl: circleDetail.mainPhotoPath,
                                    hashtags: circleDetail.circleHashtag,
                                    circleRoom: circleDetail.circleRoom,
                                    leaderHp: circleDetail.leaderHp,
                                    clubInsta: circleDetail.circleInsta,
                                    showMoreMenu: true,
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
                                    if (circleDetail.recruitmentStatus ==
                                        RecruitmentStatus.open)
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
                                child: circleDetail.introContent == null ||
                                        circleDetail.introContent!.isEmpty
                                    ? Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(32.0),
                                          child: TextFontWidget.fontRegular(
                                            '소개글이 등록되지 않았습니다.',
                                            textAlign: TextAlign.center,
                                            fontSize: 14,
                                            color: const Color(0xFFA1A1A1),
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      )
                                    : Html(
                                        data: circleDetail.introContent!,
                                      ),
                              ),
                            ),
                            if (circleDetail.recruitmentStatus == RecruitmentStatus.open)
                              SingleChildScrollView(
                                child: Container(
                                  alignment: Alignment.topLeft,
                                  padding:
                                      const EdgeInsets.fromLTRB(24, 24, 24, 0),
                                  child: Html(
                                    data: circleDetail.clubRecruitment ?? '',
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ));
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
