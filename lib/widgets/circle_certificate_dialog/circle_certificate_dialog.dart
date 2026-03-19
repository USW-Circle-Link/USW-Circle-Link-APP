import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../viewmodels/event_certificate_view_model.dart';
import '../text_font_widget/text_font_widget.dart';

class CircleCertificateDialog extends ConsumerStatefulWidget {
  const CircleCertificateDialog({super.key});

  @override
  ConsumerState<CircleCertificateDialog> createState() =>
      _CircleCertificateDialogState();
}

class _CircleCertificateDialogState
    extends ConsumerState<CircleCertificateDialog> {
  final TextEditingController _textController = TextEditingController();

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
    return _buildCertificateDialog(context);
  }

  Widget _buildCertificateDialog(BuildContext context) {
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
      child: Center(
        child: TextFontWidget.fontRegular(
          "🎃 코드 입력하기 🎃",
          textAlign: TextAlign.center,
          fontSize: 17,
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _buildInputSection() {
    final isLoading = ref.watch(
        eventCertificateViewModelProvider.select((state) => state.isLoading));
    final error = ref.watch(
        eventCertificateViewModelProvider.select((state) => state.error));
    final isSuccess = ref.watch(
        eventCertificateViewModelProvider.select((state) => state.isSuccess));
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
              enabled: !isLoading,
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
          if (error != null || isSuccess == true) ...[
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextFontWidget.fontRegular(
                isSuccess == true ? "🥳🎉👏 인증 완료 🥳🎉👏" : error!,
                textAlign: TextAlign.center,
                color:
                    isSuccess == true ? Colors.greenAccent : Colors.redAccent,
                fontSize: 14,
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
    final isSuccess = ref.watch(
        eventCertificateViewModelProvider.select((state) => state.isSuccess));
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          if (isSuccess == false) ...[
            _buildConfirmButton(),
          ],
          _buildCancelButton(),
        ],
      ),
    );
  }

  Widget _buildConfirmButton() {
    final isLoading = ref.watch(
        eventCertificateViewModelProvider.select((state) => state.isLoading));
    return SizedBox(
      width: 100,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).cardColor,
          disabledBackgroundColor: Theme.of(context).cardColor.withOpacity(0.5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: isLoading
            ? null
            : () async {
                await ref
                    .read(eventCertificateViewModelProvider.notifier)
                    .verify(_textController.text);
              },
        child: TextFontWidget.fontRegular(
          isLoading ? "로딩중..." : "확인",
          color: Theme.of(context).colorScheme.onSurface,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildCancelButton() {
    final isSuccess = ref.watch(
        eventCertificateViewModelProvider.select((state) => state.isSuccess));
    return SizedBox(
      width: 100,
      height: 40,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.white54),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: () => Navigator.pop(context),
        child: TextFontWidget.fontRegular(
          isSuccess == true ? "입장하기" : "취소",
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
