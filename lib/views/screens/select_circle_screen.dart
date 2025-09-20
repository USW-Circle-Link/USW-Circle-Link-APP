import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:usw_circle_link/models/circle_list_model.dart';
import 'package:usw_circle_link/viewmodels/select_circle_view_model.dart';
import 'package:usw_circle_link/views/widgets/text_font_widget.dart';
import 'package:usw_circle_link/utils/extensions.dart';

class SelectCircleScreen extends ConsumerStatefulWidget {
  const SelectCircleScreen({Key? key}) : super(key: key);

  @override
  _SelectCircleScreenState createState() => _SelectCircleScreenState();
}

class _SelectCircleScreenState extends ConsumerState<SelectCircleScreen> {
  final List<CircleListData> selectedCircles = [];

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(selectCircleViewModelProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 0.0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 52.0,
                height: 52.0,
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
                '기존 동아리 회원 가입',
                fontSize: 18.0,
                color: const Color(0xFF111111),
                fontWeight: FontWeight.w800,
              ),
              const SizedBox(width: 52.0, height: 52.0)
            ],
          ),
        ),
      ),
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
                            color: const Color(0xFFA1A1A1),
                            fontWeight: FontWeight.w400,
                          ),
                          const SizedBox(height: 20.0),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 20.0,
                                mainAxisSpacing: 10.0,
                                childAspectRatio: 0.69,
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
                                      Expanded(
                                        child: LayoutBuilder(
                                            builder: (context, constraints) {
                                              final borderRadius =
                                              BorderRadius.circular(8.0);
                                              return Stack(
                                                children: [
                                                  Container(
                                                    alignment: Alignment.center,
                                                    constraints: BoxConstraints(
                                                      minHeight:
                                                      constraints.maxHeight,
                                                      maxHeight:
                                                      constraints.maxHeight,
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius: borderRadius,
                                                      child: circle.mainPhoto
                                                          ?.isValidUrl ??
                                                          false
                                                          ? Image.network(
                                                        circle.mainPhoto!,
                                                        fit: BoxFit.cover,
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
                                                      constraints.maxHeight,
                                                      maxHeight:
                                                      constraints.maxHeight,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: isSelected
                                                          ? const Color(
                                                          0xffffB052)
                                                          .withOpacity(0.2)
                                                          : Colors.transparent,
                                                      border: Border.all(
                                                        color: isSelected
                                                            ? const Color(
                                                            0xffffB052)
                                                            : const Color(0xFFB8B8B8),
                                                      ),
                                                      borderRadius: borderRadius,
                                                    ),
                                                  ),
                                                ],
                                              );
                                            }),
                                      ),
                                      const SizedBox(height: 8.0),
                                      TextFontWidget.fontRegular(
                                        circle.clubName,
                                        fontSize: 16.0,
                                        color: isSelected
                                            ? const Color(0xffffB052)
                                            : Colors.black,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
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
                color: const Color(0xFFA1A1A1),
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
