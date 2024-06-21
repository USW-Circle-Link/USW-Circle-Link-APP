import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:usw_circle_link/views/widgets/TextFontWidget.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

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
                            icon: SvgPicture.asset('assets/images/bell.svg',),
                          )
                        ),
                      ],
                    )
                ),],
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget Card({required Container child}) {
  return Container(
    margin: EdgeInsets.only(top: 12.h, right: 6.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          'assets/images/gullisae.png',
          width: 120.w,
          height: 140.h,
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            SizedBox(width: 6.w),
            TextFontWidget.fontRegular(
                text: '굴리세',
                fontSize: 14.sp,
                color: Colors.black,
                fontweight: FontWeight.w500),
          ],
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            SizedBox(width: 4.w),
            Container(
              alignment: Alignment.center,
              height: 20.h,
              width: 47.w,
              margin: EdgeInsets.only(right: 5.w),
              decoration: BoxDecoration(
                color: Color(0xffF0F2F5),
                borderRadius: BorderRadius.all(
                  Radius.circular(4.0),
                ),
              ),
              child: TextFontWidget.fontRegular(
                  text: '# 볼링',
                  fontSize: 12.sp,
                  color: Color(0xff989898),
                  fontweight: FontWeight.w400),
            ),
            Container(
              alignment: Alignment.center,
              height: 20.h,
              width: 47.w,
              margin: EdgeInsets.only(right: 5.w),
              decoration: BoxDecoration(
                color: Color(0xffF0F2F5),
                borderRadius: BorderRadius.all(
                  Radius.circular(4.0),
                ),
              ),
              child: TextFontWidget.fontRegular(
                  text: '# 친목',
                  fontSize: 12.sp,
                  color: Color(0xff989898),
                  fontweight: FontWeight.w400),
            ),
          ],
        )
      ],
    ),
  );
}

Widget UswClubList() {
  return Container(
    width: double.infinity,
    height: 250.h,
    margin: EdgeInsets.only(top: 12.h),
    padding: EdgeInsets.only(left: 24.w, top: 16.h, bottom: 16.h),
    color: Colors.white,
    child: Row(
      children: [
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4, // 실제 데이터 개수로 대체
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(right: 8.w), // 카드 간격 조정
                child: Card(
                  child: Container(
                    width: 150.w, // 카드의 너비
                    height: 200.h, // 카드의 높이
                    child: Center(
                      child: Text('Card $index'), // 카드 내용
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}

/*Widget UswClubList() {
  //api 나오면 ListView.builder() 사용
  return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        width: double.infinity,
        height: 250.h,
        margin: EdgeInsets.only(top: 12.h),
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
        color: Colors.white,
        child: Row(
          children: [Card(), Card(), Card()],
        ),
      ));
}
*/