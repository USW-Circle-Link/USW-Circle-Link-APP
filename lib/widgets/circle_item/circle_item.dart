import 'package:flutter/material.dart';
import 'package:usw_circle_link/models/circle_list_model.dart';
import 'package:usw_circle_link/widgets/text_font_widget/text_font_widget.dart';
import 'package:usw_circle_link/utils/extensions.dart';
import 'circle_item_styles.dart';

/// 동아리 아이템 컴포넌트
///
/// 동아리 이미지, 이름, 태그를 표시하는 카드 형태의 아이템입니다.
///
/// ```diagram
/// +-----------+
/// |  [Image]  |
/// |  (143x143)|
/// +-----------+
/// | 동아리이름 |  (14px, bold)
/// +-----------+
/// | #태그1    |  (10px, border)
/// | #태그2    |  (최대 2개)
/// +-----------+
/// ```
class CircleItem extends StatelessWidget {
  final CircleListData circle;
  final Function(String clubUUID) onItemClicked;
  final CircleItemStyle style;

  const CircleItem({
    Key? key,
    required this.circle,
    required this.onItemClicked,
    this.style = CircleItemStyle.defaultStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: style.width,
        margin: EdgeInsets.only(right: style.spacing),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(style.imageBorderRadius),
                    border: Border.all(color: style.borderColor, width: style.borderWidth),
                  ),
                  height: style.imageHeight,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(style.imageBorderRadius),
                    child: Hero(
                      tag: 'circle_${circle.clubUUID}',
                      child: circle.mainPhoto?.isValidUrl ?? false
                          ? Image.network(
                              circle.mainPhoto!,
                              fit: BoxFit.cover,
                              height: double.infinity,
                              width: double.infinity,
                              errorBuilder: (BuildContext context,
                                  Object exception, StackTrace? stackTrace) {
                                return Container(
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    'assets/images/circle_default_image.png',
                                    fit: BoxFit.cover,
                                  ),
                                );
                              },
                            )
                          : Center(
                              child: Image.asset(
                                'assets/images/circle_default_image.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                  ),
                ),
                SizedBox(height: style.spacing),
                TextFontWidget.fontRegular(
                  overflow: TextOverflow.ellipsis,
                  circle.clubName,
                  fontSize: style.titleFontSize,
                  fontWeight: style.titleFontWeight,
                ),
                SizedBox(height: style.spacing),
                Flexible(
                  child: LayoutBuilder(builder: (context, constraints) {
                    final margin = 5;
                    final width = (constraints.maxWidth - margin) / 2;
                    return Row(
                      children: List.generate(
                        circle.clubHashtags?.length ?? 0,
                        (index) => ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: 0,
                            maxWidth: width,
                            minHeight: constraints.maxHeight,
                            maxHeight: constraints.maxHeight,
                          ),
                          child: Container(
                            margin: EdgeInsets.only(
                                right: index == 0.0 ? margin.toDouble() : 0.0),
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(style.hashtagBorderRadius),
                              border: Border.all(
                                  color: style.borderColor, width: style.borderWidth),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextFontWidget.fontRegular(
                                  '#${circle.clubHashtags![index]}',
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: style.hashtagFontSize,
                                  fontWeight: style.hashtagFontWeight,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ).toList(),
                    );
                  }),
                )
              ],
            ),
            Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    onItemClicked(circle.clubUUID);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
