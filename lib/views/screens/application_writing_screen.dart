import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:usw_circle_link/const/data.dart';
import 'package:usw_circle_link/models/application_model.dart';
import 'package:usw_circle_link/models/circle_detail_list_model.dart';
import 'package:usw_circle_link/utils/dialog_manager.dart';
import 'package:usw_circle_link/utils/logger/Logger.dart';
import 'package:usw_circle_link/viewmodels/application_view_model.dart';
import 'package:usw_circle_link/views/widgets/text_font_widget.dart';

class ApplicationWritingScreen extends ConsumerStatefulWidget {
  const ApplicationWritingScreen({Key? key, required this.clubUUID})
      : super(key: key);

  final String clubUUID;

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
    ref.listen<AsyncValue<ApplicationModel?>>(applicationViewModelProvider,
        (AsyncValue<ApplicationModel?>? previous,
            AsyncValue<ApplicationModel?>? next) {
      next?.when(
        data: (data) {
          switch (data?.type) {
            case ApplicationModelType.getApplication:
              logger.d('지원서 url : ${data!.data}');
              context.push(
                  '/circle/application_writing/webview/${Uri.encodeComponent(data.data!)}');
              break;
            case ApplicationModelType.apply:
              logger.d('지원서 제출 성공! - ${data!.message}');
              context.go('/circle_list', extra: CircleListType.myApplications);
              break;
            default:
              break;
          }
        },
        error: (error, stackTrace) {
          error = error as ApplicationModelError;
          switch (error.type) {
            case ApplicationModelType.getApplication:
              logger.d('지원서 불러오기 실패 : $error');
              DialogManager.instance.showAlertDialog(
                context: context,
                content: "일시적으로 지원서를 불러올 수 없습니다.\n잠시후에 다시 시도해주세요!",
              );
              break;
            case ApplicationModelType.apply:
              logger.d('지원서 제출 실패 : $error');
              DialogManager.instance.showAlertDialog(
                context: context,
                content: "일시적으로 지원서 제출을 할 수 없습니다.\n잠시후에 다시 시도해주세요!",
              );
              break;
            default:
              logger.e('예외발생! : $error');
              break;
          }
        },
        loading: () {},
      );
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
                        '지원하기',
                        fontSize: 20.sp,
                        color: Color(0xFF111111),
                        fontWeight: FontWeight.w700,
                      ),
                      SizedBox(width: 52.w, height: 52.h),
                    ],
                  ),
                ),
              ),
              body: state.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
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
                                  '지원서 작성',
                                  fontSize: 16.sp,
                                  color: const Color(0xFF2c2c2c),
                                  fontWeight: FontWeight.w700,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 56.h,
                              child: OutlinedButton(
                                onPressed: state.isLoading
                                    ? null
                                    : () async {
                                        await ref
                                            .read(applicationViewModelProvider
                                                .notifier)
                                            .getApplication(widget.clubUUID);
                                      },
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: const Color(0xFF000000),
                                  foregroundColor: const Color(0xFFFFFFFF),
                                  side: const BorderSide(
                                    color: Colors.transparent,
                                    width: 0.0,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.r),
                                  ),
                                ),
                                child: TextFontWidget.fontRegular(
                                  '지원서 작성',
                                  fontSize: 18.sp,
                                  color: const Color(0xFFFFFFFF),
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
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
                                TextFontWidget.fontRegular('지원서 제출 시 유의사항',
                                    fontSize: 16.sp,
                                    color: const Color(0xFF353549),
                                    fontWeight: FontWeight.w700),
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
                                    fontFamily: 'SUIT',
                                    fontSize: 13.sp,
                                    color: const Color(0xFF989898),
                                    fontWeight: FontWeight.w500),
                                children: const [
                                  TextSpan(
                                    text: "지원 완료 ",
                                    style: TextStyle(
                                        color: Color(0xffffB052),
                                        fontWeight: FontWeight.w800),
                                  ),
                                  TextSpan(
                                    text: "버튼을 눌러 주세요.\n지원서를 잘못 작성할 경우, 책임은 ",
                                  ),
                                  TextSpan(
                                    text: "본인",
                                    style: TextStyle(
                                        color: Color(0xffffB052),
                                        fontWeight: FontWeight.w800),
                                  ),
                                  TextSpan(
                                    text: "에게 있습니다.\n신중히 작성후 ",
                                  ),
                                  TextSpan(
                                    text: "지원 완료 ",
                                    style: TextStyle(
                                        color: Color(0xffffB052),
                                        fontWeight: FontWeight.w800),
                                  ),
                                  TextSpan(text: "버튼을 눌러 주세요.")
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 290.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Checkbox(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.r))),
                                  side: BorderSide(width: 1.w),
                                  activeColor: accentColor,
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  visualDensity: const VisualDensity(
                                    horizontal: VisualDensity.minimumDensity,
                                    vertical: VisualDensity.minimumDensity,
                                  ),
                                  value: isDone,
                                  onChanged: (bool? value) {
                                    if (state.hasValue &&
                                        state.value?.type ==
                                            ApplicationModelType
                                                .getApplication) {
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
                                SizedBox(
                                  width: 10.w,
                                ),
                                TextFontWidget.fontRegular(
                                  '유의사항을 확인했습니다',
                                  fontSize: 14.sp,
                                  color: const Color(0xFF353549),
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 56.h,
                              child: OutlinedButton(
                                onPressed: isDone
                                    ? () async {
                                        if (state.hasValue) {
                                          await ref
                                              .read(applicationViewModelProvider
                                                  .notifier)
                                              .apply(
                                                  clubUUID: widget.clubUUID,
                                                  aplictGoogleFormUrl:
                                                      state.value?.data ?? "");
                                        } else {
                                          DialogManager.instance
                                              .showAlertDialog(
                                            context: context,
                                            content:
                                                "'유의사항을 확인했습니다' 체크 부탁드립니다!",
                                          );
                                        }
                                      }
                                    : null,
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: isDone
                                      ? const Color(0xffffB052)
                                      : const Color(0xFF999999),
                                  foregroundColor: const Color(0xFFFFFFFF),
                                  side: const BorderSide(
                                    width: 0.0,
                                    color: Colors.transparent,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.r),
                                  ),
                                ),
                                child: TextFontWidget.fontRegular(
                                  '지원 완료',
                                  fontSize: 18.sp,
                                  color: const Color(0xFFFFFFFF),
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ));
  }
}
