import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:photo_view/photo_view.dart';
import 'package:usw_circle_link/views/widgets/text_font_widget.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 0.0,
          title: Padding(
            padding: EdgeInsets.only(left: 22.w, right: 22.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 52.w,
                  height: 52.h,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: SvgPicture.asset(
                      'assets/images/ic_back_arrow.svg',
                    ),
                  ),
                ),
                SizedBox(width: 52.w, height: 52.h)
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: Container(
            height: double.infinity,
            color: Colors.black,
            child: PhotoView(
              minScale: PhotoViewComputedScale.contained * 0.8,
              imageProvider: NetworkImage(
                image,
              ),
              errorBuilder: (context, error, stackTrace) {
                return TextFontWidget.fontRegular(
                  text: '이미지를 불러오지 못했습니다...',
                  fontSize: 14.sp,
                  color: Colors.white,
                  fontweight: FontWeight.w400,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
