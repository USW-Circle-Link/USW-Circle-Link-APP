import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:usw_circle_link/utils/extensions.dart';
import 'package:usw_circle_link/utils/logger/Logger.dart';
import 'package:usw_circle_link/views/widgets/text_font_widget.dart';

class CircleDetailOverlay extends StatelessWidget {
  final String? circleRoom;
  final String? leaderHp;
  final String? clubInsta;
  final VoidCallback onClose;

  const CircleDetailOverlay({
    super.key,
    this.circleRoom,
    this.leaderHp,
    this.clubInsta,
    required this.onClose,
  });

  void _showFullScreenMap(BuildContext context) {
    // 기존 팝업 닫기 후 지도 오버레이 표시// 기존 팝업 닫기

    showDialog(
      context: context,
      barrierDismissible: false, // 배경 클릭으로 닫히지 않게 설정
      builder: (BuildContext context) {
        return Stack(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop(); // 지도 팝업 닫기
              },
              child: Container(
                color: Colors.black54, // 반투명 배경
              ),
            ),
            Center(
              child: InteractiveViewer(
                panEnabled: true, // 스와이프 가능
                scaleEnabled: true, // 확대/축소 가능
                minScale: 1.0, // 최소 축소 크기
                maxScale: 5.0, // 최대 확대 크기
                child: Image.asset(
                  'assets/images/map.jpeg',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              top: 40.0,
              right: 20.0,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop(); // 지도 팝업 닫기
                },
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

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
          width: 195.w,
          height: 142.h,
          constraints: const BoxConstraints(
            maxWidth: 300,
            minHeight: 100,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6.r,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                height: 43.h,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: const Color(0xFF767676),
                  width: 1.w,
                ))),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10.w,
                    ),
                    TextFontWidget.fontRegular(
                      '동아리 정보',
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 90.w,
                    ),
                    GestureDetector(
                      onTap: onClose,
                      child:
                          const Icon(Icons.close, size: 20, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: circleRoom != null && circleRoom!.isNotEmpty
                    ? () {
                        onClose();
                        _showFullScreenMap(context);
                      }
                    : null,
                child: Container(
                  padding: EdgeInsets.all(10.sp),
                  height: 33.h,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: const Color(0xFF767676),
                    width: 0.5.w,
                  ))),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/map_marker.png',
                        scale: 1,
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      TextFontWidget.fontRegular(
                        '동아리방 | ${circleRoom != null && circleRoom!.isNotEmpty ? "학생회관 $circleRoom호" : "정보 없음"}',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        height: -0.1,
                        color: circleRoom != null && circleRoom!.isNotEmpty
                            ? const Color(0xff6EA4EF)
                            : const Color(0xff9A9A9A),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: leaderHp != null && leaderHp!.isNotEmpty
                    ? () async {
                        final Uri launchUri = Uri(
                          scheme: 'tel',
                          path: leaderHp!.startsWith('+')
                              ? leaderHp
                              : '+82${leaderHp!.substring(1)}',
                        );
                        if (await canLaunchUrl(launchUri)) {
                          await launchUrl(launchUri);
                        } else {
                          logger.d('Could not launch $launchUri');
                        }
                      }
                    : null,
                child: Container(
                  padding: EdgeInsets.all(10.sp),
                  height: 33.h,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: const Color(0xFF767676),
                    width: 0.5.w,
                  ))),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/phonelogo.svg',
                        height: 12.h,
                        width: 12.w,
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      TextFontWidget.fontRegular(
                        leaderHp != null && leaderHp!.isNotEmpty
                            ? leaderHp!.addDashOrNull() ?? "정보 없음"
                            : "정보 없음",
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        height: -0.1,
                        color: leaderHp != null && leaderHp!.isNotEmpty
                            ? const Color(0xff6EA4EF)
                            : const Color(0xff9A9A9A),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: clubInsta != null && clubInsta!.isNotEmpty
                    ? () async {
                        final Uri launchUri =
                            Uri.parse('https://www.instagram.com/$clubInsta');
                        if (await canLaunchUrl(launchUri)) {
                          await launchUrl(launchUri,
                              mode: LaunchMode.externalApplication);
                        } else {
                          logger.d(
                              'Could not launch Instagram profile for $clubInsta');
                        }
                      }
                    : null,
                child: Container(
                  padding: EdgeInsets.all(10.sp),
                  height: 33.h,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: const Color(0xFF767676),
                    width: 0.5.w,
                  ))),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/Instagram_logo.png',
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      TextFontWidget.fontRegular(
                        clubInsta != null && clubInsta!.isNotEmpty
                            ? '인스타그램'
                            : '정보 없음',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        height: -0.1,
                        color: clubInsta != null && clubInsta!.isNotEmpty
                            ? const Color(0xff6EA4EF)
                            : const Color(0xff9A9A9A),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
