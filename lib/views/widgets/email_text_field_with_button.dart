import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:usw_circle_link/const/data.dart';
import 'package:usw_circle_link/views/widgets/email_text_field.dart';
import 'package:usw_circle_link/views/widgets/text_font_widget.dart';

class EmailTextFieldWithButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final TextEditingController? controller;
  const EmailTextFieldWithButton({
    super.key,
    this.onPressed,
    this.controller,
  });
  @override
  _EmailTextFieldWithButtonState createState() =>
      _EmailTextFieldWithButtonState();
}

class _EmailTextFieldWithButtonState extends State<EmailTextFieldWithButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFB8B8B8), // 밑줄 색상
            width: 1.0, // 밑줄 두께
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: EmailTextField(
              controller: widget.controller,
            ),
          ),
          SizedBox(width: 10.w), // 버튼과 텍스트 필드 사이의 간격
          TextButton(
            onPressed: widget.onPressed,
            style: TextButton.styleFrom(
              backgroundColor:
                  widget.onPressed == null ? Colors.transparent : accentColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.r),
              ),
              visualDensity: VisualDensity.compact,
              foregroundColor: Colors.white,
            ),
            child: TextFontWidget.fontRegular(
              '인증 확인',
              fontSize: 12.sp,
              color:
                  widget.onPressed == null ? Color(0xFFB8B8B8) : Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
