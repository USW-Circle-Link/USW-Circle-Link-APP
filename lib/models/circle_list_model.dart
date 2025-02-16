// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'circle_list_model.freezed.dart';
part 'circle_list_model.g.dart';

enum CircleListModelType { all, department, filtered_all, filtered_open }

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
class CircleFilteredListModel with _$CircleFilteredListModel {
  CircleFilteredListModel._();

  @JsonSerializable(explicitToJson: true)
  factory CircleFilteredListModel({
    required String message,
    required List<CircleFilteredListData> data,
    CircleListModelType? type,
  }) = _CircleFilteredListModel;

  factory CircleFilteredListModel.fromJson(Map<String, dynamic> json) =>
      _$CircleFilteredListModelFromJson(json);

  CircleFilteredListModel setType(CircleListModelType type) =>
      CircleFilteredListModel(
        message: message,
        data: data,
        type: type,
      );
}

@freezed
class CircleListData with _$CircleListData {
  CircleListData._();

  factory CircleListData({
    required String clubUUID,
    required String clubName,
    String? mainPhoto,
    String? departmentName, // Optional 한 이유 필터링 조회 시 분과 이름이 없을 수 있음
    List<String>? clubHashtags,
  }) = _CircleListData;

  factory CircleListData.fromJson(Map<String, dynamic> json) =>
      _$CircleListDataFromJson(json);

  CircleListData setDepartmentName(String? departmentName) => CircleListData(
        clubUUID: clubUUID,
        clubName: clubName,
        mainPhoto: mainPhoto,
        departmentName: departmentName,
        clubHashtags: clubHashtags,
      );
}

@freezed
class CircleFilteredListData with _$CircleFilteredListData {
  factory CircleFilteredListData({
    required String clubCategoryUUID,
    required String clubCategoryName,
    required List<CircleListData> clubs,
  }) = _CircleFilteredListData;

  factory CircleFilteredListData.fromJson(Map<String, dynamic> json) =>
      _$CircleFilteredListDataFromJson(json);
}

@freezed
class CircleListModelError with _$CircleListModelError implements Error {
  CircleListModelError._();

  factory CircleListModelError({
    String? message,
    String? code,
    CircleListModelType? type,
  }) = _CircleListModelError;

  factory CircleListModelError.fromJson(Map<String, dynamic> json) =>
      _$CircleListModelErrorFromJson(json);

  CircleListModelError setType(CircleListModelType type) =>
      CircleListModelError(
        message: message,
        code: code,
        type: type,
      );

  @override
  StackTrace get stackTrace => StackTrace.fromString(toString());
}
