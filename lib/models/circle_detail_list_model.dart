import 'package:freezed_annotation/freezed_annotation.dart';

part 'circle_detail_list_model.freezed.dart';
part 'circle_detail_list_model.g.dart';

enum CircleListType {
  myCircles("나의 소속 동아리"),
  myApplications("나의 지원 현황");

  const CircleListType(
    this.title,
  );
  final String title;
}

@freezed
class CircleDetailListModel with _$CircleDetailListModel {
  @JsonSerializable(explicitToJson: true)
  factory CircleDetailListModel({
    required String message,
    required List<Circle> data,
  }) = _CircleDetailListModel;

  factory CircleDetailListModel.fromJson(Map<String, dynamic> json) =>
      _$CircleDetailListModelFromJson(json);
}

@freezed
class Circle with _$Circle {
  factory Circle({
    required int clubId,
    String? mainPhotoPath,
    required String clubName,
    required String leaderName,
    required String leaderHp,
    required String clubInsta,
    String? aplictStatus,
  }) = _Circle;

  factory Circle.fromJson(Map<String, dynamic> json) => _$CircleFromJson(json);
}

@freezed
class CircleDetailListModelError
    with _$CircleDetailListModelError
    implements Error {
  CircleDetailListModelError._();

  factory CircleDetailListModelError({
    required String message,
    String? code,
  }) = _CircleDetailListModelError;

  factory CircleDetailListModelError.fromJson(Map<String, dynamic> json) =>
      _$CircleDetailListModelErrorFromJson(json);

  @override
  StackTrace get stackTrace => StackTrace.fromString(toString());
}
