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
    this.rightButtonTextStyle,
    this.leftButtonTextStyle,
    this.canPop = true,
    this.onPopInvoked,
  }) : super(key: key);

  final String? title;
  final String? content;
  final void Function()? onLeftButtonPressed, onRightButtonPressed;
  final String? leftButtonText, rightButtonText;
  final TextStyle? rightButtonTextStyle, leftButtonTextStyle;
  final bool canPop;
  final void Function()? onPopInvoked;
  @override
  _AlertTextDialogState createState() => _AlertTextDialogState();
}

class _AlertTextDialogState extends State<AlertTextDialog> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: widget.canPop,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          widget.onPopInvoked?.call();
        }
      },
      child: Dialog(
        child: Container(
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
                    ...[
                      if (widget.title != null)
                        Container(
                          margin: EdgeInsets.only(
                              bottom: widget.content != null ? 8.h : 0),
                          child: TextFontWidget.fontRegular(
                            widget.title!,
                            color: Color(0xFF000000),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w800,
                            textAlign: TextAlign.center,
                          ),
                        ),
                    ],
                    if (widget.content != null)
                      TextFontWidget.fontRegular(
                        widget.content!,
                        color: Color(0xFF767676),
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
                            foregroundColor: Color(0xFF0085FF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15.r)),
                            ),
                          ),
                          child: Text(
                            widget.leftButtonText!,
                            style: widget.leftButtonTextStyle ??
                                TextFontWidget.fontRegularStyle(
                                  fontSize: 18.sp,
                                  color: Color(0xFF0085FF),
                                  fontWeight: FontWeight.w800,
                                ),
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
                            foregroundColor: Color(0xFF0085FF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(15.r)),
                            ),
                          ),
                          child: Text(
                            widget.rightButtonText!,
                            style: widget.rightButtonTextStyle ??
                                TextFontWidget.fontRegularStyle(
                                  fontSize: 18.sp,
                                  color: Color(0xFF0085FF),
                                  fontWeight: FontWeight.w800,
                                ),
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
                    foregroundColor: Color(0xFF0085FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                          top: Radius.zero, bottom: Radius.circular(15.r)),
                    ),
                  ),
                  child: Text(
                    widget.leftButtonText!,
                    style: widget.leftButtonTextStyle ??
                        TextFontWidget.fontRegularStyle(
                          fontSize: 18.sp,
                          color: Color(0xFF0085FF),
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
