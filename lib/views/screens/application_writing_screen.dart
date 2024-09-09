import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:usw_circle_link/models/application_model.dart';
import 'package:usw_circle_link/utils/dialog_manager.dart';
import 'package:usw_circle_link/utils/logger/Logger.dart';
import 'package:usw_circle_link/viewmodels/application_view_model.dart';
import 'package:usw_circle_link/views/widgets/text_font_widget.dart';

class ApplicationWritingScreen extends ConsumerStatefulWidget {
  const ApplicationWritingScreen({Key? key, required this.clubId})
      : super(key: key);

  final int clubId;

  @override
  _ApplicationWritingScreenState createState() =>
      _ApplicationWritingScreenState();
}

class _ApplicationWritingScreenState
    extends ConsumerState<ApplicationWritingScreen> {
  bool isDone = false;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(applicationViewModelProvider);
    ref.listen<ApplicationModelBase?>(applicationViewModelProvider,
        (ApplicationModelBase? previous, ApplicationModelBase? next) {
      logger.d(next.toString());
      if (next is ApplicationModel) {
        switch (next.type) {
          case ApplicationModelType.getApplication:
            logger.d('지원서 url : ${next.data}');
            context.push(
                '/circle/application_writing/webview/${Uri.encodeComponent(next.data!)}');
            break;
          case ApplicationModelType.apply:
            logger.d('지원서 제출 성공! - ${next.message}');
            context.go('/application_circle');
            break;
          default:
            logger.e('예외발생! : $next');
            break;
        }
      }
      if (next is ApplicationModelError) {
        switch (next.type) {
          case ApplicationModelType.getApplication:
            logger.d('지원서 불러오기 실패 : $next');
            DialogManager.instance.showAlertDialog(
              context: context,
              content: "일시적으로 지원서를 불러올 수 없습니다.\n잠시후에 다시 시도해주세요!",
            );
            break;
          case ApplicationModelType.apply:
            logger.d('지원서 제출 실패 : $next');
            DialogManager.instance.showAlertDialog(
              context: context,
              content: "일시적으로 지원제출을 할 수 없습니다.\n잠시후에 다시 시도해주세요!",
            );
            break;
          default:
            logger.e('예외발생! : $next');
            break;
        }
      }
    });
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                titleSpacing: 0.0,
                title: Padding(
                  padding: EdgeInsets.only(left: 22.w, right: 22.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 52.w,
                        height: 52.h,
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: SvgPicture.asset(
                            'assets/images/ic_back_arrow.svg',
                          ),
                        ),
                      ),
                      TextFontWidget.fontRegular(
                        text: '지원하기',
                        fontSize: 18.sp,
                        color: Color(0xFF111111),
                        fontweight: FontWeight.w600,
                      ),
                      SizedBox(width: 52.w, height: 52.h),
                    ],
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(top: 24.h),
                  padding: EdgeInsets.only(left: 32.w, right: 32.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset('assets/images/ic_pen.svg'),
                          SizedBox(
                            width: 5.w,
                          ),
                          TextFontWidget.fontRegular(
                              text: '지원서 작성',
                              fontSize: 14.sp,
                              color: const Color(0xFF353549),
                              fontweight: FontWeight.w600),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 56.h,
                        child: OutlinedButton(
                            onPressed: state is ApplicationModelLoading
                                ? null
                                : () async {
                                    await ref
                                        .read(applicationViewModelProvider
                                            .notifier)
                                        .getApplication(widget.clubId);
                                  },
                            style: OutlinedButton.styleFrom(
                              backgroundColor: const Color(0xFF000000),
                              foregroundColor: const Color(0xFFFFFFFF),
                              side: const BorderSide(
                                width: 0.0,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            child: TextFontWidget.fontRegular(
                                text: '지원서 작성',
                                fontSize: 18.sp,
                                color: const Color(0xFFFFFFFF),
                                fontweight: FontWeight.w600)),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          Icon(Icons.error_outline),
                          SizedBox(
                            width: 5.w,
                          ),
                          TextFontWidget.fontRegular(
                              text: '지원서 제출 시 유의사항',
                              fontSize: 16.sp,
                              color: const Color(0xFF353549),
                              fontweight: FontWeight.w900),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          text: "지원서를 작성 완료 후 ",
                          style: TextStyle(
                              height: 2,
                              fontFamily: 'Pretendard-Regular',
                              fontSize: 13.sp,
                              color: const Color(0xFF989898),
                              fontWeight: FontWeight.w400),
                          children: const [
                            TextSpan(
                              text: "지원서 제출하기 ",
                              style: TextStyle(
                                  color: Color(0xffffB052),
                                  fontWeight: FontWeight.w600),
                            ),
                            TextSpan(
                              text: "버튼을 눌러 주세요.\n지원서를 잘못 작성할 경우, 책임은 ",
                            ),
                            TextSpan(
                              text: "본인",
                              style: TextStyle(
                                  color: Color(0xffffB052),
                                  fontWeight: FontWeight.w600),
                            ),
                            TextSpan(
                              text: "에게 있습니다.\n신중히 작성후 ",
                            ),
                            TextSpan(
                              text: "지원 완료 ",
                              style: TextStyle(
                                  color: Color(0xffffB052),
                                  fontWeight: FontWeight.w600),
                            ),
                            TextSpan(text: "버튼을 눌러 주세요.")
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Checkbox(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            visualDensity: const VisualDensity(
                              horizontal: VisualDensity.minimumDensity,
                              vertical: VisualDensity.minimumDensity,
                            ),
                            value: isDone,
                            onChanged: (bool? value) {
                              if (state is ApplicationModel) {
                                setState(() {
                                  isDone = value ?? false;
                                });
                              } else {
                                // 지원서작성을 누르지 않음 -> 지원서 작성이 되지 않음
                                setState(() {
                                  isDone = false;
                                  DialogManager.instance.showAlertDialog(
                                    context: context,
                                    content: '지원서 작성을 먼저 눌러주세요!',
                                  );
                                });
                              }
                              logger.d('지원서 작성 완료에 동의함 : $isDone');
                            },
                          ),
                          TextFontWidget.fontRegular(
                              text: '유의사항을 확인했습니다',
                              fontSize: 14.sp,
                              color: const Color(0xFF353549),
                              fontweight: FontWeight.w600),
                        ],
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 56.h,
                        child: OutlinedButton(
                            onPressed: () async {
                              if (isDone && state is ApplicationModel) {
                                await ref
                                    .read(applicationViewModelProvider.notifier)
                                    .apply(
                                        clubId: widget.clubId,
                                        aplictGoogleFormUrl: state.data!);
                              } else {
                                DialogManager.instance.showAlertDialog(
                                  context: context,
                                  content: "'유의사항을 확인했습니다' 체크 부탁드립니다!",
                                );
                              }
                            },
                            style: OutlinedButton.styleFrom(
                              backgroundColor: const Color(0xffffB052),
                              foregroundColor: const Color(0xFFFFFFFF),
                              side: const BorderSide(
                                width: 0.0,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            child: TextFontWidget.fontRegular(
                                text: '지원서 제출하기',
                                fontSize: 18.sp,
                                color: const Color(0xFFFFFFFF),
                                fontweight: FontWeight.w600)),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
