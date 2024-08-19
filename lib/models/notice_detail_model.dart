import 'package:freezed_annotation/freezed_annotation.dart';

part 'notice_detail_model.freezed.dart';
part 'notice_detail_model.g.dart';

enum NoticeDetailModelType { getDetail }

abstract class NoticeDetailModelBase {}

@freezed
class NoticeDetailModel extends NoticeDetailModelBase with _$NoticeDetailModel {
  NoticeDetailModel._();
  @JsonSerializable(explicitToJson: true)
  factory NoticeDetailModel({
    String? message,
    required NoticeDetailData data,
    NoticeDetailModelType? type,
  }) = _NoticeDetailModel;

  factory NoticeDetailModel.fromJson(Map<String, dynamic> json) =>
      _$NoticeDetailModelFromJson(json);
  NoticeDetailModel setType(NoticeDetailModelType _type) => NoticeDetailModel(
        message: message,
        data: data,
        type: _type,
      );
}

@freezed
class NoticeDetailData with _$NoticeDetailData {
  @JsonSerializable(explicitToJson: true)
  factory NoticeDetailData({
    required int noticeId,
    required String noticeTitle,
    required String noticeContent,
    String? adminName,
    required String noticeCreatedAt,
    List<String>? noticePhotos,
  }) = _NoticeDetailData;

  factory NoticeDetailData.fromJson(Map<String, dynamic> json) =>
      _$NoticeDetailDataFromJson(json);
}

@freezed
class NoticeDetailModelError extends NoticeDetailModelBase
    with _$NoticeDetailModelError
    implements Exception {
  NoticeDetailModelError._();
  factory NoticeDetailModelError({
    required String message,
    NoticeDetailModelType? type,
  }) = _NoticeDetailModelError;

  factory NoticeDetailModelError.fromJson(Map<String, dynamic> json) =>
      _$NoticeDetailModelErrorFromJson(json);

  NoticeDetailModelError setType(NoticeDetailModelType _type) =>
      NoticeDetailModelError(
        message: message,
        type: _type,
      );
}

class NoticeDetailLoading extends NoticeDetailModelBase {}
