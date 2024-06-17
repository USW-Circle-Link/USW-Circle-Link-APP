import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:usw_circle_link/views/widgets/TextFontWidget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isAllSelected = true;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => Scaffold(
        backgroundColor: const Color(0xffF0F2F5),
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          toolbarHeight: 42.h,
          centerTitle: false,
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Container(
            height: 52.h,
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/images/menubt.svg',
                    ),
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      child: Image.asset(
                        'assets/images/duck.png',
                        width: 19.w,
                        height: 19.h,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    TextFontWidget.jalnan2(
                        text: '동구라미',
                        fontSize: 16.sp,
                        color: const Color(0xffFFC01D),
                        fontweight: FontWeight.w400),
                  ],
                ),
                Container(
                    child: Row(
                  children: [
                    Container(
                        child: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'assets/images/bell.svg',
                      ),
                    )),
                  ],
                ))
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isAllSelected = true;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isAllSelected
                          ? const Color(0xff6E78D8)
                          : const Color(0xffEBEBEB),

                      minimumSize: Size(MediaQuery.of(context).size.width / 2,
                          46.h), // 버튼 크기 조정
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero, // 버튼을 직사각형으로 설정
                      ),
                    ),
                    child: TextFontWidget.jalnan2(
                        text: '전체',
                        fontSize: 16.sp,
                        color: isAllSelected
                            ? Colors.white
                            : const Color(0xffCECECE),
                        fontweight: FontWeight.w400)),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isAllSelected = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: !isAllSelected
                          ? const Color(0xff6E78D8)
                          : const Color(0xffEBEBEB),

                      minimumSize: Size(MediaQuery.of(context).size.width / 2,
                          46.h), // 버튼 크기 조정
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero, // 버튼을 직사각형으로 설정
                      ),
                    ),
                    child: TextFontWidget.jalnan2(
                        text: '모집 중',
                        fontSize: 16.sp,
                        color: isAllSelected
                            ? const Color(0xffCECECE)
                            : Colors.white,
                        fontweight: FontWeight.w400)),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  UswClubList(),
                  UswClubList(),
                  UswClubList(),
                  UswClubList(),
                  // 필요한 만큼 UswClubList() 추가
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget UswClubList() {
  return Container(
    width: double.infinity,
    height: 250.h,
    margin: EdgeInsets.only(top: 12.h),
    padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
    color: Colors.white,
    child: Row(
      children: [],
    ),
  );
}
