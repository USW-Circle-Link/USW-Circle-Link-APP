import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/notifier/notification_state_notifier.dart';

class CloudMessaging extends ConsumerStatefulWidget {
  final String text;
  final int index;

  const CloudMessaging({
    Key? key,
    required this.text,
    required this.index,
  }) : super(key: key);

  @override
  _CloudMessagingState createState() => _CloudMessagingState();
}

class _CloudMessagingState extends ConsumerState<CloudMessaging> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              widget.text,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(width: 8.w),
          IconButton(
            icon: Icon(Icons.close, size: 16.sp, color: Colors.grey),
            onPressed: () {
              ref
                  .read(notificationProvider.notifier)
                  .removeNotification(widget.index);
            },
          ),
        ],
      ),
    );
  }
}
