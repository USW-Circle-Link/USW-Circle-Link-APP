// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'notice_model.freezed.dart';
part 'notice_model.g.dart';

enum NoticeModelType { fetchAll }

@freezed
class NoticeModel with _$NoticeModel {
  NoticeModel._();

  @JsonSerializable(explicitToJson: true)
  factory NoticeModel({
    required String message,
    required List<NoticeData> data,
    NoticeModelType? type,
  }) = _NoticeModel;

  factory NoticeModel.fromJson(Map<String, dynamic> json) =>
      _$NoticeModelFromJson(json);
  NoticeModel setType(NoticeModelType type) => NoticeModel(
        message: message,
        data: data,
        type: type,
      );
}

@freezed
class NoticeData with _$NoticeData {
  factory NoticeData({
    required int noticeId,
    required String noticeTitle,
    required String adminName,
    required String noticeCreatedAt,
  }) = _NoticeData;

  factory NoticeData.fromJson(Map<String, dynamic> json) =>
      _$NoticeDataFromJson(json);
}

@freezed
class NoticeModelError with _$NoticeModelError implements Error {
  NoticeModelError._();
  factory NoticeModelError({
    required String message,
    NoticeModelType? type,
  }) = _NoticeModelError;

  factory NoticeModelError.fromJson(Map<String, dynamic> json) =>
      _$NoticeModelErrorFromJson(json);

  NoticeModelError setType(NoticeModelType type) => NoticeModelError(
        message: message,
        type: type,
      );

  @override
  StackTrace get stackTrace => StackTrace.fromString(toString());
}
