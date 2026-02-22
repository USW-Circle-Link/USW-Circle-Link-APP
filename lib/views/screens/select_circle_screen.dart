import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:usw_circle_link/models/circle_list_model.dart';
import 'package:usw_circle_link/viewmodels/select_circle_view_model.dart';
import 'package:usw_circle_link/widgets/detail_app_bar/detail_app_bar.dart';
import 'package:usw_circle_link/widgets/text_font_widget/text_font_widget.dart';
import 'package:usw_circle_link/utils/extensions.dart';

class SelectCircleScreen extends ConsumerStatefulWidget {
  const SelectCircleScreen({Key? key}) : super(key: key);

  @override
  _SelectCircleScreenState createState() => _SelectCircleScreenState();
}

class _SelectCircleScreenState extends ConsumerState<SelectCircleScreen> {
  final List<CircleListData> selectedCircles = [];

  TextStyle circleNameTextStyle({bool isSelected = false, required BuildContext context}) {
    return TextFontWidget.fontRegularStyle(
      fontSize: 16.0,
      color: isSelected ? const Color(0xffffB052) : Theme.of(context).textTheme.bodyLarge?.color ?? Theme.of(context).colorScheme.onSurface,
      fontWeight: FontWeight.w400,
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(selectCircleViewModelProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const DetailAppBar(title: '기존 동아리 회원 가입'),
      body: SafeArea(
        child: state.when(
          data: (data) {
            final circles = data?.data.getSortedListWithValidImage() ?? [];
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextFontWidget.fontRegular(
                            textAlign: TextAlign.center,
                            '현재 소속되어 있는 동아리를\n모두 선택해 주세요.',
                            fontSize: 16.0,
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                            fontWeight: FontWeight.w400,
                          ),
                          const SizedBox(height: 20.0),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child:
                                LayoutBuilder(builder: (context, constraints) {
                              const crossAxisSpacing = 20.0;
                              final widthPerItem =
                                  (constraints.maxWidth - crossAxisSpacing) / 2;
                              final textPainter = TextPainter(
                                  text: TextSpan(
                                      text: '높이 확보용 텍스트',
                                      style: circleNameTextStyle(context: context)),
                                  maxLines: 1,
                                  textDirection: TextDirection.ltr)
                                ..layout();
                              final textHeight = textPainter.size.height;
                              const margin = 8.0;
                              final heightPerItem =
                                  widthPerItem + textHeight + margin + 3;
                              final childAspectRatio =
                                  widthPerItem / heightPerItem;
                              return GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: crossAxisSpacing,
                                  mainAxisSpacing: 10.0,
                                  childAspectRatio: childAspectRatio, // 0.69
                                ),
                                itemCount: circles.length,
                                itemBuilder: (context, index) {
                                  final circle = circles[index];
                                  final isSelected =
                                      selectedCircles.contains(circle);

                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (isSelected) {
                                          selectedCircles.remove(circle);
                                        } else {
                                          selectedCircles.add(circle);
                                        }
                                      });
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        LayoutBuilder(
                                            builder: (context, constraints) {
                                          final borderRadius =
                                              BorderRadius.circular(8.0);
                                          return Stack(
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                constraints: BoxConstraints(
                                                  minHeight:
                                                      constraints.maxWidth,
                                                  maxHeight:
                                                      constraints.maxWidth,
                                                ),
                                                child: ClipRRect(
                                                  borderRadius: borderRadius,
                                                  child: circle.mainPhoto
                                                              ?.isValidUrl ??
                                                          false
                                                      ? Image.network(
                                                          circle.mainPhoto!,
                                                          fit: BoxFit.cover,
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              double.infinity,
                                                          errorBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  Object
                                                                      exception,
                                                                  StackTrace?
                                                                      stackTrace) {
                                                            return Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/circle_default_image.png',
                                                              ),
                                                            );
                                                          },
                                                        )
                                                      : Center(
                                                          child: Image.asset(
                                                            'assets/images/circle_default_image.png',
                                                          ),
                                                        ),
                                                ),
                                              ),
                                              Container(
                                                constraints: BoxConstraints(
                                                  minHeight:
                                                      constraints.maxWidth,
                                                  maxHeight:
                                                      constraints.maxWidth,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: isSelected
                                                      ? const Color(0xffffB052)
                                                          .withOpacity(0.2)
                                                      : Colors.transparent,
                                                  border: Border.all(
                                                    color: isSelected
                                                        ? const Color(
                                                            0xffffB052)
                                                        : Theme.of(context).dividerColor,
                                                  ),
                                                  borderRadius: borderRadius,
                                                ),
                                              ),
                                            ],
                                          );
                                        }),
                                        const SizedBox(height: margin),
                                        Text(
                                          circle.clubName,
                                          style: circleNameTextStyle(
                                              isSelected: isSelected, context: context),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  margin: const EdgeInsets.only(bottom: 10.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 56.0,
                    child: OutlinedButton(
                      onPressed: selectedCircles.isEmpty
                          ? null
                          : () {
                              context.push(
                                '/login/sign_up_option/policy_agree/select_circle/sign_up',
                                extra: selectedCircles,
                              );
                            },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: selectedCircles.isEmpty
                            ? Colors.grey
                            : const Color(0xffffB052),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        side: BorderSide.none,
                      ),
                      child: TextFontWidget.fontRegular(
                        '다음',
                        fontSize: 18.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
          error: (error, stackTrace) => Center(
              child: TextFontWidget.fontRegular(
            '동아리 목록을 불러오지 못했어요.\n잠시 후 다시 시도해주세요.',
            textAlign: TextAlign.center,
            fontSize: 14.0,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w400,
          )),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}

extension on List<CircleListData> {
  List<CircleListData> getSortedListWithValidImage() {
    final validImageList = where((element) =>
        element.mainPhoto != null && element.mainPhoto!.isValidUrl).toList();
    final invalidImageList = where((element) =>
        element.mainPhoto == null || !element.mainPhoto!.isValidUrl).toList();
    return [...validImageList, ...invalidImageList];
  }
}
