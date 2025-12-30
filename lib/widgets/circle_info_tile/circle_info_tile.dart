import 'package:flutter/material.dart' hide Badge;
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:photo_view/photo_view.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:usw_circle_link/utils/extensions.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';
import 'package:usw_circle_link/viewmodels/floor_photo_view_model.dart';
import 'package:usw_circle_link/viewmodels/user_view_model.dart';
import '../badge/badge.dart';
import '../popover/popover.dart';
import '../popover/popover_controller.dart';
import '../popover/popover_menu.dart';
import '../popover/popover_menu_item.dart';
import '../popover/popover_menu_styles.dart';
import '../popover/popover_styles.dart';
import '../text_font_widget/text_font_widget.dart';
import 'circle_info_tile_styles.dart';

/// 동아리 정보 상태
///
/// 지원 상태를 나타내는데 사용됩니다.
enum CircleInfoStatus {
  wait('WAIT', Color(0xffBFBFBF), '대기 중'),
  pass('PASS', Color(0xff8282FF), '합격'),
  fail('FAIL', Color(0xffFF8282), '불합격'),
  undefined('UNDEFINED', Colors.transparent, '');

  final String code;
  final Color color;
  final String text;

  const CircleInfoStatus(this.code, this.color, this.text);

  factory CircleInfoStatus.fromCode(String? code) {
    if (code == null) return CircleInfoStatus.undefined;
    return CircleInfoStatus.values.firstWhere(
      (status) => status.code == code,
      orElse: () => CircleInfoStatus.undefined,
    );
  }
}

/// 동아리 정보 타일 컴포넌트
///
/// 동아리 이미지, 이름, 회장, 해시태그를 표시하는 타일입니다.
/// 나의 소속 동아리, 나의 지원현황, 동아리 상세 화면에서 재사용됩니다.
///
/// ```diagram
/// +------------------------------------------------------------------+
/// | +----------+  [동아리이름]                           [MoreVert]   |
/// | |  Image   |  동아리 회장 [회장이름]                              |
/// | | (67x80)  |  #tag1 #tag2 #tag3                                  |
/// | +----------+                                          +--------+ |
/// |                                                       | [배지] | |
/// +------------------------------------------------------------------+
/// ```
///
/// 사용 예시:
/// ```dart
/// // 기본 사용
/// CircleInfoTile(
///   clubUUID: 'abc123',
///   name: '동아리 이름',
///   leaderName: '홍길동',
///   imageUrl: 'https://...',
///   hashtags: ['체육', '축구'],
///   onTap: () => navigateToDetail(),
/// )
///
/// // 상태 배지 포함
/// CircleInfoTile(
///   clubUUID: 'abc123',
///   name: '동아리 이름',
///   leaderName: '홍길동',
///   status: CircleInfoStatus.pass,
/// )
///
/// // 더보기 메뉴 포함
/// CircleInfoTile(
///   clubUUID: 'abc123',
///   name: '동아리 이름',
///   leaderName: '홍길동',
///   circleRoom: '2층 201호',
///   leaderHp: '010-1234-5678',
///   clubInsta: 'circle_insta',
///   showMoreMenu: true,
/// )
/// ```
class CircleInfoTile extends ConsumerStatefulWidget {
  /// 동아리 UUID
  final String clubUUID;

  /// 동아리 이름
  final String name;

  /// 동아리 이미지 URL
  final String? imageUrl;

  /// 회장 이름
  final String leaderName;

  /// 해시태그 목록
  final List<String>? hashtags;

  /// 지원 상태 (나의 지원현황에서 사용)
  final CircleInfoStatus? status;

  /// 탭 이벤트 콜백
  final VoidCallback? onTap;

  /// 더보기 메뉴 표시 여부
  final bool showMoreMenu;

  /// 동아리실
  final String? circleRoom;

  /// 회장 연락처
  final String? leaderHp;

  /// 인스타그램 ID
  final String? clubInsta;

  /// 스타일
  final CircleInfoTileStyle style;

  const CircleInfoTile({
    super.key,
    required this.clubUUID,
    required this.name,
    required this.leaderName,
    this.imageUrl,
    this.hashtags,
    this.status,
    this.onTap,
    this.showMoreMenu = false,
    this.circleRoom,
    this.leaderHp,
    this.clubInsta,
    this.style = CircleInfoTileStyle.defaultStyle,
  });

  @override
  ConsumerState<CircleInfoTile> createState() => _CircleInfoTileState();
}

class _CircleInfoTileState extends ConsumerState<CircleInfoTile> {
  final PopoverController _popoverController = PopoverController();

  @override
  void dispose() {
    _popoverController.dispose();
    super.dispose();
  }

