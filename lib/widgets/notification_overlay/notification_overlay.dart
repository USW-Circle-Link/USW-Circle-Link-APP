import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/viewmodels/fcm_view_model.dart';
import 'package:usw_circle_link/widgets/cloud_messaging/cloud_messaging.dart';
import 'package:usw_circle_link/widgets/text_font_widget/text_font_widget.dart';

class NotificationOverlay extends ConsumerStatefulWidget {
  final VoidCallback onDismiss;

  const NotificationOverlay({required this.onDismiss, required GlobalKey<NotificationOverlayState> key});

  @override
  NotificationOverlayState createState() => NotificationOverlayState();
}

class NotificationOverlayState extends ConsumerState<NotificationOverlay> {
  @override
  Widget build(BuildContext context) {
    final notifications = ref.watch(firebaseCloudMessagingViewModelProvider);
    return Stack(
      children: [
        Positioned.fill(
          child: GestureDetector(
            onTap: widget.onDismiss,
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
        ),
        Positioned(
          top: kToolbarHeight - 10,
          right: 24,
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: 208,
              height: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: TextFontWidget.fontRegular(
                      "알림",
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Expanded(
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: ListView.builder(
                        itemCount: notifications.length,
                        itemBuilder: (context, index) {
                          return CloudMessaging(
                            text: notifications[index],
                            index: index,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void updateList() {
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
  }
}
