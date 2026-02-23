// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:usw_circle_link/widgets/rounded_dropdown/rounded_dropdown.dart';
import 'package:usw_circle_link/const/app_theme.dart';
import 'package:usw_circle_link/widgets/text_font_widget/text_font_widget.dart';

class MajorPickerDialog extends StatefulWidget {
  MajorPickerDialog({
    Key? key,
    required this.colleges,
    required this.majors,
    this.selectedCollege,
    this.selectedMajor,
    this.onChanged,
    required this.onConfirmPressed,
  }) : super(key: key);

  final List<String> colleges;
  final Map<String, List<String>> majors;
  String? selectedCollege, selectedMajor;
  final void Function(String? newCollege, String? newMajor)? onChanged;
  final void Function(String? college, String? major) onConfirmPressed;

  @override
  _MajorPickerDialogState createState() => _MajorPickerDialogState();
}

class _MajorPickerDialogState extends State<MajorPickerDialog> {
  final GlobalKey<FormFieldState> _key = GlobalKey<FormFieldState>();
  bool isUserChange = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appColors = theme.extension<AppColors>()!;
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Material(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(15),
        clipBehavior: Clip.antiAlias,
        child: SingleChildScrollView(
          padding: EdgeInsets.zero,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              RoundedDropdown(
                initValue: widget.selectedCollege,
                onChanged: (String? newValue) {
                  isUserChange = false;
                  _key.currentState!.reset();
                  isUserChange = true;
                  setState(() {
                    widget
                      ..selectedMajor = null
                      ..selectedCollege = newValue;
                  });
                  widget.onChanged
                      ?.call(widget.selectedCollege, widget.selectedMajor);
                },
                items: widget.colleges
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: TextFontWidget.fontRegular(
                      value,
                      color: theme.colorScheme.onSurface,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      height: 0.1,
                    ),
                  );
                }).toList(),
                hintText: '단과대학 선택',
                leftTopCornerRadius: 8,
                leftBottomCornerRadius: 8,
                rightTopCornerRadius: 8,
                rightBottomCornerRadius: 8,
                borderColor: appColors.borderColor,
                borderWidth: 1,
                marginTop: 32,
                marginLeft: 16,
                marginRight: 16,
                hintTextStyle: TextStyle(
                  color: appColors.badgeText,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 0.1,
                ),
              ),
              const SizedBox(height: 8),
              RoundedDropdown(
                globalKey: _key,
                initValue: widget.selectedMajor,
                onChanged: (String? newValue) {
                  if (isUserChange) {
                    widget
                      ..selectedMajor = newValue
                      ..onChanged?.call(widget.selectedCollege, newValue);
                  }
                },
                items: (widget.majors[widget.selectedCollege] ?? [])
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: TextFontWidget.fontRegular(
                      value,
                      color: theme.colorScheme.onSurface,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      height: 0.1,
                    ),
                  );
                }).toList(),
                hintText: '학부(학과) 선택',
                leftTopCornerRadius: 8,
                leftBottomCornerRadius: 8,
                rightTopCornerRadius: 8,
                rightBottomCornerRadius: 8,
                borderColor: appColors.borderColor,
                borderWidth: 1,
                marginLeft: 16,
                marginRight: 16,
                hintTextStyle: TextStyle(
                  color: appColors.badgeText,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 0.1,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 1,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: appColors.borderColor),
                ),
              ),
              TextButton(
                onPressed: () {
                  widget.onConfirmPressed(
                      widget.selectedCollege, widget.selectedMajor);
                  Navigator.of(context).pop();
                },
                style: TextButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.zero,
                      bottom: Radius.circular(15),
                    ),
                  ),
                ),
                child: TextFontWidget.fontRegular(
                  "확인",
                  color: appColors.linkColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
