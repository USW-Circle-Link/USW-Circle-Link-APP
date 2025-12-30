import 'package:flutter/material.dart';
import 'popover_controller.dart';
import 'popover_styles.dart';

/// 범용 Popover 오버레이 컴포넌트
///
/// child 위젯을 기준으로 popover를 표시합니다.
/// CompositedTransformTarget/Follower를 사용하여 정확한 위치에 오버레이를 표시합니다.
///
/// 사용 예시:
/// ```dart
/// Popover(
///   controller: _controller,
///   childAnchor: PopoverAnchor.bottomCenter,
///   popoverAnchor: PopoverAnchor.topCenter,
///   popoverBuilder: (context, controller) => PopoverMenu(
///     header: Text('메뉴'),
///     items: [
///       PopoverMenuItem(icon: Icon(Icons.edit), label: '수정'),
///       PopoverMenuItem(icon: Icon(Icons.delete), label: '삭제'),
///     ],
///   ),
///   child: IconButton(
///     icon: Icon(Icons.more_vert),
///     onPressed: () => _controller.toggle(),
///   ),
/// )
/// ```
class Popover extends StatefulWidget {
  /// 트리거 위젯 (Popover를 표시하는 기준점)
  final Widget child;

  /// Popover 내용을 빌드하는 함수
  final Widget Function(BuildContext context, PopoverController controller)
      popoverBuilder;

  /// Popover 컨트롤러 (외부에서 제어 시 사용)
  final PopoverController? controller;

  /// child의 앵커 위치
  final PopoverAnchor childAnchor;

  /// popover의 앵커 위치
  final PopoverAnchor popoverAnchor;

  /// 추가 오프셋
  final Offset offset;

  /// 배리어(배경)를 탭하면 닫을지 여부
  final bool barrierDismissible;

  /// 표시될 때 콜백
  final VoidCallback? onShow;

  /// 숨겨질 때 콜백
  final VoidCallback? onHide;

  /// 스타일
  final PopoverStyle style;

  const Popover({
    super.key,
    required this.child,
    required this.popoverBuilder,
    this.controller,
    this.childAnchor = PopoverAnchor.bottomCenter,
    this.popoverAnchor = PopoverAnchor.topCenter,
    this.offset = Offset.zero,
    this.barrierDismissible = true,
    this.onShow,
    this.onHide,
    this.style = PopoverStyle.defaultStyle,
  });

  @override
  State<Popover> createState() => _PopoverState();
}

class _PopoverState extends State<Popover> {
  final LayerLink _layerLink = LayerLink();
  late PopoverController _controller;
  OverlayEntry? _overlayEntry;
  bool _isInternalController = false;

  @override
  void initState() {
    super.initState();
    _initController();
  }

  void _initController() {
    if (widget.controller != null) {
      _controller = widget.controller!;
      _isInternalController = false;
    } else {
      _controller = PopoverController();
      _isInternalController = true;
    }
    _controller.addListener(_handleControllerChange);
  }

  @override
  void didUpdateWidget(covariant Popover oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      _controller.removeListener(_handleControllerChange);
      if (_isInternalController) {
        _controller.dispose();
      }
      _initController();
    }
  }

  @override
  void dispose() {
    _removeOverlay();
    _controller.removeListener(_handleControllerChange);
    if (_isInternalController) {
      _controller.dispose();
    }
    super.dispose();
  }

  void _handleControllerChange() {
    if (_controller.isShown) {
      _showOverlay();
    } else {
      _removeOverlay();
    }
  }

  void _showOverlay() {
    if (_overlayEntry != null) return;

    _overlayEntry = OverlayEntry(
      builder: (context) => _PopoverOverlay(
        layerLink: _layerLink,
        childAnchor: widget.childAnchor,
        popoverAnchor: widget.popoverAnchor,
        offset: widget.offset,
        barrierDismissible: widget.barrierDismissible,
        style: widget.style,
        onDismiss: () {
          _controller.hide();
        },
        child: widget.popoverBuilder(context, _controller),
      ),
    );

    Overlay.of(context, rootOverlay: true).insert(_overlayEntry!);
    widget.onShow?.call();
  }

  void _removeOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
      widget.onHide?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: widget.child,
    );
  }
}

/// Popover 오버레이 위젯 (내부 사용)
class _PopoverOverlay extends StatelessWidget {
  final LayerLink layerLink;
  final PopoverAnchor childAnchor;
  final PopoverAnchor popoverAnchor;
  final Offset offset;
  final bool barrierDismissible;
  final PopoverStyle style;
  final VoidCallback onDismiss;
  final Widget child;

  const _PopoverOverlay({
    required this.layerLink,
    required this.childAnchor,
    required this.popoverAnchor,
    required this.offset,
    required this.barrierDismissible,
    required this.style,
    required this.onDismiss,
    required this.child,
  });

  Offset _calculateOffset() {
    double dx = offset.dx;
    double dy = offset.dy;

    // child anchor에 따라 기본 오프셋 조정
    switch (childAnchor) {
      case PopoverAnchor.topLeft:
      case PopoverAnchor.topCenter:
      case PopoverAnchor.topRight:
        dy -= style.spacing;
        break;
      case PopoverAnchor.bottomLeft:
      case PopoverAnchor.bottomCenter:
      case PopoverAnchor.bottomRight:
        dy += style.spacing;
        break;
      case PopoverAnchor.centerLeft:
        dx -= style.spacing;
        break;
      case PopoverAnchor.centerRight:
        dx += style.spacing;
        break;
    }

    return Offset(dx, dy);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 배리어 (배경)
        if (barrierDismissible)
          Positioned.fill(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: onDismiss,
              child: Container(
                color: style.barrierColor ?? Colors.transparent,
              ),
            ),
          ),
        // Popover 내용
        CompositedTransformFollower(
          link: layerLink,
          showWhenUnlinked: false,
          targetAnchor: childAnchor.toAlignment(),
          followerAnchor: popoverAnchor.toAlignment(),
          offset: _calculateOffset(),
          child: Material(
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                color: style.backgroundColor,
                borderRadius: BorderRadius.circular(style.borderRadius),
                border: style.borderColor != null
                    ? Border.all(
                        color: style.borderColor!,
                        width: style.borderWidth,
                      )
                    : null,
                boxShadow: [
                  BoxShadow(
                    color: style.shadowColor,
                    blurRadius: style.shadowBlur,
                    offset: style.shadowOffset,
                  ),
                ],
              ),
              child: child,
            ),
          ),
        ),
      ],
    );
  }
}
