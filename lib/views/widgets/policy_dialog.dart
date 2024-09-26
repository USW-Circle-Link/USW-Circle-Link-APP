import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:usw_circle_link/const/data.dart';
import 'package:usw_circle_link/views/widgets/text_font_widget.dart';

class PolicyDialog extends StatefulWidget {
  const PolicyDialog({Key? key}) : super(key: key);

  @override
  _PolicyDialogState createState() => _PolicyDialogState();
}

class _PolicyDialogState extends State<PolicyDialog> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            titleSpacing: 0.0,
            title: Container(
              color: Colors.white,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      // 이전 화면으로 돌아가기
                      Navigator.of(context).pop(false);
                    },
                    icon: SvgPicture.asset(
                      'assets/images/ic_back_arrow.svg',
                    ),
                  ),
                  Text(
                    '이용 약관',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.fromLTRB(8.w,0,8.w,8.h),
            child: OutlinedButton(onPressed: ()=>Navigator.of(context).pop(true), child: Text('동의')),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.w), // 전체 여백 설정
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 이용약관 텍스트
                  TextFontWidget.fontRegular(
                    text: content_of_terms_of_service,
                    fontSize: 12.sp,
                    color: Colors.black,
                    fontweight: FontWeight.w300,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
