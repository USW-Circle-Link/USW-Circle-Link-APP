import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'text_font_widget.dart';

class CircleCertificateDialog extends ConsumerStatefulWidget {
  const CircleCertificateDialog({super.key});

  @override
  ConsumerState<CircleCertificateDialog> createState() =>
      _CircleCertificateDialogState();
}

class _CircleCertificateDialogState
    extends ConsumerState<CircleCertificateDialog> {
  final TextEditingController _textController = TextEditingController();
  String? _errorMessage = "test";
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Listen to certificate state changes
    // ref.listen(certificateViewModelProvider, _handleStateChange);

    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return _buildCertificateDialog();
  }

  Widget _buildCertificateDialog() {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 200),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 11, sigmaY: 11),
          child: Container(
            width: 273,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(25, 21, 29, 0.80),
              borderRadius: BorderRadius.circular(14),
            ),
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildHeader(),
                Flexible(
                  child: SingleChildScrollView(
                    child: _buildInputSection(),
                  ),
                ),
                if (_isLoading)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Center(child: CircularProgressIndicator()),
                  )
                else
                  const SizedBox(height: 8),
                _buildButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color.fromRGBO(60, 60, 67, 0.36),
            width: 0.5,
          ),
        ),
      ),
      child: const Center(
        child: Text(
          "🎃 코드 입력하기 🎃",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w400,
            color: Colors.white,
            height: 22 / 17,
            fontFamily: 'SF Pro',
          ),
        ),
      ),
    );
  }

  Widget _buildInputSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          Container(
            width: 209,
            height: 35,
            decoration: ShapeDecoration(
              color: Colors.black.withValues(alpha: 0.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            padding: const EdgeInsets.only(left: 9),
            child: TextField(
              controller: _textController,
              keyboardType: TextInputType.number,
              textAlignVertical: TextAlignVertical.center,
              enabled: !_isLoading,
              style: TextFontWidget.fontRegularStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                hintText: '인증코드 입력',
                hintStyle: TextFontWidget.fontRegularStyle(
                  fontSize: 16,
                  color: Color(0xFFA0A0A0),
                ),
                border: InputBorder.none,
                isCollapsed: true,
              ),
            ),
          ),
          if (_errorMessage != null) ...[
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextFontWidget.fontRegular(
                _errorMessage!,
                textAlign: TextAlign.center,
                color: Colors.redAccent,
                fontSize: 13,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget _buildButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildConfirmButton(),
          _buildCancelButton(),
        ],
      ),
    );
  }

  Widget _buildConfirmButton() {
    return SizedBox(
      width: 100,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: () {},
        child: TextFontWidget.fontRegular(
          "확인",
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildCancelButton() {
    return SizedBox(
      width: 100,
      height: 40,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.white54),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: _isLoading ? null : () => Navigator.pop(context),
        child: TextFontWidget.fontRegular(
          "취소",
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
