import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/viewmodels/fcm_view_model.dart';
import '../text_font_widget/text_font_widget.dart';
import 'notification_popover_styles.dart';

/// 알림 Popover 컴포넌트
///
/// 알림 목록을 표시하는 Popover입니다.
/// Popover 컴포넌트와 함께 사용됩니다.
///
/// ```diagram
/// +-------------------+
/// |       알림        |
/// +-------------------+
/// | [알림1]      [X]  |
/// | [알림2]      [X]  |
/// | [알림3]      [X]  |
/// +-------------------+
/// ```
///
/// 사용 예시:
/// ```dart
/// Popover(
///   controller: _controller,
///   childAnchor: PopoverAnchor.bottomRight,
///   popoverAnchor: PopoverAnchor.topRight,
///   popoverBuilder: (context, controller) => NotificationPopoverContent(),
///   child: IconButton(
///     icon: Icon(Icons.notifications),
///     onPressed: () => _controller.toggle(),
///   ),
/// )
/// ```
class NotificationPopoverContent extends ConsumerWidget {
  /// 스타일
  final NotificationPopoverStyle style;

  const NotificationPopoverContent({
    super.key,
    this.style = NotificationPopoverStyle.defaultStyle,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifications = ref.watch(firebaseCloudMessagingViewModelProvider);

    return SizedBox(
      width: style.width,
      height: style.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: style.headerPadding,
            child: TextFontWidget.fontRegular(
              "알림",
              fontSize: style.headerFontSize,
              fontWeight: style.headerFontWeight,
              color: style.headerColor,
            ),
          ),
          Expanded(
            child: notifications.isEmpty
                ? Center(
                    child: TextFontWidget.fontRegular(
                      "알림이 없습니다",
                      fontSize: style.itemFontSize,
                      color: style.emptyMessageColor,
                    ),
                  )
                : MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: ListView.builder(
                      itemCount: notifications.length,
                      itemBuilder: (context, index) {
                        return _NotificationItem(
                          text: notifications[index],
                          index: index,
                          style: style,
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

/// 알림 아이템 위젯 (내부 사용)
class _NotificationItem extends ConsumerStatefulWidget {
  final String text;
  final int index;
  final NotificationPopoverStyle style;

  const _NotificationItem({
    required this.text,
    required this.index,
    required this.style,
  });

  @override
  ConsumerState<_NotificationItem> createState() => _NotificationItemState();
}

class _NotificationItemState extends ConsumerState<_NotificationItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.style.itemPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextFontWidget.fontRegular(
                    widget.text,
                    fontSize: widget.style.itemFontSize,
                    fontWeight: FontWeight.w400,
                    color: widget.style.itemColor,
                    overflow:
                        _isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
                    maxLines: _isExpanded ? null : 1,
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: Icon(
                    Icons.close,
                    size: widget.style.closeIconSize,
                    color: widget.style.closeIconColor,
                  ),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () {
                    ref
                        .read(firebaseCloudMessagingViewModelProvider.notifier)
                        .removeNotification(widget.index);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
