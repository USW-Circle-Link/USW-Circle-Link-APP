import 'package:flutter/material.dart';
import 'package:usw_circle_link/utils/logger/Logger.dart';

class DynamicWidthTextField extends StatefulWidget {
  @override
  _DynamicWidthTextFieldState createState() => _DynamicWidthTextFieldState();
}

class _DynamicWidthTextFieldState extends State<DynamicWidthTextField> {
  final TextEditingController _controller = TextEditingController();
  double _textWidth = 0.0;
  double _suffixWidth = 0.0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_updateWidth);
    _calculateSuffixWidth();
  }

  void _updateWidth() {
    final text = _controller.text;
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
      text: TextSpan(text: '@suwon.ac.kr', style: TextStyle(fontSize: 16.0)),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();

    _suffixWidth = textPainter.size.width;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          double maxWidth =
              constraints.maxWidth - _suffixWidth - 100.0; // 여유 공간 확보
          return Row(
            children: [
              Container(
                width:
                    _textWidth + 20.0 > maxWidth ? maxWidth : _textWidth + 20.0,
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Enter your ID',
                    border: InputBorder.none,
                  ),
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              SizedBox(width: 10.0),
              Text(
                '@suwon.ac.kr',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.removeListener(_updateWidth);
    _controller.dispose();
    super.dispose();
  }
}
