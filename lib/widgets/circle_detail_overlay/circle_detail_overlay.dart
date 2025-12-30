import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:photo_view/photo_view.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:usw_circle_link/utils/extensions.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';
import 'package:usw_circle_link/viewmodels/floor_photo_view_model.dart';
import 'package:usw_circle_link/viewmodels/user_view_model.dart';
import 'package:usw_circle_link/widgets/text_font_widget/text_font_widget.dart';

class CircleDetailOverlay extends ConsumerWidget {
  final String? circleRoom;
  final String? leaderHp;
  final String? clubInsta;
  final VoidCallback onClose;
  final double? width;
  const CircleDetailOverlay({
    super.key,
    this.circleRoom,
    this.leaderHp,
    this.clubInsta,
    required this.onClose,
    this.width,
  });

  void _showFullScreenMap(BuildContext context, String floorPhotoPath) {
    // 기존 팝업 닫기 후 지도 오버레이 표시// 기존 팝업 닫기

    showDialog(
      context: context,
      barrierDismissible: false, // 배경 클릭으로 닫히지 않게 설정
      builder: (BuildContext context) {
        return Stack(
          children: [
            Center(
              child: floorPhotoPath.isValidUrl
                  ? GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop(); // 지도 팝업 닫기
                      },
                      child: PhotoView(
                        imageProvider: NetworkImage(floorPhotoPath),
                        minScale: PhotoViewComputedScale.contained,
                        maxScale: PhotoViewComputedScale.covered * 2.0,
                        backgroundDecoration: BoxDecoration(
                          color: Colors.black54,
                        ),
                      ),
                    )
                  : const Center(
                      child: Text(
                        '이미지를 불러올 수 없습니다.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
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
  Widget build(BuildContext context, WidgetRef ref) {
    final state = circleRoom != null
        ? ref.watch(floorPhotoViewModelProvider(circleRoom!))
        : AsyncData(null);
    return Material(
      color: Colors.transparent,
      child: Container(
          width: width ?? 195,
          height: 142,
          constraints: const BoxConstraints(
            maxWidth: 300,
            minHeight: 100,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                height: 43,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: const Color(0xFF767676),
                  width: 1,
                ))),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    TextFontWidget.fontRegular(
                      '동아리 정보',
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 90,
                    ),
                    InkWell(
                      onTap: onClose,
                      child:
                          const Icon(Icons.close, size: 20, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: circleRoom != null &&
                        circleRoom!.isValidRoomFloor &&
                        state.hasValue &&
                        state.value != null
                    ? () {
                        onClose();
                        _showFullScreenMap(
                          context,
                          state.value!.data.floorPhotoPath,
                        );
                      }
                    : null,
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: 33,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: const Color(0xFF767676),
                    width: 0.5,
                  ))),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/map_marker.png',
                        scale: 1,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      state.when(
                        data: (data) => _circleRoomText(
                            circleRoom, data?.data.floorPhotoPath),
                        error: (error, stackTrace) =>
                            _circleRoomText(circleRoom, null),
                        loading: () => const CircularProgressIndicator(),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: leaderHp != null &&
                        leaderHp!.isNotEmpty &&
                        ref.read(userViewModelProvider).state.isAuthorized
                    ? () async {
                        await Clipboard.setData(ClipboardData(text: leaderHp!));
                        if (context.mounted) {
                          ScaffoldMessenger.of(context)
                            ..removeCurrentSnackBar()
                            ..showSnackBar(
                              const SnackBar(
                                content: Text('전화번호가 복사되었습니다.'),
                              ),
                            );
                        }
                      }
                    : null,
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: 33,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: const Color(0xFF767676),
                    width: 0.5,
                  ))),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/phonelogo.svg',
                        height: 12,
                        width: 12,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      TextFontWidget.fontRegular(
                        leaderHp != null && leaderHp!.isNotEmpty
                            ? ref.read(userViewModelProvider).state.isAuthorized
                                ? leaderHp!.addDashOrNull() ?? "정보 없음"
                                : "로그인 후 이용해주세요."
                            : "정보 없음",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        height: -0.1,
                        color: leaderHp != null &&
                                leaderHp!.isNotEmpty &&
                                ref
                                    .read(userViewModelProvider)
                                    .state
                                    .isAuthorized
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
                        final Uri launchUri = Uri.parse('$clubInsta');
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
                  padding: EdgeInsets.all(10),
                  height: 33,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: const Color(0xFF767676),
                    width: 0.5,
                  ))),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/Instagram_logo.png',
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      TextFontWidget.fontRegular(
                        clubInsta != null && clubInsta!.isNotEmpty
                            ? '인스타그램'
                            : '정보 없음',
                        fontSize: 12,
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

  Widget _circleRoomText(String? circleRoom, String? floorPhotoPath) {
    return TextFontWidget.fontRegular(
      '동아리방 | ${circleRoom != null && circleRoom.isNotEmpty ? "학생회관 $circleRoom호" : "정보 없음"}',
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: -0.1,
      color: floorPhotoPath != null && floorPhotoPath.isValidUrl
          ? const Color(0xff6EA4EF)
          : const Color(0xff9A9A9A),
    );
  }
}
