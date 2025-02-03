// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:usw_circle_link/utils/extensions.dart';
import 'package:usw_circle_link/views/widgets/circle_detail_overlay.dart';
import 'package:usw_circle_link/views/widgets/text_font_widget.dart';

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
        orElse: () => CircleDetailItemStatus.undefined);
  }
}

class CircleDetailItem extends StatelessWidget {
  final int clubId;
  final String name;
  final String? imageUrl;
  final String leader;
  final String instaId;
  final String leaderHp;
  final String? circleRoom;
  final String? statusString;

  late CircleDetailItemStatus status;

  CircleDetailItem({
    super.key,
    required this.clubId,
    required this.leader,
    required this.name,
    this.imageUrl,
    required this.leaderHp,
    required this.instaId,
    this.circleRoom,
    this.statusString,
  }) {
    status = CircleDetailItemStatus.getByCode(statusString ?? 'UNDEFINED');
  }

  final GlobalKey _iconKey = GlobalKey();
  OverlayEntry? _overlayEntry;

  void _showOverlay() {
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
                clubInsta: instaId,
                onClose: _removeOverlay,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            width: 327.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: const Color(0xffFFFFFF),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8.r),
                onTap: () => context.push('/circle?clubId=$clubId'),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 14.h, horizontal: 21.w),
                  child: Stack(
                    children: [
                      if (status != CircleDetailItemStatus.undefined)
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 5.h, horizontal: 10.w),
                            decoration: BoxDecoration(
                              color: status.color,
                              borderRadius: BorderRadius.circular(16.sp),
                            ),
                            child: Container(
                              child: TextFontWidget.fontRegular(
                                status.text,
                                color: const Color(0xffFFFFFF),
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w800,
                                height: 1.h,
                                letterSpacing: -0.6.sp,
                              ),
                            ),
                          ),
                        ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 80.h,
                            width: 67.w,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xffc4c4c4)),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: HeroMode(
                              enabled:
                                  ModalRoute.of(context)?.animation?.status !=
                                      AnimationStatus.reverse,
                              child: Hero(
                                tag: 'circle_${clubId}',
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.r),
                                  child:
                                      imageUrl != null && imageUrl!.isValidUrl
                                          ? Image.network(
                                              imageUrl!,
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
                          ),
                          SizedBox(width: 16.w),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 8.h),
                                TextFontWidget.fontRegular(
                                  name,
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
                                    style: TextFontWidget.fontRegularStyle(
                                      color: const Color(0xFF767676),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      height: 1.h,
                                      letterSpacing: -0.35.sp,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: leader,
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
                                  _showOverlay();
                                  Overlay.of(context).insert(_overlayEntry!);
                                } else {
                                  _removeOverlay();
                                }
                              },
                              icon: Icon(Icons.more_vert),
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
          SizedBox(height: 12.h),
        ],
      ),
    );
  }
}
