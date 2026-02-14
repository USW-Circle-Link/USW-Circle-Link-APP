import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:usw_circle_link/models/enums/recruitment_status.dart';

part 'circle_detail_model.freezed.dart';

@freezed
class CircleDetailModel with _$CircleDetailModel {
  const CircleDetailModel._();

  const factory CircleDetailModel({
    String? circleUUID,
    String? mainPhotoPath,
    List<String>? introPhotoPath,
    required String circleName,
    required String leaderName,
    String? introContent,
    required RecruitmentStatus recruitmentStatus,
    String? leaderHp,
    String? circleInsta,
    String? circleRoom,
    List<String>? circleHashtag,
    String? clubRecruitment,
    String? googleFormUrl,
    List<String>? clubCategoryNames,
  }) = _CircleDetailModel;

  List<String>? getNotEmptyIntroPhotoPath() {
    return introPhotoPath?.where((path) => path.isNotEmpty).toList();
  }

  factory CircleDetailModel.fromJson(Map<String, dynamic> json) {
    final introPhotos = json['introPhotos'] ?? json['infoPhotos'];
    final introPhotoList = introPhotos is List
        ? introPhotos
            .where((p) => p != null)
            .map((p) => p.toString())
            .where((p) => p.isNotEmpty)
            .toList()
        : null;

    return CircleDetailModel(
      circleUUID: json['clubUUID'] as String?,
      mainPhotoPath: json['mainPhoto'] as String?,
      introPhotoPath: introPhotoList,
      circleName: json['clubName'] as String? ?? '',
      leaderName: json['leaderName'] as String? ?? '',
      leaderHp: json['leaderHp'] as String?,
      circleInsta: json['clubInsta'] as String?,
      introContent: (json['clubIntro'] ?? json['clubInfo']) as String?,
      recruitmentStatus: json['recruitmentStatus'] != null
          ? RecruitmentStatus.fromString(json['recruitmentStatus'] as String)
          : RecruitmentStatus.close,
      clubRecruitment: json['clubRecruitment'] as String?,
      circleRoom: json['clubRoomNumber'] as String?,
      circleHashtag: json['clubHashtags'] is List
          ? (json['clubHashtags'] as List)
              .where((e) => e != null)
              .map((e) => e.toString())
              .toList()
          : <String>[],
      googleFormUrl: json['googleFormUrl'] as String?,
      clubCategoryNames: json['clubCategoryNames'] is List
          ? (json['clubCategoryNames'] as List)
              .where((e) => e != null)
              .map((e) => e.toString())
              .toList()
          : null,
    );
  }
}

class CircleDetailModelError implements Exception {
  final String message;
  final String? code;

  CircleDetailModelError({required this.message, this.code});

  factory CircleDetailModelError.fromJson(Map<String, dynamic> json) {
    return CircleDetailModelError(
      message: json['message'],
      code: json['code'],
    );
  }

  @override
  String toString() {
    return 'CircleDetailModelError: $message${code != null ? ' (code: $code)' : ''}';
  }
}
