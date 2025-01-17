import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:usw_circle_link/views/widgets/text_font_widget.dart';

class AlertTextDialog extends StatefulWidget {
  const AlertTextDialog({
    Key? key,
    this.title,
    this.content,
    this.onLeftButtonPressed,
    this.onRightButtonPressed,
    this.leftButtonText,
    this.rightButtonText,
    this.titleColor = const Color(0xFF000000), // 기본 색상 설정
    this.contentColor = const Color(0xFF767676), // 기본 색상 설정
    this.leftButtonColor = const Color(0xFF0085FF), // 기본 색상 설정
    this.rightButtonColor = const Color(0xFF0085FF), // 기본 색상 설정
  }) : super(key: key);

  final String? title;
  final String? content;
  final void Function()? onLeftButtonPressed, onRightButtonPressed;
  final String? leftButtonText, rightButtonText;

  // 텍스트 색상을 동적으로 설정하기 위한 파라미터
  final Color titleColor;
  final Color contentColor;
  final Color leftButtonColor;
  final Color rightButtonColor;

  @override
  _AlertTextDialogState createState() => _AlertTextDialogState();
}

class _AlertTextDialogState extends State<AlertTextDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, _) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 15.h,
                    horizontal: 15.h,
                  ),
                  child: Column(
                    children: [
                      if (widget.title != null)
                        Container(
                          margin: EdgeInsets.only(bottom: 8.h),
                          child: TextFontWidget.fontRegular(
                            widget.title!,
                            color: widget.titleColor, // 제목 색상 적용
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w800,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      if (widget.content != null)
                        TextFontWidget.fontRegular(
                          widget.content!,
                          color: widget.contentColor, // 내용 색상 적용
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.center,
                        ),
                    ],
                  ),
                ),
                SizedBox.fromSize(
                  size: Size.fromHeight(0.5.h),
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Color(0xFFCECECE)),
                  ),
                ),
                if (widget.leftButtonText != null &&
                    widget.rightButtonText != null)
                  SizedBox(
                    height: 56.h,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              widget.onLeftButtonPressed?.call();
                              Navigator.of(context).pop();
                            },
                            style: TextButton.styleFrom(
                              minimumSize: Size.fromHeight(56.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(15.r)),
                              ),
                            ),
                            child: TextFontWidget.fontRegular(
                              widget.leftButtonText!,
                              color: widget.leftButtonColor, // 왼쪽 버튼 색상 적용
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 0.5.w,
                          height: double.infinity,
                          child: DecoratedBox(
                            decoration: BoxDecoration(color: Color(0xFFCECECE)),
                          ),
                        ),
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              widget.onRightButtonPressed?.call();
                              Navigator.of(context).pop();
                            },
                            style: TextButton.styleFrom(
                              minimumSize: Size.fromHeight(56.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(15.r)),
                              ),
                            ),
                            child: TextFontWidget.fontRegular(
                              widget.rightButtonText!,
                              color: widget.rightButtonColor, // 오른쪽 버튼 색상 적용
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                else
                  TextButton(
                    onPressed: () {
                      widget.onLeftButtonPressed?.call();
                      Navigator.of(context).pop();
                    },
                    style: TextButton.styleFrom(
                      minimumSize: Size.fromHeight(50.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                            top: Radius.zero, bottom: Radius.circular(15.r)),
                      ),
                    ),
                    child: TextFontWidget.fontRegular(
                      widget.leftButtonText!,
                      color: widget.leftButtonColor, // 기본 버튼 색상 적용
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
