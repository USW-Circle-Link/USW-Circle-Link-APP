import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:usw_circle_link/views/widgets/TextFontWidget.dart';

class RoundedDropdown extends StatelessWidget {
  final double? marginLeft,
      marginTop,
      marginRight,
      marginBottom,
      leftTopCornerRadius,
      rightTopCornerRadius,
      leftBottomCornerRadius,
      rightBottomCornerRadius,
      borderWidth;
  final String? hintText;
  final List<String> items;
  final Color? borderColor, backgroundColor;
  final bool isBackgroundFilled;

  final Function(String? value) onChanged;

  const RoundedDropdown(
      {Key? key,
      this.marginLeft,
      this.marginTop,
      this.marginRight,
      this.marginBottom,
      this.leftTopCornerRadius,
      this.rightTopCornerRadius,
      this.leftBottomCornerRadius,
      this.rightBottomCornerRadius,
      this.borderWidth,
      this.hintText,
      required this.items,
      this.borderColor,
      this.backgroundColor,
      this.isBackgroundFilled = false, 
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      margin: EdgeInsets.only(
        left: marginLeft ?? 0,
        top: marginTop ?? 0,
        right: marginRight ?? 0,
        bottom: marginBottom ?? 0,
      ),
      child: DropdownButtonFormField<String>(
        decoration: setInputDecoration(),
        icon: Align(
          alignment: Alignment.centerRight,
          child: SvgPicture.asset(
            'assets/images/ic_down.svg',
            height: 32.h,
            width: 32.w,
            fit: BoxFit.cover,
          ),
        ),
        hint: TextFontWidget.fontRegular(
          text: hintText ?? "",
          color: Color(0xFFCECECE),
          fontSize: 14.sp,
          fontweight: FontWeight.w400,
        ),
        value: null,
        onChanged: onChanged,
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: TextFontWidget.fontRegular(
              text: value,
              color: Color(0xFF000000),
              fontSize: 14.sp,
              fontweight: FontWeight.w400,
            ),
          );
        }).toList(),
      ),
    );
  }

  InputDecoration setInputDecoration() {
    return InputDecoration(
      isDense: true,
      contentPadding: EdgeInsets.only(left : 16.w,top:16.h,bottom:8.h),
      filled: isBackgroundFilled,
      fillColor: backgroundColor ?? Colors.white,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: borderColor ?? const Color(0xFFDBDBDB),
          width: borderWidth ?? 0, // borderWidth must not be null!
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(leftTopCornerRadius ?? 0),
          topRight: Radius.circular(rightTopCornerRadius ?? 0),
          bottomLeft: Radius.circular(leftBottomCornerRadius ?? 0),
          bottomRight: Radius.circular(rightBottomCornerRadius ?? 0),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: borderColor ?? const Color(0xFFDBDBDB),
          width: borderWidth ?? 0, // borderWidth must not be null!
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(leftTopCornerRadius ?? 0),
          topRight: Radius.circular(rightTopCornerRadius ?? 0),
          bottomLeft: Radius.circular(leftBottomCornerRadius ?? 0),
          bottomRight: Radius.circular(rightBottomCornerRadius ?? 0),
        ),
      ),
      hintText: hintText ?? "",
      //  contentPadding: EdgeInsets.only(left: 50)
    );
  }
}
