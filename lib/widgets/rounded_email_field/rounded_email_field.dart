import 'package:flutter/material.dart';
import 'package:usw_circle_link/widgets/email_text_field/email_text_field.dart';
import 'package:usw_circle_link/widgets/text_font_widget/text_font_widget.dart';

class RoundedEmailField extends StatefulWidget {
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
  final Function(String value)? onChanged;
  final FocusNode? focusNode;
  final TextStyle? textStyle;
  const RoundedEmailField({
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
    this.onChanged,
    this.isBackgroundFilled = false,
    this.isAnimatedHint = false,
    this.obscureText = false,
    this.readOnly = false,
    this.focusNode,
    this.textStyle,
  }) : super(key: key);

  @override
  _RoundedEmailFieldState createState() => _RoundedEmailFieldState();
}

class _RoundedEmailFieldState extends State<RoundedEmailField> {
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
      height: widget.height ?? 56.0,
      margin: EdgeInsets.only(
        left: widget.marginLeft ?? 0,
        top: widget.marginTop ?? 0,
        right: widget.marginRight ?? 0,
        bottom: widget.marginBottom ?? 0,
      ),
      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
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
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: EmailTextField(
              focusNode: _focusNode,
              controller: widget.textEditController,
              textAlign: widget.textAlign ?? TextAlign.left,
              decoration:
              widget.borderWidth == null ? null : setInputDecoration(),
              onChanged: widget.onChanged,
              obscureText: widget.obscureText,
              hintTextStyle: widget.hintStyle,
              textInputAction: widget.textInputAction,
              textInputType: widget.textInputType,
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
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        hintText: widget.isAnimatedHint ? "" : widget.hintText ?? "",
        label: widget.isAnimatedHint
            ? TextFontWidget.fontRegular(
          widget.hintText ?? "",
        )
            : null,
        hintStyle: widget.hintStyle);
  }
}