import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:usw_circle_link/widgets/text_font_widget/text_font_widget.dart';
import 'detail_app_bar_styles.dart';

/// 상세 화면용 AppBar 컴포넌트
///
/// 뒤로가기 버튼 + 중앙 제목 + 우측 여백(또는 액션) 구조의 AppBar
class DetailAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DetailAppBar({
    super.key,
    this.title,
    this.onBackPressed,
    this.actions,
    this.style = DetailAppBarStyle.defaultStyle,
  });

  /// 제목 텍스트 (null이면 제목 없이 뒤로가기 버튼만 표시)
  final String? title;

  /// 뒤로가기 버튼 클릭 시 콜백. null이면 Navigator.pop() 호출
  final VoidCallback? onBackPressed;

  /// 우측 액션 위젯 리스트
  final List<Widget>? actions;

  /// 스타일 설정
  final DetailAppBarStyle style;

  @override
  Widget build(BuildContext context) {
    // 제목이 없는 경우 (뒤로가기 버튼만)
    if (title == null) {
      return AppBar(
        scrolledUnderElevation: 0,
        toolbarHeight: style.toolbarHeight,
        elevation: 0.0,
        backgroundColor: style.backgroundColor,
        automaticallyImplyLeading: false,
        titleSpacing: 0.0,
        title: Padding(
          padding: EdgeInsets.only(left: style.horizontalPadding),
          child: Row(
            children: [
              IconButton(
                onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
                icon: SvgPicture.asset(
                  'assets/images/ic_back_arrow.svg',
                ),
              ),
            ],
          ),
        ),
      );
    }

    // 제목이 있는 경우 (뒤로가기 + 제목 + 우측 영역)
    return AppBar(
      scrolledUnderElevation: 0,
      toolbarHeight: style.toolbarHeight,
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: style.backgroundColor,
      automaticallyImplyLeading: false,
      titleSpacing: 0.0,
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: style.horizontalPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // 뒤로가기 버튼
            SizedBox(
              width: style.backButtonSize,
              height: style.backButtonSize,
              child: IconButton(
                onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
                icon: SvgPicture.asset(
                  'assets/images/ic_back_arrow.svg',
                ),
              ),
            ),
            // 제목
            TextFontWidget.fontRegular(
              title!,
              fontSize: style.titleFontSize,
              color: style.titleColor,
              fontWeight: style.titleFontWeight,
            ),
            // 우측 영역 (액션 또는 빈 공간)
            if (actions != null && actions!.isNotEmpty)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: actions!,
              )
            else
              SizedBox(
                width: style.backButtonSize,
                height: style.backButtonSize,
              ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(style.toolbarHeight);
}
