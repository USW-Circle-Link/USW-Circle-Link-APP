import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:usw_circle_link/views/widgets/text_font_widget.dart';

class RoundedTextField extends StatelessWidget {
  final TextEditingController? textEditController;
  final double? height,
      marginLeft,
      marginTop,
      marginRight,
      marginBottom,
      leftTopCornerRadius,
      rightTopCornerRadius,
      leftBottomCornerRadius,
      rightBottomCornerRadius,
      borderWidth;

  final Color? borderColor, backgroundColor;
  final bool? isBackgroundFilled;

  final bool isAnimatedHint;
  final String? hintText;
  final TextStyle? hintStyle;

  final bool obscureText;
  final bool readOnly;
  final int? maxLines;
  final TextInputType? textInputType;
  final TextAlign? textAlign;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputAction? textInputAction;
  final Function()? onTab;
  final Function(String value)? onChanged;
  final FocusNode? focusNode;
  final TextStyle? textStyle;
  const RoundedTextField({
    Key? key,
    this.height,
    this.textEditController,
    this.marginLeft,
    this.marginTop,
    this.marginRight,
    this.marginBottom,
    this.leftTopCornerRadius,
    this.rightTopCornerRadius,
    this.leftBottomCornerRadius,
    this.rightBottomCornerRadius,
    this.borderWidth,
    this.maxLines,
    this.textInputType,
    this.textAlign,
    this.borderColor,
    this.backgroundColor,
    this.hintText,
    this.prefixIcon,
    this.textInputAction,
    this.suffixIcon,
    this.hintStyle,
    this.onTab,
    this.onChanged,
    this.isBackgroundFilled = false,
    this.isAnimatedHint = false,
    this.obscureText = false,
    this.readOnly = false,
    this.focusNode,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 56.h,
      margin: EdgeInsets.only(
        left: marginLeft ?? 0,
        top: marginTop ?? 0,
        right: marginRight ?? 0,
        bottom: marginBottom ?? 0,
      ),
      child: TextField(
        focusNode: focusNode,
        readOnly: readOnly,
        controller: textEditController,
        maxLines: maxLines,
        keyboardType: textInputType,
        textAlign: textAlign ?? TextAlign.left,
        decoration: borderWidth == null ? null : setInputDecoration(),
        onTap: onTab,
        onChanged: onChanged,
        obscureText: obscureText,
        style: textStyle,
        textInputAction: textInputAction,
      ),
    );
  }

  InputDecoration setInputDecoration() {
    return InputDecoration(
        filled: isBackgroundFilled,
        fillColor: backgroundColor,
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
            color: borderColor ?? const Color(0xffffB052),
            width: borderWidth ?? 0,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(leftTopCornerRadius ?? 0),
            topRight: Radius.circular(rightTopCornerRadius ?? 0),
            bottomLeft: Radius.circular(leftBottomCornerRadius ?? 0),
            bottomRight: Radius.circular(rightBottomCornerRadius ?? 0),
          ),
        ),
        hintText: isAnimatedHint ? "" : hintText ?? "",
        label: isAnimatedHint
            ? TextFontWidget.fontRegular(
                hintText ?? "",
              )
            : null,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintStyle: hintStyle
        //  contentPadding: EdgeInsets.only(left: 50)
        );
  }
}
