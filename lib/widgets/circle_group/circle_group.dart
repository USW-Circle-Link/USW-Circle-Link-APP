import 'package:flutter/material.dart';
import 'package:usw_circle_link/const/data.dart';
import 'package:usw_circle_link/models/circle_list_model.dart';
import 'package:usw_circle_link/widgets/circle_item/circle_item.dart';
import 'package:usw_circle_link/widgets/text_font_widget/text_font_widget.dart';

/// 동아리 그룹 컴포넌트
///
/// 카테고리별 동아리 목록을 가로 스크롤로 표시합니다.
///
/// ```diagram
/// +--------------------------------------------------+
/// | [Title: "중앙동아리"]                              |
/// +--------------------------------------------------+
/// | <-------- 가로 스크롤 -------->                   |
/// | +-------+  +-------+  +-------+  +-------+       |
/// | | Image |  | Image |  | Image |  | Image |       |
/// | +-------+  +-------+  +-------+  +-------+       |
/// | | Name  |  | Name  |  | Name  |  | Name  |       |
/// | | #tag1 |  | #tag1 |  | #tag1 |  | #tag1 |       |
/// | | #tag2 |  | #tag2 |  |       |  |       |       |
/// | +-------+  +-------+  +-------+  +-------+       |
/// +--------------------------------------------------+
/// ```
class CircleGroup extends StatelessWidget {
  const CircleGroup({
    Key? key,
    required this.department,
    required this.onItemClicked,
  }) : super(key: key);

  final MapEntry<String, List<CircleListData>> department;
  final Function(String clubUUID) onItemClicked;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    // 다크모드: 섹션 배경 검은색(스캐폴드 배경) 통일 / 라이트: 카드색
    final sectionColor = isDark ? theme.scaffoldBackgroundColor : theme.cardColor;
    // 구분선: 다크모드 얇은 어두운 회색, 라이트모드 밝은 회색
    final dividerColor = theme.dividerColor;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 16, bottom: 16),
          color: sectionColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const SizedBox(width: 24),
                  TextFontWidget.fontRegular(
                    department.key.toDepartment(),
                    fontSize: 16,
                    color: theme.textTheme.bodyLarge!.color,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 204,
                child: ListView.builder(
                  padding: const EdgeInsets.only(left: 24, right: 16),
                  scrollDirection: Axis.horizontal,
                  itemCount: department.value.length,
                  itemBuilder: (context, index) {
                    return CircleItem(
                      circle: department.value[index],
                      onItemClicked: onItemClicked,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        Divider(height: 1, thickness: 1, color: dividerColor),
        const SizedBox(height: 8),
      ],
    );
  }
}

extension Department on String {
  String toDepartment() {
    if (departments.containsKey(this)) {
      return departments[this]!;
    }
    return this;
  }
}
