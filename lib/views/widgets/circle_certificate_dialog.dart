import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../viewmodels/certificate_view_model.dart';
import '../../utils/logger/logger.dart';

class CircleCertificateDialog extends ConsumerStatefulWidget {
  const CircleCertificateDialog({super.key});

  @override
  ConsumerState<CircleCertificateDialog> createState() => _CircleCertificateDialogState();
}

class _CircleCertificateDialogState extends ConsumerState<CircleCertificateDialog> {
  final TextEditingController _textController = TextEditingController();
  String? _errorMessage;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    // Check certificate status from API on init
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkCertificateStatus();
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Listen to certificate state changes
    ref.listen(certificateViewModelProvider, _handleStateChange);

    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return _buildCertificateDialog();
  }

  Future<void> _checkCertificateStatus() async {
    try {
      setState(() {
        _isLoading = true;
      });

      final status = await ref
          .read(certificateViewModelProvider.notifier)
          .getCertificateStatus();

      if (status != null && mounted) {
        final isCertified = status['certificated'] == true;
        
        if (isCertified) {
          _showAlreadyCertifiedDialog();
          return;
        }
      }

      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      logger.e('Error checking certificate status: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _showAlreadyCertifiedDialog() {
    if (!mounted) return;
    
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => _buildAlreadyCertifiedAlert(context),
    );
  }

  void _handleStateChange(AsyncValue<String>? previous, AsyncValue<String> next) {
    logger.d('Certificate state changed: $next');
    
    next.when(
      data: (message) {
        logger.d('Certificate success: $message');
        setState(() {
          _errorMessage = null;
          _isLoading = false;
        });
      },
      error: (error, stackTrace) {
        logger.e('Certificate error: $error');
        // Extract clean error message from Exception
        String errorString = error.toString();
        if (errorString.startsWith('Exception: ')) {
          errorString = errorString.replaceFirst('Exception: ', '');
        }
        setState(() {
          _errorMessage = errorString;
          _isLoading = false;
        });
      },
      loading: () {
        setState(() {
          _isLoading = true;
          _errorMessage = null;
        });
      },
    );
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
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'SUIT',
                fontWeight: FontWeight.w400,
              ),
              cursorColor: Colors.white,
              decoration: const InputDecoration(
                hintText: '인증코드 입력',
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
          if (_errorMessage != null) ...[
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                _errorMessage!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.redAccent,
                  fontSize: 13,
                ),
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
        onPressed: _isLoading ? null : _handleConfirm,
        child: const Text(
          "확인",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
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
        child: const Text(
          "취소",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Future<void> _handleConfirm() async {
    final codeText = _textController.text.trim();
    final code = int.tryParse(codeText) ?? 0;

    if (code == 0) {
      setState(() {
        _errorMessage = "*인증 코드를 입력하세요.";
      });
      return;
    }

    final success = await ref
        .read(certificateViewModelProvider.notifier)
        .certificate(code: code);

    if (success && mounted) {
      final state = ref.read(certificateViewModelProvider);
      final message = state.value ?? "회원 인증 완료";
      
      final isAlreadyCertified = message == "이미 인증 완료";
      
      if (mounted) {
        showDialog(
          context: context,
          builder: (context) => isAlreadyCertified 
              ? _buildAlreadyCertifiedInfoAlert() 
              : _buildSuccessAlert(),
        );
      }
    }
  }

  Widget _buildAlreadyCertifiedAlert(BuildContext context) {
    return _buildSimpleAlert(
      context,
      "이미 입장 처리된 회원 입니다.",
      title: "이미 입장됨.",
    );
  }

  Widget _buildSuccessAlert() {
    return _buildSimpleAlert(
      context,
      "팔찌를 받아 입장해주세요.",
      title: "👻 확인완료 👻",
    );
  }

  Widget _buildAlreadyCertifiedInfoAlert() {
    return Dialog(
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 150),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 80,
              ),
              const SizedBox(height: 16),
              const Text(
                "이미 인증 완료",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "입장하신 적이 있습니다",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 24),
              const Divider(),
              const SizedBox(height: 16),
              const Text(
                "이벤트에 참여하실 수 있습니다",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "확인",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSimpleAlert(BuildContext context, String msg, {required String title}) {
    return Dialog(
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 200),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: SingleChildScrollView(
          child: Container(
            width: 240,
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 20),
                Text(msg, textAlign: TextAlign.center),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("확인"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
