// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'floor_photo_model.freezed.dart';
part 'floor_photo_model.g.dart';

@freezed
class FloorPhotoModel with _$FloorPhotoModel {
  @JsonSerializable(explicitToJson: true)
  factory FloorPhotoModel({
    required String message,
    required FloorPhotoData data,
  }) = _FloorPhotoModel;

  factory FloorPhotoModel.fromJson(Map<String, dynamic> json) =>
      _$FloorPhotoModelFromJson(json);
}

@freezed
class FloorPhotoData with _$FloorPhotoData {
  factory FloorPhotoData({
    required String roomFloor,
    required String floorPhotoPath,
  }) = _FloorPhotoData;

  factory FloorPhotoData.fromJson(Map<String, dynamic> json) =>
      _$FloorPhotoDataFromJson(json);
}

@freezed
class FloorPhotoModelError with _$FloorPhotoModelError implements Exception {
  FloorPhotoModelError._();

  factory FloorPhotoModelError({
    required String message,
    String? code,
  }) = _FloorPhotoModelError;

  factory FloorPhotoModelError.fromJson(Map<String, dynamic> json) =>
      _$FloorPhotoModelErrorFromJson(json);

  StackTrace get stackTrace => StackTrace.fromString(toString());
}
