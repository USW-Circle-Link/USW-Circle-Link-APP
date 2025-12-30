import 'package:flutter/material.dart';
import 'package:usw_circle_link/models/circle_list_model.dart';
import 'package:usw_circle_link/utils/extensions.dart';
import 'package:usw_circle_link/widgets/circle_group/circle_group.dart';
import 'package:usw_circle_link/common/scroll_behavior.dart';

/// 동아리 목록 컴포넌트
///
/// 카테고리별로 분류된 동아리 그룹을 세로 스크롤로 표시합니다.
///
/// ```diagram
/// +--------------------------------------------------+
/// | [CircleGroup: "중앙동아리"]                        |
/// |   +-------+  +-------+  +-------+  ...           |
/// |   | Item1 |  | Item2 |  | Item3 |                |
/// |   +-------+  +-------+  +-------+                |
/// +--------------------------------------------------+
/// | [CircleGroup: "연합동아리"]                        |
/// |   +-------+  +-------+  +-------+  ...           |
/// |   | Item1 |  | Item2 |  | Item3 |                |
/// |   +-------+  +-------+  +-------+                |
/// +--------------------------------------------------+
/// | ...                                              |
/// +--------------------------------------------------+
/// ```
class CircleList extends StatelessWidget {
  const CircleList({
    Key? key,
    required this.state,
    required this.onItemClicked,
  }) : super(key: key);

  final CircleListModel state;
  final Function(String clubUUID) onItemClicked;

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
        behavior: MyScrollBehavior(),
        child: ListView(
          shrinkWrap: true,
          children: state.data
              .getClassifiedList()
              .getSortedListWithValidImage()
              .entries
              .map((entry) {
            return CircleGroup(department: entry, onItemClicked: onItemClicked);
          }).toList(),
        )
    );
  }
}

extension GetClassifiedList on List<CircleListData> {
  Map<String, List<CircleListData>> getClassifiedList() {
    final result = <String, List<CircleListData>>{};
    forEach((circle) {
      if (circle.departmentName != null) {
        if (result[circle.departmentName!] == null) {
          result[circle.departmentName!] = <CircleListData>[];
        }
        result[circle.departmentName!]!.add(circle);
      }
    });
    return result;
  }
}

extension GetSortedListWithValidImage on Map<String, List<CircleListData>> {
  Map<String, List<CircleListData>> getSortedListWithValidImage() {
    final result = <String, List<CircleListData>>{};
    forEach((key, value) {
      final validImageList = value
          .where((circle) =>
              circle.mainPhoto != null && circle.mainPhoto!.isValidUrl)
          .toList();
      final invalidImageList = value
          .where((circle) =>
              circle.mainPhoto == null || !circle.mainPhoto!.isValidUrl)
          .toList();
      result[key] = [...validImageList, ...invalidImageList];
    });
    return result;
  }
}
