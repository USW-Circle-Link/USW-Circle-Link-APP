import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:usw_circle_link/views/widgets/text_font_widget.dart';

class RoundedTextField extends StatefulWidget {
  final TextEditingController? textEditController;
  final double? height,
      marginLeft,
      marginTop,
      marginRight,
      marginBottom,
      paddingLeft,
      paddingRight,
      paddingTop,
      paddingBottom,
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
    this.paddingLeft,
    this.paddingRight,
    this.paddingTop,
    this.paddingBottom,
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
  _RoundedTextFieldState createState() => _RoundedTextFieldState();
}

class _RoundedTextFieldState extends State<RoundedTextField> {
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? 56.h,
      margin: EdgeInsets.only(
        left: widget.marginLeft ?? 0,
        top: widget.marginTop ?? 0,
        right: widget.marginRight ?? 0,
        bottom: widget.marginBottom ?? 0,
      ),
      padding: EdgeInsets.only(
        left: widget.paddingLeft ?? 12.w,
        right: widget.paddingRight ?? 12.w,
        top: widget.paddingTop ?? 0,
        bottom: widget.paddingBottom ?? 0,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: _focusNode.hasFocus
              ? (widget.borderColor ?? const Color(0xffffB052))
              : (widget.borderColor ?? const Color(0xFFDBDBDB)),
          width: widget.borderWidth ?? 0,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(widget.leftTopCornerRadius ?? 0),
          topRight: Radius.circular(widget.rightTopCornerRadius ?? 0),
          bottomLeft: Radius.circular(widget.leftBottomCornerRadius ?? 0),
          bottomRight: Radius.circular(widget.rightBottomCornerRadius ?? 0),
        ),
      ),
      child: Row(
        children: [
          widget.prefixIcon ?? Container(),
          Expanded(
            child: TextField(
              focusNode: _focusNode,
              readOnly: widget.readOnly,
              controller: widget.textEditController,
              maxLines: widget.maxLines,
              keyboardType: widget.textInputType,
              textAlign: widget.textAlign ?? TextAlign.left,
              decoration:
                  widget.borderWidth == null ? null : setInputDecoration(),
              onTap: widget.onTab,
              onChanged: widget.onChanged,
              obscureText: widget.obscureText,
              style: widget.textStyle,
              textInputAction: widget.textInputAction,
            ),
          ),
          widget.suffixIcon ?? Container(),
        ],
      ),
    );
  }

  InputDecoration setInputDecoration() {
    return InputDecoration(
      filled: widget.isBackgroundFilled,
      fillColor: widget.backgroundColor,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
      ),
      hintText: widget.isAnimatedHint ? "" : widget.hintText ?? "",
      label: widget.isAnimatedHint
          ? TextFontWidget.fontRegular(
              widget.hintText ?? "",
            )
          : null,
      hintStyle: widget.hintStyle,
      isDense: true,
    );
  }
}