  /// 층별 배치도 사진을 풀스크린으로 표시
  void _showFullScreenMap(BuildContext context, String floorPhotoPath) {
    _popoverController.hide();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Stack(
          children: [
            Center(
              child: floorPhotoPath.isValidUrl
                  ? GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: PhotoView(
                        imageProvider: NetworkImage(floorPhotoPath),
                        minScale: PhotoViewComputedScale.contained,
                        maxScale: PhotoViewComputedScale.covered * 2.0,
                        backgroundDecoration: const BoxDecoration(
                          color: Colors.black54,
                        ),
                      ),
                    )
                  : const Center(
                      child: Text(
                        '이미지를 불러올 수 없습니다.',
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                    ),
            ),
            Positioned(
              top: 40.0,
              right: 20.0,
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: const CircleAvatar(
                  radius: 20.0,
                  backgroundColor: Colors.black54,
                  child: Icon(Icons.close, color: Colors.white),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  /// 전화번호를 클립보드에 복사
  Future<void> _copyPhoneNumber(String phone) async {
    await Clipboard.setData(ClipboardData(text: phone));
    _popoverController.hide();
    if (mounted) {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(content: Text('전화번호가 복사되었습니다.')),
        );
    }
  }

  /// 인스타그램 링크 열기
  Future<void> _openInstagram(String instaUrl) async {
    _popoverController.hide();
    final Uri launchUri = Uri.parse(instaUrl);
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri, mode: LaunchMode.externalApplication);
    } else {
      logger.d('Could not launch Instagram profile for $instaUrl');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: widget.style.padding,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 동아리 이미지
              _buildImage(),
              SizedBox(width: widget.style.imageContentSpacing),
              // 동아리 정보
              Expanded(child: _buildContent()),
              // 더보기 버튼
              if (widget.showMoreMenu) _buildMoreButton(),
            ],
          ),
        ),
        // 상태 배지
        if (widget.status != null &&
            widget.status != CircleInfoStatus.undefined)
          Positioned(
            bottom: widget.style.padding.vertical / 2,
            right: widget.style.padding.horizontal / 2,
            child: Badge.status(status: _toBadgeStatus(widget.status!)),
          ),
      ],
    );
  }

  Widget _buildImage() {
    return Container(
      width: widget.style.imageWidth,
      height: widget.style.imageHeight,
      decoration: BoxDecoration(
        border: Border.all(color: widget.style.imageBorderColor),
        borderRadius: BorderRadius.circular(widget.style.imageBorderRadius),
      ),
      child: HeroMode(
        enabled: ModalRoute.of(context)?.animation?.status !=
            AnimationStatus.reverse,
        child: Hero(
          tag: 'circle_${widget.clubUUID}',
          child: ClipRRect(
            borderRadius: BorderRadius.circular(widget.style.imageBorderRadius),
            child: widget.imageUrl != null && widget.imageUrl!.isValidUrl
                ? Image.network(
                    widget.imageUrl!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                    errorBuilder: (context, error, stackTrace) =>
                        _buildDefaultImage(),
                  )
                : _buildDefaultImage(),
          ),
        ),
      ),
    );
  }

  Widget _buildDefaultImage() {
    return Image.asset(
      'assets/images/circle_default_image.png',
      fit: BoxFit.cover,
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        // 동아리 이름
        TextFontWidget.fontRegular(
          widget.name,
          overflow: TextOverflow.ellipsis,
          color: widget.style.nameColor,
          fontSize: widget.style.nameFontSize,
          fontWeight: widget.style.nameFontWeight,
          height: 1,
          letterSpacing: -0.45,
        ),
        SizedBox(height: widget.style.nameLeaderSpacing),
        // 회장 정보
        RichText(
          overflow: TextOverflow.ellipsis,
          text: TextSpan(
            text: '동아리 회장 ',
            style: TextFontWidget.fontRegularStyle(
              color: widget.style.leaderLabelColor,
              fontSize: widget.style.leaderLabelFontSize,
              fontWeight: FontWeight.w400,
              height: 1,
              letterSpacing: -0.35,
            ),
            children: [
              TextSpan(
                text: widget.leaderName,
                style: TextStyle(
                  color: widget.style.leaderNameColor,
                  fontWeight: widget.style.leaderNameFontWeight,
                  fontSize: widget.style.leaderLabelFontSize,
                  height: 1,
                  letterSpacing: -0.35,
                ),
              ),
            ],
          ),
        ),
        // 해시태그
        if (widget.hashtags != null && widget.hashtags!.isNotEmpty) ...[
          SizedBox(height: widget.style.leaderHashtagSpacing),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children:
                  widget.hashtags!.map((tag) => _buildHashtag(tag)).toList(),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildHashtag(String tag) {
    return Container(
      margin: EdgeInsets.only(right: widget.style.hashtagSpacing),
      child: Chip(
        label: Text('#$tag'),
        labelStyle: TextFontWidget.fontRegularStyle(
          color: widget.style.hashtagTextColor,
          fontSize: widget.style.hashtagFontSize,
          fontWeight: FontWeight.w400,
        ),
        visualDensity: const VisualDensity(horizontal: 0.0, vertical: -4),
        backgroundColor: widget.style.hashtagBackgroundColor,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.all(
            Radius.circular(widget.style.hashtagBorderRadius),
          ),
        ),
        padding: EdgeInsets.zero,
      ),
    );
  }

  Widget _buildMoreButton() {
    // 모든 정보가 없으면 버튼 숨김
    final hasCircleRoom =
        widget.circleRoom != null && widget.circleRoom!.isNotEmpty;
    final hasLeaderHp =
        widget.leaderHp != null && widget.leaderHp!.isNotEmpty;
    final hasClubInsta =
        widget.clubInsta != null && widget.clubInsta!.isNotEmpty;

    if (!hasCircleRoom && !hasLeaderHp && !hasClubInsta) {
      return const SizedBox.shrink();
    }

    // 동아리방 정보 로드 (circleRoom이 있을 때만)
    final floorPhotoState = hasCircleRoom && widget.circleRoom!.isValidRoomFloor
        ? ref.watch(floorPhotoViewModelProvider(widget.circleRoom!))
        : const AsyncData(null);

    final userState = ref.watch(userViewModelProvider).state;
    final isLoggedIn = userState.isAuthorized;

    return Popover(
      controller: _popoverController,
      childAnchor: PopoverAnchor.bottomRight,
      popoverAnchor: PopoverAnchor.topRight,
      style: PopoverStyle.defaultStyle.copyWith(
        borderRadius: 12,
      ),
      popoverBuilder: (context, controller) => PopoverMenu(
        items: [
          // 동아리방
          if (hasCircleRoom)
            PopoverMenuItem(
              icon: Image.asset(
                'assets/images/map_marker.png',
                width: 16,
                height: 16,
              ),
              label: '동아리방',
              trailing: floorPhotoState.when(
                data: (data) => Text(
                  widget.circleRoom!.isValidRoomFloor
                      ? '학생회관 ${widget.circleRoom}호'
                      : (widget.circleRoom ?? '정보 없음'),
                  style: TextFontWidget.fontRegularStyle(
                    fontSize: 12,
                    color: data != null
                        ? const Color(0xff6EA4EF)
                        : const Color(0xFF767676),
                  ),
                ),
                loading: () => const SizedBox(
                  width: 12,
                  height: 12,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
                error: (_, __) => Text(
                  widget.circleRoom ?? '정보 없음',
                  style: TextFontWidget.fontRegularStyle(
                    fontSize: 12,
                    color: const Color(0xFF767676),
                  ),
                ),
              ),
              onTap: floorPhotoState.hasValue && floorPhotoState.value != null
                  ? () => _showFullScreenMap(
                        context,
                        floorPhotoState.value!.data.floorPhotoPath,
                      )
                  : null,
            ),

          // 회장 연락처
          if (hasLeaderHp)
            PopoverMenuItem(
              icon: SvgPicture.asset(
                'assets/images/phonelogo.svg',
                width: 14,
                height: 14,
              ),
              label: '회장 연락처',
              trailing: Text(
                isLoggedIn
                    ? (widget.leaderHp!.addDashOrNull() ?? widget.leaderHp!)
                    : '로그인 후 이용',
                style: TextFontWidget.fontRegularStyle(
                  fontSize: 12,
                  color: isLoggedIn
                      ? const Color(0xff6EA4EF)
                      : const Color(0xFF767676),
                ),
              ),
              onTap: isLoggedIn ? () => _copyPhoneNumber(widget.leaderHp!) : null,
            ),

          // 인스타그램
          if (hasClubInsta)
            PopoverMenuItem(
              icon: Image.asset(
                'assets/images/Instagram_logo.png',
                width: 16,
                height: 16,
              ),
              label: '인스타그램',
              trailing: Text(
                '@${_extractInstaId(widget.clubInsta!)}',
                style: TextFontWidget.fontRegularStyle(
                  fontSize: 12,
                  color: const Color(0xff6EA4EF),
                ),
              ),
              onTap: () => _openInstagram(widget.clubInsta!),
            ),
        ],
        style: const PopoverMenuStyle(
          width: 220,
          padding: EdgeInsets.symmetric(vertical: 8),
        ),
      ),
      child: GestureDetector(
        onTap: () => _popoverController.toggle(),
        child: const Padding(
          padding: EdgeInsets.only(top: 8),
          child: Icon(Icons.more_vert, size: 20),
        ),
      ),
    );
  }

  /// 인스타그램 URL에서 ID만 추출
  String _extractInstaId(String instaUrl) {
    // https://instagram.com/xxx 형태에서 xxx만 추출
    final uri = Uri.tryParse(instaUrl);
    if (uri != null && uri.pathSegments.isNotEmpty) {
      return uri.pathSegments.first;
    }
    // URL이 아니면 그대로 반환
    return instaUrl;
  }

  BadgeStatus _toBadgeStatus(CircleInfoStatus status) {
    switch (status) {
      case CircleInfoStatus.wait:
        return BadgeStatus.wait;
      case CircleInfoStatus.pass:
        return BadgeStatus.pass;
      case CircleInfoStatus.fail:
        return BadgeStatus.fail;
      case CircleInfoStatus.undefined:
        return BadgeStatus.wait; // fallback
    }
  }
}
