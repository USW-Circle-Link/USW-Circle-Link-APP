import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:usw_circle_link/views/screens/CircleScreen.dart';
import 'package:usw_circle_link/views/screens/LoginScreen.dart';
import 'package:usw_circle_link/views/widgets/TextFontWidget.dart';


class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isAllSelected = true;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => Scaffold(
        key: _scaffoldKey,
        backgroundColor: const Color(0xffF0F2F5),
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          toolbarHeight: 42.h,
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: Padding(
            padding: EdgeInsets.only(left: 24.w), // menubt.svg에 왼쪽 여백 추가
            child: IconButton(
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              },
              icon: SvgPicture.asset(
                'assets/images/menubt.svg',
              ),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/duck.png',
                width: 19.w,
                height: 19.h,
              ),
              SizedBox(width: 8.w), // 이미지와 텍스트 사이의 간격 조절
              TextFontWidget.jalnan2(
                text: '동구라미',
                fontSize: 16.sp,
                color: const Color(0xffFFC01D),
                fontweight: FontWeight.w400,
              ),
            ],
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 24.w), // bell.svg에 오른쪽 여백 추가
              child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/images/bell.svg',
                ),
              ),
            ),
          ],
        ),
        drawer: Menubar(context),
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
                    minimumSize:
                    Size(MediaQuery.of(context).size.width / 2, 46.h),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: TextFontWidget.jalnan2(
                    text: '전체',
                    fontSize: 16.sp,
                    color:
                    isAllSelected ? Colors.white : const Color(0xffCECECE),
                    fontweight: FontWeight.w400,
                  ),
                ),
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
                    minimumSize:
                    Size(MediaQuery.of(context).size.width / 2, 46.h),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: TextFontWidget.jalnan2(
                    text: '모집 중',
                    fontSize: 16.sp,
                    color:
                    isAllSelected ? const Color(0xffCECECE) : Colors.white,
                    fontweight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  UswClubList(),
                  UswClubList(),
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
Widget Menubar(BuildContext context) {
  return Drawer(
    backgroundColor: const Color(0xffF0F2F5),
    width: 290.w,
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
            },
            child: Center(
                child: Row(
                  children: [
                    SizedBox(width: 3.w),
                    SvgPicture.asset(
                      'assets/images/profile.svg',
                    ),
                    SizedBox(width: 16.w),
                    TextFontWidget.fontRegular(
                        text: '로그인',
                        fontSize: 18.sp,
                        color: Colors.black,
                        fontweight: FontWeight.w600),
                    SvgPicture.asset(
                      'assets/images/arrow_right.svg',
                    ),
                  ],
                )),
          ),
        ),
        buildDrawerItem(
          title: '내 정보',
          svgPath: 'assets/images/menubar1.svg',
          onTap: () {
            // 내 정보 화면으로 이동
          },
        ),
        buildDrawerItem(
          title: '나의 소속 동아리',
          svgPath: 'assets/images/menubar2.svg',
          onTap: () {
            // 나의 소속 동아리 화면으로 이동
          },
        ),
        buildDrawerItem(
          title: '지원 현황 확인하기',
          svgPath: 'assets/images/menubar3.svg',
          onTap: () {
            // 지원 현황 확인 화면으로 이동
          },
        ),
        buildDrawerItem(
          title: '공지 사항',
          svgPath: 'assets/images/menubar4.svg',
          onTap: () {
            // 공지 사항 화면으로 이동
          },
        ),
        Column(
          children: [
            Container(
              height: 400.h,
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: TextFontWidget.fontRegular(
                        text: '이용약관',
                        fontSize: 12.sp,
                        color: Colors.black,
                        fontweight: FontWeight.w500),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: TextFontWidget.fontRegular(
                        text: '로그아웃',
                        fontSize: 12.sp,
                        color: Colors.black,
                        fontweight: FontWeight.w500),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    ),
  );
}

Widget buildDrawerItem({
  required String title,
  required String svgPath,
  required VoidCallback onTap,
}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
    width: 242.w,
    height: 56.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.r),
      color: const Color(0xffFFFFFF),
    ),
    child: ListTile(
      leading: Padding(
        padding: EdgeInsets.only(left: 16.w),
        child: SvgPicture.asset(svgPath),
      ),
      title: Padding(
        padding: EdgeInsets.only(left: 10.w),
        child: TextFontWidget.fontRegular(
          text: title,
          fontSize: 16.sp,
          color: const Color(0xff353549),
          fontweight: FontWeight.w400,
        ),
      ),
      onTap: onTap,
    ),
  );
}

Widget CustomCard({required Widget child, required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
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
                fontweight: FontWeight.w500,
              ),
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
                  fontweight: FontWeight.w400,
                ),
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
                  fontweight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

// ignore: non_constant_identifier_names
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
            itemCount: 4,
            itemBuilder: (context, index) {
              return CustomCard(
                child: Container(
                  width: 150.w,
                  height: 200.h,
                  child: Center(
                    child: Text('Card $index'),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CircleScreen()), // 새로운 화면으로 전환
                  );
                },
              );
            },
          ),
        ),
      ],
    ),
  );
}
