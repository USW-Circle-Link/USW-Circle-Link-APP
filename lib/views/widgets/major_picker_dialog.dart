import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:usw_circle_link/views/widgets/rounded_dropdown.dart';
import 'package:usw_circle_link/views/widgets/text_font_widget.dart';

// ignore: must_be_immutable
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
    return Dialog(
      child: ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, _widget) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                color: Colors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
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
                          text: value,
                          color: Color(0xFF000000),
                          fontSize: 14.sp,
                          fontweight: FontWeight.w400,
                        ),
                      );
                    }).toList(),
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
                    globalKey: _key,
                    initValue: widget.selectedMajor,
                    onChanged: (String? newValue) {
                      if (isUserChange) { // 단과대학 변경 시 state reset 에서도 onChanged 가 호출됨!
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
                          text: value,
                          color: Color(0xFF000000),
                          fontSize: 14.sp,
                          fontweight: FontWeight.w400,
                        ),
                      );
                    }).toList(),
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
                      widget.onConfirmPressed(
                          widget.selectedCollege, widget.selectedMajor);
                      Navigator.of(context).pop();
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
            );
          }),
    );
  }
}
