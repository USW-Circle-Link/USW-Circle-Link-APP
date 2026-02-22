import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_frame/flutter_web_frame.dart';
import 'package:usw_circle_link/const/app_theme.dart';
import 'package:usw_circle_link/models/application_set.dart';
import 'package:usw_circle_link/models/response/application_detail_response.dart';
import 'package:usw_circle_link/utils/dialog_manager.dart';
import 'package:usw_circle_link/viewmodels/application_detail_view_model.dart';
import 'package:usw_circle_link/widgets/detail_app_bar/detail_app_bar.dart';
import 'package:usw_circle_link/widgets/text_font_widget/text_font_widget.dart';

class ApplicationDetailScreen extends ConsumerWidget {
  const ApplicationDetailScreen({
    super.key,
    required this.clubUUID,
    required this.aplictId,
  });

  final String clubUUID;
  final String aplictId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final params = ApplicationDetailParams(
      clubUUID: clubUUID,
      aplictId: aplictId,
    );
    final state = ref.watch(applicationDetailViewModelProvider(params));

    ref.listen(applicationDetailViewModelProvider(params), (previous, next) {
      // 이전 상태가 에러가 아니고, 현재 상태가 에러일 때만 다이얼로그 표시
      final wasNotError = previous?.hasError != true;
      next.whenOrNull(
        error: (error, stackTrace) {
          if (wasNotError) {
            DialogManager.instance.showAlertDialog(
              context: context,
              content: error.toString().replaceAll('Exception: ', ''),
            );
          }
        },
      );
    });

    return FlutterWebFrame(
      maximumSize: const Size(475, 812),
      enabled: kIsWeb,
      builder: (context) => Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        resizeToAvoidBottomInset: false,
        appBar: const DetailAppBar(
          title: '지원서 확인',
        ),
        body: state.when(
        data: (data) {
          if (data == null || data.detailResponse.data.isEmpty) {
            return Center(
              child: TextFontWidget.fontRegular(
                '지원서 내용을 불러올 수 없습니다.',
                textAlign: TextAlign.center,
                fontSize: 14,
                color: theme.colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w400,
              ),
            );
          }
          return SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(top: 24.0),
              padding: const EdgeInsets.only(
                left: 32.0,
                right: 32.0,
                bottom: 32.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...data.detailResponse.data.map((item) {
                    return _buildQuestionAnswerItem(context, item, data.applicationSet);
                  }).toList(),
                ],
              ),
            ),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) => Center(
          child: TextFontWidget.fontRegular(
            '지원서를 불러올 수 없습니다.\n잠시 후 다시 시도해주세요.',
            textAlign: TextAlign.center,
            fontSize: 14,
            color: theme.colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      ),
    );
  }

  Widget _buildQuestionAnswerItem(
    BuildContext context,
    ApplicationQuestionAnswer item,
    ApplicationSet? applicationSet,
  ) {
    // optionId가 있으면 질문에서 옵션을 찾아서 텍스트로 변환
    String displayAnswer = '답변 없음';
    if (item.optionId != null && applicationSet != null) {
      // 질문 목록에서 해당 질문을 찾고, 옵션에서 optionId로 매칭
      for (var question in applicationSet.questions) {
        if (question.questionText == item.question) {
          final option = question.options.firstWhere(
            (opt) => opt.optionId == item.optionId,
            orElse: () => QuestionOption(content: '', optionId: null),
          );
          if (option.optionId != null) {
            displayAnswer = option.content;
            break;
          }
        }
      }
    }
    // optionId 매칭 실패 시 answer 텍스트가 있으면 폴백
    if (displayAnswer == '답변 없음' && item.answer != null && item.answer!.isNotEmpty) {
      displayAnswer = item.answer!;
    }

    final hasAnswer = displayAnswer != '답변 없음';

    final appColors = Theme.of(context).extension<AppColors>()!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFontWidget.fontRegular(
          item.question,
          fontSize: 16.0,
          color: appColors.secondaryText,
          fontWeight: FontWeight.w700,
        ),
        const SizedBox(height: 10.0),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: appColors.borderColor,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: TextFontWidget.fontRegular(
            displayAnswer,
            fontSize: 14.0,
            color: hasAnswer
                ? appColors.secondaryText
                : appColors.hintColor,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 24.0),
      ],
    );
  }
}
