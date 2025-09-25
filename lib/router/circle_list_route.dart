import 'package:usw_circle_link/models/circle_detail_list_model.dart';

extension CircleListTypeRouteX on CircleListType {
  String get routeKey {
    switch (this) {
      case CircleListType.myCircles:
        return 'my';
      case CircleListType.myApplications:
        return 'applications';
    }
  }
}

CircleListType parseCircleListType(
    String? key, {
      CircleListType fallback = CircleListType.myCircles,
    }) {
  switch (key) {
    case 'my':
      return CircleListType.myCircles;
    case 'applications':
      return CircleListType.myApplications;
    default:
      return fallback;
  }
}