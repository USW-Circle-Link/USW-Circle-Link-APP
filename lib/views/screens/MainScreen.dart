import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => Scaffold(
              backgroundColor: Color(0xffF0F2F5),
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
                          Text('동구라미',
                              style: TextStyle(
                                  fontFamily: 'Jalnan2',
                                  fontSize: 16.sp,
                                  color: Color(0xffFFC01D),
                                  fontWeight: FontWeight.w400)),
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
              body: Column(children: []),
            ));
  }
}
