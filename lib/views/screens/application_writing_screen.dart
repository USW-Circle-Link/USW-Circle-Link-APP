import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:usw_circle_link/const/data.dart';
import 'package:usw_circle_link/models/application_model.dart';
import 'package:usw_circle_link/models/circle_detail_list_model.dart';
import 'package:usw_circle_link/router/circle_list_route.dart';
import 'package:usw_circle_link/utils/dialog_manager.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';
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
                  context.push('/webview/${Uri.encodeComponent(data.data!)}');
                  break;
                case ApplicationModelType.apply:
                  logger.d('지원서 제출 성공! - ${data!.message}');
                  context.replace('/circle_list/${CircleListType.myApplications.routeKey}');
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
                    content: "지원서를 불러오는 중 문제가 발생했습니다.\n잠시 후 다시 시도해주세요.",
                  );
                  break;
                case ApplicationModelType.apply:
                  logger.d('지원서 제출 실패 : $error');
                  DialogManager.instance.showAlertDialog(
                    context: context,
                    content: "지원서 제출 중 문제가 발생했습니다.\n잠시 후 다시 시도해주세요.",
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
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0.0,
        scrolledUnderElevation: 0,
        title: Padding(
          padding: EdgeInsets.only(left: 22, right: 22),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 52,
                height: 52,
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
                fontSize: 20,
                color: Color(0xFF111111),
                fontWeight: FontWeight.w700,
              ),
              SizedBox(width: 52, height: 52),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding:
          EdgeInsets.only(left: 32, right: 32, bottom: 20),
          child: Wrap(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(5))),
                        side: BorderSide(width: 1),
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
                                  ApplicationModelType.getApplication) {
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
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (state.hasValue &&
                              state.value?.type ==
                                  ApplicationModelType.getApplication) {
                            setState(() {
                              isDone = !isDone;
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
                        child: TextFontWidget.fontRegular(
                          '유의사항을 확인했습니다',
                          fontSize: 14,
                          color: const Color(0xFF353549),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: OutlinedButton(
                      onPressed: isDone
                          ? () async {
                        if (state.hasValue) {
                          await ref
                              .read(applicationViewModelProvider
                              .notifier)
                              .apply(clubUUID: widget.clubUUID);
                        } else {
                          DialogManager.instance.showAlertDialog(
                            context: context,
                            content: "'유의사항을 확인했습니다' 체크 부탁드립니다!",
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
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: TextFontWidget.fontRegular(
                        '지원 완료',
                        fontSize: 18,
                        color: const Color(0xFFFFFFFF),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: state.isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 24),
          padding: EdgeInsets.only(left: 32, right: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset('assets/images/ic_pen.svg'),
                  SizedBox(
                    width: 5,
                  ),
                  TextFontWidget.fontRegular(
                    '지원서 작성',
                    fontSize: 16,
                    color: const Color(0xFF2c2c2c),
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                height: 56,
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
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: TextFontWidget.fontRegular(
                    '지원서 작성',
                    fontSize: 18,
                    color: const Color(0xFFFFFFFF),
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Icon(Icons.error_outline),
                  SizedBox(
                    width: 5,
                  ),
                  TextFontWidget.fontRegular('지원서 제출 시 유의사항',
                      fontSize: 16,
                      color: const Color(0xFF353549),
                      fontWeight: FontWeight.w700),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                  text: "이미 지원한 동아리는 ",
                  style: TextFontWidget.fontRegularStyle(
                    height: 2,
                    fontSize: 12,
                    color: const Color(0xFF989898),
                    fontWeight: FontWeight.w400,
                  ),
                  children: const [
                    TextSpan(
                      text: "4일 ",
                      style: TextStyle(
                          color: Color(0xffffB052),
                          fontWeight: FontWeight.w800),
                    ),
                    TextSpan(
                      text:
                      "동안 다시 지원할 수 없습니다.\n신중하게 작성하신 후 지원 완료 버튼을 눌러 주세요.\n지원서를 잘못 작성한 경우, ",
                    ),
                    TextSpan(
                      text: "책인은 본인",
                      style: TextStyle(
                          color: Color(0xffffB052),
                          fontWeight: FontWeight.w800),
                    ),
                    TextSpan(
                      text: "에게 있습니다.",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}