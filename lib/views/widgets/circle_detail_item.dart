import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class CircleDetailItem extends StatelessWidget {
  final int clubId;
  final String name;
  final String? imageUrl;
  final String leader;
  final String instaId;
  final String leaderHp;
  final String? status;

  const CircleDetailItem({
    super.key,
    required this.clubId,
    required this.leader,
    required this.name,
    this.imageUrl,
    required this.leaderHp,
    required this.instaId,
    this.status,
  });

  @override
  Widget build(BuildContext context) {
    Color? statusColor;
    String? statusText;

    switch (status) {
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
            onTap: () => context.push('/circle?clubId=$clubId'),
            child: Container(
              width: 327.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.sp),
                color: const Color(0xffFFFFFF),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 100.h,
                      width: 100.w,
                      alignment: Alignment.center,
                      child: Image.network(
                        imageUrl ?? "",
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            alignment: Alignment.center,
                            color: const Color.fromARGB(255, 164, 164, 164),
                            child: Text('이미지 없음'),
                          );
                        },
                      ),
                    ),
                    SizedBox(width: 16.w),
                    SizedBox(
                      width: 179.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                name,
                                style: TextStyle(
                                  fontFamily: 'Pretendard',
                                  color: Colors.black,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                  height: 1.h,
                                  letterSpacing: -0.45.sp,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 7.h,
                          ),
                          SizedBox(
                            width: 179.w,
                            child: Row(
                              children: [
                                Text(
                                  '동아리장',
                                  style: TextStyle(
                                    fontFamily: 'Pretendard',
                                    color: const Color(0xFF767676),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    height: 1.h,
                                    letterSpacing: -0.35.sp,
                                  ),
                                ),
                                SizedBox(width: 4.w),
                                Flexible(
                                  child: Text(
                                    leader,
                                    style: TextStyle(
                                      fontFamily: 'Pretendard',
                                      color: const Color(0xFF353549),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      height: 1.h,
                                      letterSpacing: -0.35.sp,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 7.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 4.w,
                              ),
                              SvgPicture.asset(
                                'assets/images/phonelogo.svg',
                                height: 16.h,
                                width: 16.w,
                              ),
                              SizedBox(width: 6.w),
                              Text(
                                leaderHp,
                                style: TextStyle(
                                  fontFamily: 'Pretendard',
                                  color: const Color(0xFF353549),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  height: 1.h,
                                  letterSpacing: -0.35.sp,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 4.w,
                              ),
                              Image.asset(
                                width: 16.w,
                                height: 16.h,
                                'assets/images/Instagram_logo.png',
                              ),
                              SizedBox(width: 6.w),
                              Text(
                                '@$instaId',
                                style: TextStyle(
                                  fontFamily: 'Pretendard',
                                  color: const Color(0xFF353549),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  height: 1.h,
                                  letterSpacing: -0.35.sp,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5.h),
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
                                    child: Text(
                                      statusText,
                                      style: TextStyle(
                                        fontFamily: 'Pretendard',
                                        color: const Color(0xffFFFFFF),
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                        height: 1.h,
                                        letterSpacing: -0.6.sp,
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  ],
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
