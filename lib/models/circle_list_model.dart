// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'circle_list_model.freezed.dart';
part 'circle_list_model.g.dart';

enum CircleListModelType { all, department }

abstract class CircleListModelBase {}

@freezed
class CircleListModel extends CircleListModelBase with _$CircleListModel {

  CircleListModel._();

  @JsonSerializable(explicitToJson: true)
  factory CircleListModel({
    required String message,
    required List<CircleListData> data,
    CircleListModelType? type,
  }) = _CircleListModel;

  factory CircleListModel.fromJson(Map<String, dynamic> json) => _$CircleListModelFromJson(json);

  CircleListModel setType(CircleListModelType _type) => CircleListModel(message: message, data: data, type: _type,);
}

@freezed
class CircleListData with _$CircleListData {

  CircleListData._();

  factory CircleListData({
    required String clubName,
    required String mainPhoto,
    required String departmentName,
  }) = _CircleListData;

  factory CircleListData.fromJson(Map<String, dynamic> json) => _$CircleListDataFromJson(json);
}

@freezed
class CircleListModelError extends CircleListModelBase with _$CircleListModelError implements Exception {

  CircleListModelError._();

  factory CircleListModelError({
    CircleListModelType? type,
  }) = _CircleListModelError;

  factory CircleListModelError.fromJson(Map<String, dynamic> json) => _$CircleListModelErrorFromJson(json);
  
  CircleListModelError setType(CircleListModelType _type) =>  CircleListModelError(type:_type,);
}

class CircleListModelLoading extends CircleListModelBase {}