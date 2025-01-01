import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:usw_circle_link/views/widgets/circle_detail_overlay.dart';
import 'package:usw_circle_link/views/widgets/text_font_widget.dart';
import 'package:url_launcher/url_launcher.dart';


class CircleDetailItem extends StatefulWidget {
  final int clubId;
  final String name;
  final String? imageUrl;
  final String leader;
  final String instaId;
  final String leaderHp;
  final String circleRoom;
  final String? status;

  const CircleDetailItem({
    super.key,
    required this.clubId,
    required this.leader,
    required this.name,
    this.imageUrl,
    required this.leaderHp,
    required this.instaId,
    required this.circleRoom,
    this.status,
  });

  @override
  State<CircleDetailItem> createState() => _CircleDetailItemState();
}

class _CircleDetailItemState extends State<CircleDetailItem> {
  final GlobalKey _iconKey = GlobalKey();
  OverlayEntry? _overlayEntry;

  void _showOverlay() {
    final RenderBox renderBox = _iconKey.currentContext!.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);
    final Size size = renderBox.size;

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
            left: offset.dx - 150,
            child: Material(
              color: Colors.transparent,
              child: CircleDetailOverlay(
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

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    Color? statusColor;
    String? statusText;

    switch (widget.status) {
      case 'WAIT':
        statusColor = const Color(0xffBFBFBF);
        statusText = '대기 중';
        break;
      case 'PASS':
        statusColor = const Color.fromARGB(255, 82, 128, 255);
        statusText = '합격';
        break;
      case 'FAIL':
        statusColor = const Color.fromARGB(255, 255, 82, 82);
        statusText = '불합격';
        break;
    }

    return Center(
      child: Column(
        children: [
          GestureDetector(
            onTap: () => context.push('/circle?clubId=${widget.clubId}'),
            child: Container(
              width: 327.w,
              height: 107.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.sp),
                color: const Color(0xffFFFFFF),
              ),
              child: Row(
                children: [
                  SizedBox(width: 19.w),
                  Container(
                    height: 72.h,
                    width: 60.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.sp),
                      border: Border.all(color: const Color(0xFF767676), width: 1),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: Image.network(
                        widget.imageUrl ?? "",
                        fit: BoxFit.fill,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            alignment: Alignment.center,
                            color: const Color.fromARGB(255, 164, 164, 164),
                            child: Icon(
                              Icons.person,
                              color: const Color.fromARGB(255, 255, 255, 255),
                              size: 60,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Container(
                    width: 126.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30.h),
                        TextFontWidget.fontRegular(
                          widget.name,
                          color: Colors.black,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          height: 1.h,
                          letterSpacing: -0.45.sp,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          children: [
                            TextFontWidget.fontRegular(
                              '동아리 회장',
                              color: const Color(0xFF767676),
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                              height: 1.h,
                              letterSpacing: -0.35.sp,
                            ),
                            SizedBox(width: 3.h),
                            TextFontWidget.fontRegular(
                              widget.leader,
                              color: const Color(0xFF353549),
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w800,
                              height: 1.h,
                              letterSpacing: -0.35.sp,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 100.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              key: _iconKey,
                              onPressed: () {
                                if (_overlayEntry == null) {
                                  _showOverlay();
                                } else {
                                  _removeOverlay();
                                }
                              },
                              icon: Icon(Icons.more_vert),
                            ),
                          ],
                        ),
                        SizedBox(height: 21.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            statusColor != null && statusText != null
                                ? Container(
                              alignment: Alignment.centerRight,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5.h, horizontal: 10.w),
                                decoration: BoxDecoration(
                                  color: statusColor,
                                  borderRadius:
                                  BorderRadius.circular(16.sp),
                                ),
                                child: TextFontWidget.fontRegular(
                                  statusText,
                                  color: const Color(0xffFFFFFF),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w800,
                                  height: 1.h,
                                  letterSpacing: -0.6.sp,
                                ),
                              ),
                            )
                                : Container(),
                            SizedBox(width: 18.w),
                          ],
                        ),
                        SizedBox(height: 13.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 12.h),
        ],
      ),
    );
  }
}
