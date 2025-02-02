// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
class CategoryModel with _$CategoryModel {
  CategoryModel._();

  @JsonSerializable(explicitToJson: true)
  factory CategoryModel({
    required String message,
    required List<CategoryData> data,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}

@freezed
class CategoryData with _$CategoryData {
  factory CategoryData({
    required int clubCategoryId,
    required String clubCategory,
  }) = _CategoryData;

  factory CategoryData.fromJson(Map<String, dynamic> json) =>
      _$CategoryDataFromJson(json);
}

@freezed
class CategoryModelError with _$CategoryModelError implements Error {
  CategoryModelError._();

  factory CategoryModelError({
    required String message,
    String? code,
  }) = _CategoryModelError;

  factory CategoryModelError.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelErrorFromJson(json);

  @override
  StackTrace get stackTrace => StackTrace.fromString(toString());
}
