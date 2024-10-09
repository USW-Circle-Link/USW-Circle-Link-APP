import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/viewmodels/fcm_view_model.dart';

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
  bool _isExpanded = false; // 텍스트 확장 여부를 관리하는 상태 변수

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 4.h, 0,4.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded; // 터치 시 확장 상태 토글
              });
            },
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
                    overflow: _isExpanded
                        ? TextOverflow.visible
                        : TextOverflow.ellipsis,
                    maxLines: _isExpanded ? null : 1, // 확장 시 최대 줄 수 제한 해제
                  ),
                ),
                SizedBox(width: 8.w),
                IconButton(
                  icon: Icon(Icons.close, size: 16.sp,color: Colors.grey),
                  onPressed: () {
                    ref
                        .read(firebaseCloudMessagingViewModelProvider.notifier)
                        .removeNotification(widget.index);
                  },
                ),
              ],
            ),
          ),
          if (_isExpanded) // 확장 상태에서 짤린 부분만 보여주기
            Padding(
              padding: EdgeInsets.only(top: 4.h),
              child: Text(
                widget.text.length > 35
                    ? widget.text.substring(35) // 짤린 부분만 보여줌
                    : '', // 메시지가 짧을 경우 빈 문자열
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
