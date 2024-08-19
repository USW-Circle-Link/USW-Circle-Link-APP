import 'package:flutter/material.dart';
import 'package:usw_circle_link/models/circle_list_model.dart';
import 'package:usw_circle_link/views/widgets/circle_group.dart';

class CircleList extends StatelessWidget {
  const CircleList({
    Key? key,
    required this.state,
  }) : super(key: key);

  final CircleListModel state;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: state.data.getClassifiedList().entries.map((entry) {
        return CircleGroup(department: entry);
      }).toList(),
    );
  }
}

extension GetClassifiedList on List<CircleListData> {
  Map<String, List<CircleListData>> getClassifiedList() {
    final result = <String, List<CircleListData>>{};
    forEach((circle) {
      if (result[circle.departmentName] == null) {
        result[circle.departmentName] = <CircleListData>[];
      }
      result[circle.departmentName]!.add(circle);
    });
    return result;
  }
}
