import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:usw_circle_link/views/screens/MainScreen.dart';
import 'package:usw_circle_link/views/widgets/RoundedDropdown.dart';
import 'package:usw_circle_link/views/widgets/RoundedTextField.dart';
import 'package:usw_circle_link/views/widgets/TextFontWidget.dart';

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
  String? college;
  String? major;

  String? selectedCollege;
  String? selectedMajor;

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
                      hintText: "이름",
                      prefixIcon: SvgPicture.asset(
                        'assets/images/ic_person.svg',
                        width: 13.w,
                        height: 16.h,
                        fit: BoxFit.scaleDown,
                      ),
                      hintStyle: TextStyle(
                          fontSize: 14.sp, fontFamily: 'Pretendard-Regular'),
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
                      textEditController: phonenumberController,
                      leftBottomCornerRadius: 8.r,
                      rightBottomCornerRadius: 8.r,
                      leftTopCornerRadius: 8.r,
                      rightTopCornerRadius: 8.r,
                      borderColor: const Color(0xffDBDBDB),
                      borderWidth: 1.w,
                      maxLines: 1,
                      textInputType: TextInputType.text,
                      textAlign: TextAlign.left,
                      prefixIcon: SvgPicture.asset(
                        'assets/images/ic_phone.svg',
                        width: 13.w,
                        height: 16.h,
                        fit: BoxFit.scaleDown,
                      ),
                      hintText: "전화번호 (- 제외입력)",
                      hintStyle: TextStyle(
                          fontSize: 14.sp, fontFamily: 'Pretendard-Regular'),
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
                      textEditController: studentnumberController,
                      leftBottomCornerRadius: 8.r,
                      rightBottomCornerRadius: 8.r,
                      leftTopCornerRadius: 8.r,
                      rightTopCornerRadius: 8.r,
                      borderColor: const Color(0xffDBDBDB),
                      borderWidth: 1.w,
                      maxLines: 1,
                      textInputType: TextInputType.text,
                      textAlign: TextAlign.left,
                      prefixIcon: SvgPicture.asset(
                        'assets/images/ic_tag.svg',
                        width: 13.w,
                        height: 16.h,
                        fit: BoxFit.scaleDown,
                      ),
                      hintText: "학번",
                      hintStyle: TextStyle(
                          fontSize: 14.sp, fontFamily: 'Pretendard-Regular'),
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
                      readOnly: true,
                      onTab: () async {
                        showCustomDialog(context);
                      },
                      leftBottomCornerRadius: 8.r,
                      rightBottomCornerRadius: 8.r,
                      leftTopCornerRadius: 8.r,
                      rightTopCornerRadius: 8.r,
                      borderColor: const Color(0xffDBDBDB),
                      borderWidth: 1.w,
                      maxLines: 1,
                      textInputType: TextInputType.none,
                      textAlign: TextAlign.left,
                      textInputAction: TextInputAction.done,
                      prefixIcon: SvgPicture.asset(
                        'assets/images/ic_bookmark.svg',
                        width: 13.w,
                        height: 16.h,
                        fit: BoxFit.scaleDown,
                      ),
                      suffixIcon: SvgPicture.asset(
                        'assets/images/>.svg',
                        width: 32.w,
                        height: 32.h,
                        fit: BoxFit.scaleDown,
                      ),
                      hintText: (selectedCollege == null || selectedMajor == null)?'학과':'${selectedMajor}',
                      hintStyle: TextStyle(
                          fontSize: 14.sp, fontFamily: 'Pretendard-Regular'),
                      isAnimatedHint: false,
                    ),
                  )
                ],
              ),
              SizedBox(height: 48.h,),
              CustomButton(text: '수정 완료', onPressed: () {
                showalarmCustomDialog(context);
              }),
            ],
          ),
        ),
      ),
    );
  }
  void showCustomDialog(BuildContext context) async {
    final result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                RoundedDropdown(
                  initValue: selectedCollege,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedCollege = newValue;
                    });
                  },
                  items: <String>['College 1', 'College 2', 'College 3'],
                  hintText: '단과대학 선택',
                  leftTopCornerRadius: 8.r,
                  leftBottomCornerRadius: 8.r,
                  rightTopCornerRadius: 8.r,
                  rightBottomCornerRadius: 8.r,
                  borderColor: Color(0xFFCECECE),
                  borderWidth: 1.w,
                  marginTop: 32.h,
                  marginLeft: 16.w,
                  marginRight: 16.w,
                ),
                SizedBox(height: 8),
                RoundedDropdown(
                  initValue: selectedMajor,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedMajor = newValue;
                    });
                  },
                  items: <String>['Major 1', 'Major 2', 'Major 3'],
                  hintText: '학부(학과) 선택',
                  leftTopCornerRadius: 8.r,
                  leftBottomCornerRadius: 8.r,
                  rightTopCornerRadius: 8.r,
                  rightBottomCornerRadius: 8.r,
                  borderColor: Color(0xFFCECECE),

                  borderWidth: 1.w,
                  marginLeft: 16.w,
                  marginRight: 16.w,
                ),
                SizedBox(height: 20),
                SizedBox.fromSize(
                  size: Size.fromHeight(1.h),
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Color(0xFFCECECE)),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(
                        {'college': selectedCollege, 'major': selectedMajor});
                  },
                  style: TextButton.styleFrom(
                    minimumSize: Size.fromHeight(50.h),
                    //primary: Colors.white,
                    //onPrimary: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                          top: Radius.zero, bottom: Radius.circular(15.r)),
                    ),
                  ),
                  child: TextFontWidget.fontRegular(
                    text: "확인",
                    color: Color(0xFF0085FF),
                    fontSize: 18.sp,
                    fontweight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    setState(() {
      if (result != null) {
        college = result['college'];
        major = result['major'];
        debugPrint('${college} - ${major}');
        debugPrint('${selectedCollege} - ${selectedMajor}');
      }
    });
  }

  void showalarmCustomDialog(BuildContext context) async {
    final result = showDialog(context: context, builder: (BuildContext context) {
      return Dialog(
        child: Container(
          padding: EdgeInsets.zero,
          width: 270.w,
          height: 125.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            color: const Color(0xffffffff),

          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 15.h,),
              Text("알림" , style: TextStyle(
                color: const Color(0xff111111),
                fontWeight: FontWeight.w600,
                fontSize: 18.sp,
                fontFamily: "Pretendard",
                fontStyle: FontStyle.normal,
                height: 1.11.sp,
              ),),
              SizedBox(height: 8.h,),
              Text("내 정보가 수정되었습니다", style: TextStyle(
                color: const Color(0xff767676),
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                fontFamily: "Pretendard",
                fontStyle: FontStyle.normal,
                height: 1.14.sp,
              ),),
              SizedBox(height: 15.h,),
              Container(
                  width: 275.w,
                  height: 1.h,
                  decoration:     BoxDecoration(
                      color: Color(0xffdadada))
              ),
              SizedBox(height: 1.h,),
              TextButton(onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainScreen()),);
              }, child: Text("확인", style: TextStyle(
                color: const Color(0xff0085FF),
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
                fontFamily: "Pretendard",
                fontStyle: FontStyle.normal,
                height: 1.11.sp,
              ),),
                style: ButtonStyle(

                ),
              )
            ],
          ),
        ),
      );
    });
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