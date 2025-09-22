import 'package:flutter/material.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';
import 'package:usw_circle_link/views/widgets/text_font_widget.dart';

class EmailTextField extends StatefulWidget {
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final bool enabled;
  final String? hintText;
  final TextStyle? hintTextStyle;
  final String? suffixText;
  final TextStyle? suffixTextStyle;
  final FocusNode? focusNode;
  final bool readOnly;
  final int maxLines;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final InputDecoration? decoration;
  const EmailTextField({
    super.key,
    this.controller,
    this.onChanged,
    this.enabled = true,
    this.hintText,
    this.hintTextStyle,
    this.suffixText,
    this.suffixTextStyle,
    this.focusNode,
    this.readOnly = false,
    this.maxLines = 1,
    this.textInputType,
    this.textInputAction,
    this.obscureText = false,
    this.textStyle,
    this.textAlign,
    this.decoration,
  });
  @override
  _EmailTextFieldState createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  double _textWidth = 0.0;
  double _suffixWidth = 0.0;
  double _hintTextWidth = 0.0;
  String _hintText = '포털 이메일 입력';
  String _suffixText = '@suwon.ac.kr';
  TextStyle _suffixTextStyle = TextFontWidget.fontRegularStyle(
    fontSize: 16.0,
    color: const Color(0xFF6F6F6F),
    fontWeight: FontWeight.w300,
  );
  TextStyle _hintTextStyle = TextFontWidget.fontRegularStyle(
    fontSize: 16.0,
    color: const Color(0xFF6F6F6F),
    fontWeight: FontWeight.w300,
  );

  @override
  void initState() {
    super.initState();
    _hintText = widget.hintText ?? _hintText;
    _suffixText = widget.suffixText ?? _suffixText;
    _hintTextStyle = widget.hintTextStyle ?? _hintTextStyle;
    _suffixTextStyle = widget.suffixTextStyle ?? _suffixTextStyle;
    widget.controller?.addListener(_updateWidth);
    _calculateSuffixWidth();
    _calculateHintTextWidth();
  }

  void _updateWidth() {
    final text = widget.controller?.text ?? '';
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: _hintTextStyle),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();

    setState(() {
      _textWidth = textPainter.size.width + 5; // 여유 공간 확보
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
        double maxWidth = constraints.maxWidth - _suffixWidth - 20; // 여유 공간 확보
        double textFieldWidth = 0;
        if (widget.controller?.text.isEmpty ?? true) {
          textFieldWidth =
          _hintTextWidth > maxWidth ? maxWidth : _hintTextWidth;
        } else {
          textFieldWidth = _textWidth > maxWidth ? maxWidth : _textWidth;
        }
        return Row(
          children: [
            SizedBox(
              width: textFieldWidth, // .w 확장자 제거
              child: TextField(
                focusNode: widget.focusNode,
                enabled: widget.enabled,
                onChanged: (value) {
                  widget.onChanged?.call(value);
                },
                controller: widget.controller,
                decoration: InputDecoration(
                  hintText: _hintText,
                  hintStyle: _hintTextStyle, // 힌트 텍스트 스타일
                  border: InputBorder.none,
                ),
                style: _hintTextStyle, // 텍스트 필드 스타일
                readOnly: widget.readOnly,
                maxLines: widget.maxLines,
                keyboardType: widget.textInputType,
                textInputAction: widget.textInputAction,
                obscureText: widget.obscureText,
              ),
            ),
            Text(
              _suffixText,
              style: _suffixTextStyle.copyWith(
                color: widget.controller?.text.isEmpty ?? true
                    ? const Color(0xFFB8B8B8)
                    : const Color(0xFF6F6F6F),
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