import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:usw_circle_link/utils/logger/Logger.dart';
import 'package:usw_circle_link/views/widgets/text_font_widget.dart';

class EmailTextField extends StatefulWidget {
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final bool enabled;
  EmailTextField({this.controller, this.onChanged, this.enabled = true});
  @override
  _EmailTextFieldState createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  double _textWidth = 0.0;
  double _suffixWidth = 0.0;
  double _hintTextWidth = 0.0;
  final String _hintText = '포털 이메일 입력';
  final String _suffixText = '@suwon.ac.kr';
  final TextStyle _suffixTextStyle = TextFontWidget.fontRegularStyle(
    fontSize: 16.0,
    color: Color(0xFF6F6F6F),
    fontWeight: FontWeight.w300,
  );
  final TextStyle _hintTextStyle = TextFontWidget.fontRegularStyle(
    fontSize: 16.0,
    color: Color(0xFF6F6F6F),
    fontWeight: FontWeight.w300,
  );

  @override
  void initState() {
    super.initState();
    widget.controller?.addListener(_updateWidth);
    _calculateSuffixWidth();
    _calculateHintTextWidth();
  }

  void _updateWidth() {
    final text = widget.controller?.text ?? '';
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: TextStyle(fontSize: 16.0)),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();

    setState(() {
      _textWidth = textPainter.size.width;
    });
  }

  void _calculateSuffixWidth() {
    final textPainter = TextPainter(
      text: TextSpan(
        text: _suffixText,
        style: _suffixTextStyle,
      ),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();

    _suffixWidth = textPainter.size.width;
    logger.d('suffixWidth: $_suffixWidth');
  }

  void _calculateHintTextWidth() {
    final textPainter = TextPainter(
      text: TextSpan(
        text: _hintText,
        style: _hintTextStyle,
      ),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();

    _hintTextWidth = textPainter.size.width;
    logger.d('hintTextWidth: $_hintTextWidth');
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double maxWidth =
            constraints.maxWidth - _suffixWidth - 10.w; // 여유 공간 확보
        return Row(
          children: [
            Container(
              width: widget.controller?.text.isEmpty ?? true
                  ? _hintTextWidth.w
                  : _textWidth.w > maxWidth
                      ? maxWidth
                      : _textWidth.w,
              child: TextField(
                enabled: widget.enabled,
                onChanged: (value) {
                  widget.onChanged?.call(value);
                },
                controller: widget.controller,
                decoration: InputDecoration(
                  hintText: _hintText,
                  border: InputBorder.none,
                ),
                style: _hintTextStyle,
              ),
            ),
            Text(
              _suffixText,
              style: _suffixTextStyle.copyWith(
                color: widget.controller?.text.isEmpty ?? true
                    ? Color(0xFFB8B8B8)
                    : Color(0xFF6F6F6F),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    widget.controller?.removeListener(_updateWidth);
    super.dispose();
  }
}
