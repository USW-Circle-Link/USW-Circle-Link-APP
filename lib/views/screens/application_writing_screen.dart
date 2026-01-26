import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../const/data.dart';
import '../../models/application_set.dart';
import '../../models/circle_detail_list_model.dart';
import '../../router/circle_list_route.dart';
import '../../utils/dialog_manager.dart';
import '../../viewmodels/application_view_model.dart';
import '../../widgets/detail_app_bar/detail_app_bar.dart';
import '../../widgets/rounded_text_field/rounded_text_field.dart';
import '../../widgets/text_font_widget/text_font_widget.dart';

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
  final Map<int, TextEditingController> _textControllers = {};
  final Map<int, Set<int>> _checkboxSelections = {};

  static const double _borderRadius = 16.0;
  static const double _buttonHeight = 56.0;
  static const double _fieldHeight = 56.0;
  static const double _longTextFieldHeight = 120.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(applicationViewModelProvider.notifier).getApplication(widget.clubUUID);
    });
  }

  @override
  void dispose() {
    for (var controller in _textControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref
        .watch(applicationViewModelProvider.select((state) => state.isLoading));
    final applicationSet = ref.watch(
        applicationViewModelProvider.select((state) => state.applicationSet));
    final answers = ref.watch(
        applicationViewModelProvider.select((state) => state.answers));
    final viewModel = ref.read(applicationViewModelProvider.notifier);

    if (applicationSet != null) {
      for (var question in applicationSet.questions) {
        final answer = answers[question.questionId];
        if (question.type == QuestionType.shortText || question.type == QuestionType.longText) {
          if (!_textControllers.containsKey(question.questionId)) {
            _textControllers[question.questionId] = TextEditingController(
              text: answer?.answerText ?? '',
            );
            _textControllers[question.questionId]!.addListener(() {
              viewModel.updateAnswer(
                questionId: question.questionId,
                answerText: _textControllers[question.questionId]!.text,
              );
            });
          }
        } else if (question.type == QuestionType.checkbox) {
          if (!_checkboxSelections.containsKey(question.questionId)) {
            _checkboxSelections[question.questionId] = {};
          }
        }
      }
    }

    ref.listen(applicationViewModelProvider.select((state) => state.error),
        (prev, next) {
      if (next != null) {
        DialogManager.instance.showAlertDialog(
          context: context,
          content: next,
        );
      }
    });
    ref.listen(
        applicationViewModelProvider.select((state) => state.applySuccess),
        (prev, next) {
      if (next) {
        context
            .replace('/circle_list/${CircleListType.myApplications.routeKey}');
      }
    });

    return Scaffold(
      appBar: const DetailAppBar(title: '지원하기'),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 32.0, right: 32.0, bottom: 20.0),
          child: Wrap(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        side: BorderSide(width: 1),
                        activeColor: accentColor,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        visualDensity: const VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity,
                        ),
                        value: isDone,
                        onChanged: (bool? value) {
                          setState(() {
                            isDone = value ?? false;
                          });
                        },
                      ),
                      const SizedBox(width: 10.0),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isDone = !isDone;
                          });
                        },
                        child: TextFontWidget.fontRegular(
                          '유의사항을 확인했습니다',
                          fontSize: 14.0,
                          color: const Color(0xFF353549),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30.0),
                  SizedBox(
                    width: double.infinity,
                    height: _buttonHeight,
                    child: Builder(
                      builder: (context) {
                        final isFormValid = ref.read(applicationViewModelProvider.notifier).isFormValid();
                        final canSubmit = isDone && isFormValid;
                        return OutlinedButton(
                          onPressed: canSubmit
                              ? () async {
                                  await ref
                                      .read(applicationViewModelProvider.notifier)
                                      .apply(clubUUID: widget.clubUUID);
                                }
                              : null,
                          style: OutlinedButton.styleFrom(
                            backgroundColor: canSubmit
                                ? accentColor
                                : const Color(0xFF999999),
                            foregroundColor: const Color(0xFFFFFFFF),
                            side: const BorderSide(
                              width: 0.0,
                              color: Colors.transparent,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(_borderRadius),
                            ),
                          ),
                          child: TextFontWidget.fontRegular(
                            '지원 완료',
                            fontSize: 18.0,
                            color: const Color(0xFFFFFFFF),
                            fontWeight: FontWeight.w800,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : applicationSet == null
              ? Center(
                  child: TextFontWidget.fontRegular(
                    '지원서를 불러올 수 없습니다.',
                    fontSize: 16.0,
                    color: const Color(0xFF999999),
                  ),
                )
              : SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.only(top: 24.0),
                    padding: const EdgeInsets.only(left: 32.0, right: 32.0, bottom: 100.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...applicationSet.questions.map((question) {
                          return _buildQuestionField(question);
                        }).toList(),
                        const SizedBox(height: 20.0),
                        Row(
                          children: [
                            const Icon(Icons.error_outline),
                            const SizedBox(width: 5.0),
                            TextFontWidget.fontRegular(
                              '지원서 제출 시 유의사항',
                              fontSize: 16.0,
                              color: const Color(0xFF353549),
                              fontWeight: FontWeight.w700,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10.0),
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

  Widget _buildQuestionField(ApplicationQuestion question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: TextFontWidget.fontRegular(
                question.questionText,
                fontSize: 16.0,
                color: const Color(0xFF2c2c2c),
                fontWeight: FontWeight.w700,
              ),
            ),
            if (question.required)
              TextFontWidget.fontRegular(
                ' *',
                fontSize: 16.0,
                color: accentColor,
                fontWeight: FontWeight.w700,
              ),
          ],
        ),
        const SizedBox(height: 10.0),
        _buildQuestionInput(question),
        const SizedBox(height: 24.0),
      ],
    );
  }

  Widget _buildQuestionInput(ApplicationQuestion question) {
    switch (question.type) {
      case QuestionType.shortText:
      case QuestionType.longText:
        final controller = _textControllers[question.questionId];
        if (controller == null) return SizedBox.shrink();
        final isLongText = question.type == QuestionType.longText;
        return RoundedTextField(
          textEditController: controller,
          height: isLongText ? _longTextFieldHeight : _fieldHeight,
          maxLines: isLongText ? 5 : 1,
          borderWidth: 1.0,
          borderColor: const Color(0xFFDBDBDB),
          leftTopCornerRadius: _borderRadius,
          rightTopCornerRadius: _borderRadius,
          leftBottomCornerRadius: _borderRadius,
          rightBottomCornerRadius: _borderRadius,
          paddingLeft: 16.0,
          paddingRight: 16.0,
          paddingTop: 16.0,
          paddingBottom: 16.0,
          hintText: '답변을 입력해주세요',
          hintStyle: TextFontWidget.fontRegularStyle(
            fontSize: 14.0,
            color: const Color(0xFF999999),
          ),
          textStyle: TextFontWidget.fontRegularStyle(
            fontSize: 14.0,
            color: const Color(0xFF2c2c2c),
          ),
        );
      case QuestionType.radio:
        return _buildRadioField(question);
      case QuestionType.checkbox:
        return _buildCheckboxField(question);
      case QuestionType.dropdown:
        return _buildDropdownField(question);
    }
  }

  Widget _buildRadioField(ApplicationQuestion question) {
    final currentAnswer = ref.watch(
      applicationViewModelProvider.select((state) => state.answers[question.questionId]),
    );
    final selectedOptionId = currentAnswer?.optionId;

    // TODO: 테스트용 - options가 비어있을 때 더미 옵션 표시
    // 롤백하려면 아래 주석 처리된 코드를 활성화하고, 테스트용 코드를 주석 처리하세요
    if (question.options.isEmpty) {
      // 테스트용 더미 옵션 생성
      final dummyOptions = [
        QuestionOption(
          optionId: 1,
          content: '옵션 1',
          sequence: 1,
        ),
        QuestionOption(
          optionId: 2,
          content: '옵션 2',
          sequence: 2,
        ),
        QuestionOption(
          optionId: 3,
          content: '옵션 3',
          sequence: 3,
        ),
      ];
      
      return Column(
        children: dummyOptions.map((option) {
          final isSelected = selectedOptionId == option.optionId;
          return InkWell(
            onTap: () {
              ref.read(applicationViewModelProvider.notifier).updateAnswer(
                questionId: question.questionId,
                optionId: option.optionId,
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              margin: const EdgeInsets.only(bottom: 8.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: isSelected ? accentColor : const Color(0xFFDBDBDB),
                  width: isSelected ? 2.0 : 1.0,
                ),
                borderRadius: BorderRadius.circular(_borderRadius),
              ),
              child: Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isSelected ? accentColor : const Color(0xFFDBDBDB),
                        width: 2.0,
                      ),
                      color: isSelected ? accentColor : Colors.transparent,
                    ),
                    child: isSelected
                        ? Center(
                            child: Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                            ),
                          )
                        : null,
                  ),
                  const SizedBox(width: 12.0),
                  Expanded(
                    child: TextFontWidget.fontRegular(
                      option.content,
                      fontSize: 14.0,
                      color: const Color(0xFF2c2c2c),
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      );
      
      // 롤백용 원래 코드 (주석 해제하여 사용)
      /*
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFFDBDBDB),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(_borderRadius),
        ),
        child: TextFontWidget.fontRegular(
          '선택지가 없습니다.',
          fontSize: 14.0,
          color: const Color(0xFF999999),
        ),
      );
      */
    }

    return Column(
      children: question.options.map((option) {
        final isSelected = selectedOptionId == option.optionId;
        return InkWell(
          onTap: () {
            ref.read(applicationViewModelProvider.notifier).updateAnswer(
              questionId: question.questionId,
              optionId: option.optionId,
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            margin: const EdgeInsets.only(bottom: 8.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: isSelected ? accentColor : const Color(0xFFDBDBDB),
                width: isSelected ? 2.0 : 1.0,
              ),
              borderRadius: BorderRadius.circular(_borderRadius),
            ),
            child: Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected ? accentColor : const Color(0xFFDBDBDB),
                      width: 2.0,
                    ),
                    color: isSelected ? accentColor : Colors.transparent,
                  ),
                  child: isSelected
                      ? Center(
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                          ),
                        )
                      : null,
                ),
                const SizedBox(width: 12.0),
                Expanded(
                  child: TextFontWidget.fontRegular(
                    option.content,
                    fontSize: 14.0,
                    color: const Color(0xFF2c2c2c),
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildCheckboxField(ApplicationQuestion question) {
    final currentAnswer = ref.watch(
      applicationViewModelProvider.select((state) => state.answers[question.questionId]),
    );
    
    if (!_checkboxSelections.containsKey(question.questionId)) {
      if (currentAnswer?.answerText != null) {
        final selectedOptionIds = currentAnswer!.answerText!.split(', ')
            .map((idStr) => int.tryParse(idStr))
            .where((id) => id != null)
            .cast<int>()
            .toSet();
        _checkboxSelections[question.questionId] = selectedOptionIds;
      } else {
        _checkboxSelections[question.questionId] = {};
      }
    }
    
    final selectedOptionIds = _checkboxSelections[question.questionId]!;

    return Column(
      children: question.options.map((option) {
        final isSelected = selectedOptionIds.contains(option.optionId);
        return InkWell(
          onTap: () {
            setState(() {
              if (isSelected) {
                selectedOptionIds.remove(option.optionId);
              } else {
                if (option.optionId != null) {
                  selectedOptionIds.add(option.optionId!);
                }
              }
              _checkboxSelections[question.questionId] = selectedOptionIds;
            });
            ref.read(applicationViewModelProvider.notifier).updateAnswer(
              questionId: question.questionId,
              optionId: null,
              answerText: selectedOptionIds.isEmpty
                  ? null
                  : selectedOptionIds.map((id) => id.toString()).join(', '),
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            margin: const EdgeInsets.only(bottom: 8.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: isSelected ? accentColor : const Color(0xFFDBDBDB),
                width: isSelected ? 2.0 : 1.0,
              ),
              borderRadius: BorderRadius.circular(_borderRadius),
            ),
            child: Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: isSelected ? accentColor : const Color(0xFFDBDBDB),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(4.0),
                    color: isSelected ? accentColor : Colors.transparent,
                  ),
                  child: isSelected
                      ? Icon(Icons.check, size: 14, color: Colors.white)
                      : null,
                ),
                const SizedBox(width: 12.0),
                Expanded(
                  child: TextFontWidget.fontRegular(
                    option.content,
                    fontSize: 14.0,
                    color: const Color(0xFF2c2c2c),
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildDropdownField(ApplicationQuestion question) {
    final currentAnswer = ref.watch(
      applicationViewModelProvider.select((state) => state.answers[question.questionId]),
    );
    final selectedOptionId = currentAnswer?.optionId;
    QuestionOption? selectedOption;
    if (selectedOptionId != null) {
      try {
        selectedOption = question.options.firstWhere(
          (opt) => opt.optionId == selectedOptionId,
        );
      } catch (e) {
        selectedOption = null;
      }
    }

    return Container(
      height: _fieldHeight,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFFDBDBDB),
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(_borderRadius),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<QuestionOption>(
          value: selectedOptionId != null ? selectedOption : null,
          isExpanded: true,
          hint: TextFontWidget.fontRegular(
            '선택해주세요',
            fontSize: 14.0,
            color: const Color(0xFF999999),
          ),
          items: question.options.map((option) {
            return DropdownMenuItem<QuestionOption>(
              value: option,
              child: TextFontWidget.fontRegular(
                option.content,
                fontSize: 14.0,
                color: const Color(0xFF2c2c2c),
              ),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              ref.read(applicationViewModelProvider.notifier).updateAnswer(
                questionId: question.questionId,
                optionId: value.optionId,
              );
            }
          },
        ),
      ),
    );
  }
}
