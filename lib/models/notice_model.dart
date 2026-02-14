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
    String? message,
    required List<NoticeData> data,
    int? totalPages,
    int? totalElements,
    int? currentPage,
    NoticeModelType? type,
  }) = _NoticeModel;

  factory NoticeModel.fromJson(Map<String, dynamic> json) {
    // API 응답 구조에 따라 처리
    // 구조 1: { "message": "...", "data": { "content": [...], "totalPages": ... } }
    // 구조 2: { "message": "...", "data": [...] }
    // 구조 3: { "message": "...", "content": [...] }
    final dataField = json['data'];
    final contentData = dataField is Map<String, dynamic>
        ? dataField['content'] ?? dataField
        : dataField is List
            ? dataField
            : json['content'];
    
    final noticeList = contentData != null && contentData is List
        ? (contentData as List<dynamic>)
            .map((e) => NoticeData.fromJson(e as Map<String, dynamic>))
            .toList()
            .cast<NoticeData>()
        : <NoticeData>[];
    
    // 페이지네이션 정보는 data 객체 안에 있거나 최상위에 있을 수 있음
    final dataObj = dataField is Map<String, dynamic> ? dataField : json;
    
    return NoticeModel(
      message: json['message'] as String?,
      data: noticeList,
      totalPages: (dataObj['totalPages'] ?? json['totalPages']) as int?,
      totalElements: (dataObj['totalElements'] ?? json['totalElements']) as int?,
      currentPage: (dataObj['currentPage'] ?? json['currentPage']) as int?,
      type: null,
    );
  }
  
  NoticeModel setType(NoticeModelType type) => NoticeModel(
        message: message,
        data: data,
        totalPages: totalPages,
        totalElements: totalElements,
        currentPage: currentPage,
        type: type,
      );
}

@freezed
class NoticeData with _$NoticeData {
  NoticeData._();
  
  factory NoticeData({
    required String noticeUUID,
    required String noticeTitle,
    @JsonKey(name: 'adminName') String? adminName,
    @JsonKey(name: 'authorName') String? authorName,
    required String noticeCreatedAt,
  }) = _NoticeData;

  factory NoticeData.fromJson(Map<String, dynamic> json) {
    // adminName과 authorName 둘 다 지원
    final adminNameValue = json['adminName'] as String?;
    final authorNameValue = json['authorName'] as String?;
    final nameValue = adminNameValue ?? authorNameValue ?? '';
    
    return NoticeData(
      noticeUUID: json['noticeUUID'] as String? ?? '',
      noticeTitle: json['noticeTitle'] as String? ?? '',
      adminName: nameValue,
      authorName: nameValue,
      noticeCreatedAt: json['noticeCreatedAt'] as String? ?? '',
    );
  }
  
  Map<String, dynamic> toJson() => {
    'noticeUUID': noticeUUID,
    'noticeTitle': noticeTitle,
    'adminName': adminName,
    'authorName': authorName,
    'noticeCreatedAt': noticeCreatedAt,
  };
}

extension NoticeDataExtension on NoticeData {
  String get author => adminName ?? authorName ?? '';
}

@freezed
class NoticeModelError with _$NoticeModelError implements Exception {
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

  StackTrace get stackTrace => StackTrace.fromString(toString());
}
