import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:usw_circle_link/models/ApplicationModel.dart';
import 'package:usw_circle_link/utils/logger/Logger.dart';
import 'package:usw_circle_link/viewmodels/ApplicationViewModel.dart';
import 'package:usw_circle_link/views/widgets/TextFontWidget.dart';

class ApplicationWritingScreen extends ConsumerStatefulWidget {
  const ApplicationWritingScreen({Key? key}) : super(key: key);

  @override
  _ApplicationWritingScreenState createState() =>
      _ApplicationWritingScreenState();
}

class _ApplicationWritingScreenState
    extends ConsumerState<ApplicationWritingScreen> {
  bool isDone = false;

  final int clubId = 1;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(applicationViewModelProvider);
    ref.listen<ApplicationModelBase?>(applicationViewModelProvider,
        (ApplicationModelBase? previous, ApplicationModelBase? next) {
      logger.d(next.toString());
      if (next is ApplicationModelComplete) {
        logger.d('지원서 작성 성공! - ${next.message}');
        //지원서 작성 완료 페이지로 라우팅
      }
      if (next is ApplicationModel) {
        logger.d('지원서 url : ${next.data}');
        context.go('/application_writing/${Uri.encodeComponent(next.data)}');
      }
      if (next is ApplicationModelError) {
        switch (next.errorType) {
          case ApplicationModelErrorType.getApplication:
            logger.d('지원서 불러오기 실패 : ${next}');
            break;
          case ApplicationModelErrorType.apply:
            logger.d('지원서 작성 실패 : ${next}');
            break;
          default:
            logger.d('@ : ${next}');
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
                  // TODO : icon padding 문제
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
                          fontweight: FontWeight.w600),
                      SizedBox(width: 52.w, height: 52.h)
                    ],
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(top: 60.h),
                  padding: EdgeInsets.only(left: 32.w, right: 32.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 32.h,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 56.h,
                        child: OutlinedButton(
                            onPressed: () async {
                              await ref
                                  .read(applicationViewModelProvider.notifier)
                                  .getApplication(clubId);
                            },
                            style: OutlinedButton.styleFrom(
                              backgroundColor: const Color(0xFF4F5BD0),
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
                        height: 90.h,
                      ),
                      RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          text: "지원서를 작성 완료 후 ",
                          style: TextStyle(
                              fontFamily: 'Pretendard-Regular',
                              fontSize: 14.sp,
                              color: const Color(0xFF989898),
                              fontWeight: FontWeight.w400),
                          children: const [
                            TextSpan(
                              text: "지원 완료 ",
                              style: TextStyle(
                                  color: Color(0xFF6E6EDE),
                                  fontWeight: FontWeight.w600),
                            ),
                            TextSpan(
                              text: "버튼을 눌러 주세요.\n지원서를 잘못 작성할 경우, 책임은 ",
                            ),
                            TextSpan(
                              text: "본인",
                              style: TextStyle(
                                  color: Color(0xFF6E6EDE),
                                  fontWeight: FontWeight.w600),
                            ),
                            TextSpan(
                              text: "에게 있습니다.\n신중히 작성후 '지원 완료' 버튼을 눌러 주세요.",
                            ),
                          ],
                        ),
                      ),
                      Checkbox(
                        value: isDone,
                        onChanged: (bool? value) {
                          if (state is ApplicationModel) {
                            setState(() {
                              isDone = value ?? false;
                            });
                          } else {
                            // 지원서작성을 누르지 않음 -> 지원서 작성이 되지 않음
                            setState(() {
                              value = false;
                            });
                          }
                          logger.d('지원서 작성 완료에 동의함 : $isDone');
                        },
                      ),
                      SizedBox(
                        height: 12.h,
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
                                        clubId: clubId,
                                        aplictGoogleFormUrl: state.data!);
                              } else {
                                // 지원서 작성 완료 후 동의함 체크 부탁~
                              }
                            },
                            style: OutlinedButton.styleFrom(
                              backgroundColor: const Color(0xFF000000),
                              side: const BorderSide(
                                width: 0.0,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            child: TextFontWidget.fontRegular(
                                text: '지원 완료',
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
