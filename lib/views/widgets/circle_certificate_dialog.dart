import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../viewmodels/certificate_view_model.dart';

// 전역 선언
final TextEditingController _textController = TextEditingController();
final FlutterSecureStorage storage = FlutterSecureStorage();

//  메시지 상태 관리
final certificateMessageProvider = StateProvider<String?>((ref) => null);

class CircleCertificateDialog extends ConsumerWidget {
  const CircleCertificateDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final message = ref.watch(certificateMessageProvider);

    return FutureBuilder<String?>(
      future: storage.read(key: 'is_certificated'),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }

        // ✅ 이미 인증된 경우
        if (snapshot.data == 'true') {
          return _buildSimpleAlert(context, "이미 입장 처리된 회원 입니다.", true);
        }

        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding:
          const EdgeInsets.symmetric(horizontal: 40, vertical: 200),
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
                    ),

                    // 아이콘 (성공/실패/기본)
                    // Center(
                    //   child: Icon(
                    //     message == null
                    //         ? Icons.lock_outline
                    //         : message.contains("성공")
                    //           ? Icons.verified_rounded
                    //           : Icons.error_outline_rounded,
                    //     size: 50,
                    //   ),
                    // ),

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
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'SUIT',
                                fontWeight: FontWeight.w400,
                              ),
                              cursorColor: Colors.white,
                              decoration: const InputDecoration(
                                hintText: 'xxxx...',
                                hintStyle: TextStyle(
                                  color: Color(0xFFA0A0A0),
                                  fontSize: 16,
                                  fontFamily: 'SUIT',
                                  fontWeight: FontWeight.w400,
                                ),
                                border: InputBorder.none,
                                isCollapsed: true,
                              ),
                            ),
                          ),

                          // 하단 메시지 출력 부분
                          if (message != null) ...[
                            const SizedBox(height: 6),
                            Text(
                              message,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: message.contains("성공")
                                    ? Colors.greenAccent
                                    : Colors.redAccent,
                                fontSize: 13,
                              ),
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
                          _buildButton(context, ref, "확인", true),
                          _buildButton(context, ref, "취소", false),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  /// 버튼 빌더
  Widget _buildButton(
      BuildContext context, WidgetRef ref, String text, bool isConfirm) {
    return SizedBox(
      width: 100,
      height: 40,
      child: isConfirm
          ? ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: () async {
          final codeText = _textController.text.trim();
          final code = int.tryParse(codeText) ?? 0;


          final success = await ref
              .read(certificateViewModelProvider.notifier)
              .certificate(code: code);

              if(success) {
                await storage.write(key: 'is_certificated', value: 'true');
                ref.read(certificateMessageProvider.notifier)
                    .state = "회원 인증을 성공했습니다!";
                //Navigator.of(context).pop();
                showDialog(
                    context: context,
                    builder: (context) => _buildSimpleAlert(context, "팔찌를 받아 입장해주세요.", false),
                    );
              } else {
                /// 그 외 실패(인증 코드 틀렸 거나 소속된 동아리 없을 경우)
                final state = ref.read(certificateViewModelProvider);
                state.whenOrNull(
                    error: (err, _) => ref.read(certificateMessageProvider.notifier)
                        .state = err.toString(),
                );
              }


        },
        child: const Text(
          "확인",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      )
          : OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.white54),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: () => Navigator.pop(context),
        child: const Text(
          "취소",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }


  Widget _buildSimpleAlert(BuildContext context, String msg, bool already) {
    if(already == false) {
      return Dialog(
        backgroundColor: Colors.white,
        insetPadding:
        const EdgeInsets.symmetric(horizontal: 40, vertical: 200),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Container(
            width: 240,
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,

              children: [
                const Text("👻 확인완료 👻",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 20),
                Text(msg, textAlign: TextAlign.center),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("확인",),
                )
              ],
            ),
          ),
        ),
      );
    } else {
      return Dialog(
        backgroundColor: Colors.white,
        insetPadding:
        const EdgeInsets.symmetric(horizontal: 40, vertical: 200),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Container(
            width: 240,
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,

              children: [
                const Text("이미 입장됨.",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 20),
                Text(msg, textAlign: TextAlign.center),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("확인",),
                )
              ],
            ),
          ),
        ),
      );
    };

  }
}
