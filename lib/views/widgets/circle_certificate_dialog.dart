import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:usw_circle_link/views/widgets/text_font_widget.dart';
import '../../viewmodels/main_view_model.dart';

// 전역 선언
final TextEditingController _textController = TextEditingController();

class CircleCertificateDialog extends ConsumerWidget {
  const CircleCertificateDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(certificateViewModelProvider);
    final isLoading = state.isLoading;

    // '명령' 스트림 구독 (1회성 다이얼로그 표시에 사용)
    ref.listen<AsyncValue<String>>(
      certificateCommandProvider,

          (previous, next) {
            if (next.hasValue) {
              final message = next.value!; // 👈 '명령'으로 전달된 메시지

              Navigator.of(context).pop(); // 현재 다이얼로그 닫기
              showDialog(
                context: context,
                builder: (context) =>
                    _buildSimpleAlert(context, message, false),
              );
            };
          }
    );


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
            height: 223,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(25, 21, 29, 0.80),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // 제목
                Container(
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
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      height: 22 / 17,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
                  child: Column(
                    children: [
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
                          style: TextFontWidget.fontRegularStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            hintText: 'xxxx...',
                            hintStyle: TextFontWidget.fontRegularStyle(
                              color: Color(0xFFA0A0A0),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                            border: InputBorder.none,
                            isCollapsed: true,
                          ),
                        ),
                      ),

                      // 에러 메시지 출력
                      if (state.hasError) ...[
                        const SizedBox(height: 6),
                        TextFontWidget.fontRegular(
                          state.hasError.toString(),
                          textAlign: TextAlign.center,
                          color: Colors.redAccent,
                          fontSize: 13,
                        ),
                      ],
                    ],
                  ),
                ),

                const Spacer(),

                // 버튼
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildButton(context, ref, "확인", true, isLoading),
                      _buildButton(context, ref, "취소", false, isLoading),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 버튼 빌더
  Widget _buildButton(BuildContext context, WidgetRef ref, String text,
      bool isConfirm, bool isLoading) {
    return SizedBox(
      width: 100,
      height: 40,
      child: isConfirm
          ? ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: isLoading
            ? null
            : () {
          final codeText = _textController.text.trim();
          final code = int.tryParse(codeText) ?? 0;
          ref
              .read(certificateViewModelProvider.notifier)
              .certificate(code: code);
        },
        child: isLoading
            ? const SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: Colors.black,
          ),
        )
            : TextFontWidget.fontRegular(
          "확인",
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
      )
          : OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.white54),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () => Navigator.pop(context),
        child: TextFontWidget.fontRegular(
          "취소",
          color: Colors.white,
        ),
      ),
    );
  }

  /// 단순 알림 다이얼로그
  Widget _buildSimpleAlert(BuildContext context, String msg, bool already) {
    return Dialog(
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 200),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Container(
          width: 240,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFontWidget.fontRegular(
                already ? "이미 입장됨." : "👻 확인완료 👻",
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              const SizedBox(height: 20),
              TextFontWidget.fontRegular(msg, textAlign: TextAlign.center),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: TextFontWidget.fontRegular("확인"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
