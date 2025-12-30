// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:usw_circle_link/utils/extensions.dart';
import 'package:usw_circle_link/widgets/circle_detail_overlay/circle_detail_overlay.dart';
import 'package:usw_circle_link/widgets/text_font_widget/text_font_widget.dart';

enum CircleDetailItemStatus {
  wait('WAIT', Color(0xffBFBFBF), '대기 중'),
  pass('PASS', Color(0xff8282FF), '합격'),
  fail('FAIL', Color(0xffFF8282), '불합격'),
  undefined('UNDEFINED', Colors.transparent, '');

  final String code;
  final Color color;
  final String text;

  const CircleDetailItemStatus(this.code, this.color, this.text);

  factory CircleDetailItemStatus.getByCode(String code) {
    return CircleDetailItemStatus.values.firstWhere(
          (value) => value.code == code,
      orElse: () => CircleDetailItemStatus.undefined,
    );
  }
}

class CircleDetailItem extends StatefulWidget {
  final String clubUUID;
  final String name;
  final String? imageUrl;
  final String leader;
  final String instaId;
  final String leaderHp;
  final String? circleRoom;
  final String? statusString;

  const CircleDetailItem({
    super.key,
    required this.clubUUID,
    required this.leader,
    required this.name,
    this.imageUrl,
    required this.leaderHp,
    required this.instaId,
    this.circleRoom,
    this.statusString,
  });

  @override
  State<CircleDetailItem> createState() => _CircleDetailItemState();
}

class _CircleDetailItemState extends State<CircleDetailItem> {
  late CircleDetailItemStatus status;

  final GlobalKey _iconKey = GlobalKey();
  final LayerLink _link = LayerLink();
  OverlayEntry? _overlayEntry;

  // 화면 우측 공간이 부족하면 오른쪽 정렬
  bool _alignRight = false;

  @override
  void initState() {
    super.initState();
    status = CircleDetailItemStatus.getByCode(widget.statusString ?? 'UNDEFINED');
  }

  void _showOverlay() {
    if (_overlayEntry != null) return;

    // 화면 우측 공간 측정 후 정렬 방향 결정
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
          // 바깥 영역 탭 시 닫힘
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
            targetAnchor: _alignRight ? Alignment.bottomRight : Alignment.bottomLeft,
            followerAnchor: _alignRight ? Alignment.topRight : Alignment.topLeft,
            offset: const Offset(0, 8), // 앵커와의 간격
            child: Material(
              color: Colors.transparent,
              child: CircleDetailOverlay(
                width: overlayWidth,
                circleRoom: widget.circleRoom,
                leaderHp: widget.leaderHp,
                clubInsta: widget.instaId,
                onClose: _removeOverlay,
              ),
            ),
          ),
        ],
      ),
    );

    Overlay.of(context, rootOverlay: true).insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void dispose() {
    _removeOverlay();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            width: 375,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xffFFFFFF),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () => context.push('/circle?clubUUID=${widget.clubUUID}'),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 21),
                  child: Stack(
                    children: [
                      if (status != CircleDetailItemStatus.undefined)
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                            decoration: BoxDecoration(
                              color: status.color,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: TextFontWidget.fontRegular(
                              status.text,
                              color: const Color(0xffFFFFFF),
                              fontSize: 10,
                              fontWeight: FontWeight.w800,
                              height: 1,
                              letterSpacing: -0.6,
                            ),
                          ),
                        ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 80,
                            width: 67,
                            decoration: BoxDecoration(
                              border: Border.all(color: const Color(0xffc4c4c4)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: HeroMode(
                              enabled: ModalRoute.of(context)?.animation?.status != AnimationStatus.reverse,
                              child: Hero(
                                tag: 'circle_${widget.clubUUID}',
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: widget.imageUrl != null && widget.imageUrl!.isValidUrl
                                      ? Image.network(widget.imageUrl!, fit: BoxFit.cover)
                                      : Image.asset('assets/images/circle_default_image.png', fit: BoxFit.cover),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 8),
                                TextFontWidget.fontRegular(
                                  widget.name,
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
                                    style: TextFontWidget.fontRegularStyle(
                                      color: const Color(0xFF767676),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      height: 1,
                                      letterSpacing: -0.35,
                                    ),
                                    children: [
                                      const TextSpan(text: ''),
                                      TextSpan(
                                        text: widget.leader,
                                        style: const TextStyle(
                                          color: Color(0xFF353549),
                                          fontWeight: FontWeight.w800,
                                          fontSize: 14,
                                          height: 1,
                                          letterSpacing: -0.35,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // 앵커 위젯
                          CompositedTransformTarget(
                            link: _link,
                            child: Container(
                              alignment: Alignment.topCenter,
                              child: IconButton(
                                key: _iconKey,
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                                visualDensity: VisualDensity.compact,
                                icon: const Icon(Icons.more_vert),
                                onPressed: () {
                                  if (_overlayEntry == null) {
                                    _showOverlay();
                                  } else {
                                    _removeOverlay();
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}