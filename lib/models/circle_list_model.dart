// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'circle_list_model.freezed.dart';
part 'circle_list_model.g.dart';

enum CircleListModelType { all, department }

@freezed
class CircleListModel with _$CircleListModel {
  CircleListModel._();

  @JsonSerializable(explicitToJson: true)
  factory CircleListModel({
    required String message,
    required List<CircleListData> data,
    CircleListModelType? type,
  }) = _CircleListModel;

  factory CircleListModel.fromJson(Map<String, dynamic> json) =>
      _$CircleListModelFromJson(json);

  CircleListModel setType(CircleListModelType type) => CircleListModel(
        message: message,
        data: data,
        type: type,
      );
}

@freezed
class CircleListData with _$CircleListData {
  CircleListData._();

  factory CircleListData({
    required int clubId,
    required String clubName,
    String? mainPhoto,
    required String departmentName,
  }) = _CircleListData;

  factory CircleListData.fromJson(Map<String, dynamic> json) =>
      _$CircleListDataFromJson(json);
}

@freezed
class CircleListModelError with _$CircleListModelError implements Error {
  CircleListModelError._();

  factory CircleListModelError({
    String? message,
    CircleListModelType? type,
  }) = _CircleListModelError;

  factory CircleListModelError.fromJson(Map<String, dynamic> json) =>
      _$CircleListModelErrorFromJson(json);

  CircleListModelError setType(CircleListModelType type) =>
      CircleListModelError(
        message: message,
        type: type,
      );

  @override
  StackTrace get stackTrace => StackTrace.fromString(toString());
}
