import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:usw_circle_link/utils/icons/sign_up_icons_icons.dart';

class RoundedDropdown extends StatelessWidget {
  final GlobalKey<FormFieldState>? globalKey;
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
  final List<DropdownMenuItem<String>> items;
  final Color? borderColor, backgroundColor;
  final bool isBackgroundFilled;
  final String? initValue;
  final TextStyle? hintTextStyle;

  final Function(String? value) onChanged;

  const RoundedDropdown({
    Key? key,
    this.globalKey,
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
    required this.onChanged,
    this.initValue,
    this.hintTextStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      margin: EdgeInsets.only(
        left: marginLeft ?? 0,
        top: marginTop ?? 0,
        right: marginRight ?? 0,
        bottom: marginBottom ?? 0,
      ),
      child: DropdownButtonFormField<String>(
        alignment: Alignment.centerLeft,
        dropdownColor: Colors.white,
        key: globalKey,
        decoration: setInputDecoration(),
        icon: Icon(
          SignUpIcons.ic_down_arrow,
          color: Color(0xFF989898),
        ),
        iconSize: 7,
        hint: AutoSizeText(
          hintText ?? "",
          style: hintTextStyle,
        ),
        value: initValue,
        onChanged: onChanged,
        items: items,
        isExpanded: true,
      ),
    );
  }

  InputDecoration setInputDecoration() {
    return InputDecoration(
      isDense: false,
      contentPadding: EdgeInsets.fromLTRB(16, 16, 16, 8),
      filled: isBackgroundFilled,
      fillColor: backgroundColor ?? Colors.white,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: borderColor ?? const Color(0xFFCECECE),
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
          color: borderColor ?? const Color(0xFFCECECE),
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
