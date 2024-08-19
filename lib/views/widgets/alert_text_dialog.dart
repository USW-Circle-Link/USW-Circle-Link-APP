import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:usw_circle_link/views/widgets/text_font_widget.dart';

class AlertTextDialog extends StatefulWidget {
  const AlertTextDialog(
      {Key? key, required this.text, required this.onConfirmPressed})
      : super(key: key);

  final String text;
  final Function() onConfirmPressed;

  @override
  _AlertTextDialogState createState() => _AlertTextDialogState();
}

class _AlertTextDialogState extends State<AlertTextDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: ScreenUtilInit(
            designSize: const Size(375, 812),
            builder: (context, widget) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(height: 15.h),
                    TextFontWidget.fontRegular(
                      text: '알림',
                      color: Color(0xFF000000),
                      fontSize: 18.sp,
                      fontweight: FontWeight.w600,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8.h),
                    TextFontWidget.fontRegular(
                      text: this.widget.text,
                      color: Color(0xFF767676),
                      fontSize: 14.sp,
                      fontweight: FontWeight.w400,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 15.h),
                    SizedBox.fromSize(
                      size: Size.fromHeight(1.h),
                      child: DecoratedBox(
                        decoration: BoxDecoration(color: Color(0xFFCECECE)),
                      ),
                    ),
                    TextButton(
                      onPressed: this.widget.onConfirmPressed,
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
              );
            }));
  }
}