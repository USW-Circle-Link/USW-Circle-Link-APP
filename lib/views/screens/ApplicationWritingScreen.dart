import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:usw_circle_link/views/widgets/TextFontWidget.dart';

class ApplicationWritingScreen extends StatefulWidget {
  const ApplicationWritingScreen({Key? key}) : super(key: key);

  @override
  _ApplicationWritingScreenState createState() =>
      _ApplicationWritingScreenState();
}

class _ApplicationWritingScreenState extends State<ApplicationWritingScreen> {
  bool? isDone = false;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                titleSpacing: 0.0,
                title: Padding(
                  // TODO : icon padding 문제
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
                      TextFontWidget.fontRegular(
                          text: '지원하기',
                          fontSize: 18.sp,
                          color: Color(0xFF111111),
                          fontweight: FontWeight.w600),
                      SizedBox(width: 52.w, height: 52.h)
                    ],
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(top: 60.h),
                  padding: EdgeInsets.only(left: 32.w, right: 32.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 32.h,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 56.h,
                        child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              backgroundColor: const Color(0xFF4F5BD0),
                              side: const BorderSide(
                                width: 0.0,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            child: TextFontWidget.fontRegular(
                                text: '지원서 작성',
                                fontSize: 18.sp,
                                color: const Color(0xFFFFFFFF),
                                fontweight: FontWeight.w600)),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text:
                                  "지원서를 작성 완료후 '지원 완료' 버튼을 눌러 주세요.\n 지원서를 잘못 작성할 경우, 책임은 본인에게 있습니다.\n신중히 작성후 '지원 완료' 버튼을 눌러 주세요.",
                              style: TextStyle(
                                  fontFamily: 'Pretendard-Regular',
                                  fontSize: 12.sp,
                                  color: const Color(0xFF989898),
                                  fontWeight: FontWeight.w400),
                              children: const [
                                // TextSpan(
                                //   text: "인증 URL",
                                //   style: TextStyle(
                                //       color: Color(0xFF6E6EDE),
                                //       fontWeight: FontWeight.w600),
                                // ),
                                // TextSpan(
                                //   text: '을 전송합니다',
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Checkbox(
                        value: isDone,
                        onChanged: (bool? value) {
                          setState(() {
                            debugPrint('${isDone}');
                            isDone = value;
                          });
                        },
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 56.h,
                        child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              backgroundColor: const Color(0xFF000000),
                              side: const BorderSide(
                                width: 0.0,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            child: TextFontWidget.fontRegular(
                                text: '지원 완료',
                                fontSize: 18.sp,
                                color: const Color(0xFFFFFFFF),
                                fontweight: FontWeight.w600)),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
