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
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.only(top: 16, bottom: 16),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(width: 24),
              TextFontWidget.fontRegular(
                department.key.toDepartment(),
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
          SizedBox(height: 8), // 텍스트와 리스트 사이에 여백 추가
          SizedBox(
            height: 204, // ListView의 고정 높이 설정
            child: ListView.builder(
              padding: EdgeInsets.only(left: 24, right: 16),
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
