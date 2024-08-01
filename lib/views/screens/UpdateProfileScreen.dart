import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:usw_circle_link/views/widgets/RoundedTextField.dart';

class Updateprofilescreen extends StatefulWidget {
  const Updateprofilescreen({super.key});

  @override
  State<Updateprofilescreen> createState() => _UpdateprofilescreenState();
}

class _UpdateprofilescreenState extends State<Updateprofilescreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController studentnumberController = TextEditingController();
  TextEditingController departmentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(62.h),
          child: AppBar(
            scrolledUnderElevation: 0,
            toolbarHeight: 62.h,
            centerTitle: true,
            elevation: 0.0,
            backgroundColor: const Color(0xffFFFFFF),
            automaticallyImplyLeading: false,
            title: SizedBox(
              width: 375.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: SvgPicture.asset(
                      'assets/images/back.svg',
                      height: 36.h,
                      width: 36.w,
                    ),
                  ),
                  SizedBox(width: 69.8.w),
                  Text(
                    '내 정보 수정',
                    style: TextStyle(
                      fontFamily: 'Pretendard',
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      height: 1.111.h,
                      letterSpacing: -0.45.sp,
                    ),
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30.h),
              Row(
                children: [
                  SizedBox(width: 36.w),
                  Text(
                    '이름',
                    style: TextStyle(
                      color: const Color(0xff000000),
                      fontFamily: 'Pretendard',
                      fontSize: 16.sp,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      height: 1.12.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h,),
              Row(
                children: [
                  SizedBox(width: 32.w),
                  Container(
                    width: 311.w,
                    child:
                    RoundedTextField(
                      height: 50.h,
                      textEditController: nameController,
                      leftBottomCornerRadius: 8.r,
                      rightBottomCornerRadius: 8.r,
                      leftTopCornerRadius: 8.r,
                      rightTopCornerRadius: 8.r,
                      borderColor: const Color(0xffDBDBDB),
                      borderWidth: 1.w,
                      maxLines: 1,
                      textInputType: TextInputType.text,
                      textAlign: TextAlign.left,
                    ),
                  )
                ],
              ),
              SizedBox(height: 16.h,),
              Row(
                children: [
                  SizedBox(width: 36.w),
                  Text(
                    '전화번호',
                    style: TextStyle(
                      color: const Color(0xff000000),
                      fontFamily: 'Pretendard',
                      fontSize: 16.sp,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      height: 1.12.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h,),
              Row(
                children: [
                  SizedBox(width: 32.w),
                  Container(
                    width: 311.w,
                    child:
                    RoundedTextField(
                      height: 50.h,
                      textEditController: nameController,
                      leftBottomCornerRadius: 8.r,
                      rightBottomCornerRadius: 8.r,
                      leftTopCornerRadius: 8.r,
                      rightTopCornerRadius: 8.r,
                      borderColor: const Color(0xffDBDBDB),
                      borderWidth: 1.w,
                      maxLines: 1,
                      textInputType: TextInputType.text,
                      textAlign: TextAlign.left,
                    ),
                  )
                ],
              ),
              SizedBox(height: 16.h,),
              Row(
                children: [
                  SizedBox(width: 36.w),
                  Text(
                    '학번',
                    style: TextStyle(
                      color: const Color(0xff000000),
                      fontFamily: 'Pretendard',
                      fontSize: 16.sp,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      height: 1.12.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h,),
              Row(
                children: [
                  SizedBox(width: 32.w),
                  Container(
                    width: 311.w,
                    child:
                    RoundedTextField(
                      height: 50.h,
                      textEditController: nameController,
                      leftBottomCornerRadius: 8.r,
                      rightBottomCornerRadius: 8.r,
                      leftTopCornerRadius: 8.r,
                      rightTopCornerRadius: 8.r,
                      borderColor: const Color(0xffDBDBDB),
                      borderWidth: 1.w,
                      maxLines: 1,
                      textInputType: TextInputType.text,
                      textAlign: TextAlign.left,
                    ),
                  )
                ],
              ),
              SizedBox(height: 16.h,),
              Row(
                children: [
                  SizedBox(width: 36.w),
                  Text(
                    '학과',
                    style: TextStyle(
                      color: const Color(0xff000000),
                      fontFamily: 'Pretendard',
                      fontSize: 16.sp,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      height: 1.12.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h,),
              Row(
                children: [
                  SizedBox(width: 32.w),
                  Container(
                    width: 311.w,
                    child:
                    RoundedTextField(
                      height: 50.h,
                      textEditController: nameController,
                      leftBottomCornerRadius: 8.r,
                      rightBottomCornerRadius: 8.r,
                      leftTopCornerRadius: 8.r,
                      rightTopCornerRadius: 8.r,
                      borderColor: const Color(0xffDBDBDB),
                      borderWidth: 1.w,
                      maxLines: 1,
                      textInputType: TextInputType.text,
                      textAlign: TextAlign.left,
                    ),
                  )
                ],
              ),
              SizedBox(height: 48.h,),
              CustomButton(text: '수정 완료', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.sp,
      width: 311.sp,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.sp),
        color: const Color(0xff000000),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: const Color(0xffffffff),
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            fontFamily: 'Pretendard',
            height: 1.111.sp,
          ),
        ),
      ),
    );
  }
}