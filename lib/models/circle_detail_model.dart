import 'package:usw_circle_link/models/enums/recruitment_status.dart';

class CircleDetailModel {
  final String? circleUUID;
  final String? mainPhotoPath;
  final List<String>? introPhotoPath;
  final String circleName;
  final String leaderName;
  final String? introContent;
  final RecruitmentStatus recruitmentStatus;
  final String? leaderHp;
  final String? circleInsta;
  final String? circleRoom;
  final List<String>? circleHashtag;
  final String? clubRecruitment;
  final String? googleFormUrl;
  final List<String>? clubCategoryNames;

  CircleDetailModel({
    this.circleUUID,
    this.mainPhotoPath,
    this.introPhotoPath,
    required this.circleName,
    required this.leaderName,
    this.introContent,
    required this.recruitmentStatus,
    this.clubRecruitment,
    this.circleRoom,
    this.leaderHp,
    this.circleInsta,
    this.circleHashtag,
    this.googleFormUrl,
    this.clubCategoryNames,
  });

  List<String>? getNotEmptyIntroPhotoPath() {
    return introPhotoPath?.where((path) => path.isNotEmpty).toList();
  }

  factory CircleDetailModel.fromJson(Map<String, dynamic> json) {
    final introPhotos = json['introPhotos'] ?? json['infoPhotos'];
    final introPhotoList = introPhotos != null
        ? (List<String>.from(introPhotos))
            .where((path) => path != null && path.toString().isNotEmpty)
            .map((path) => path.toString())
            .toList()
        : null;
    
    return CircleDetailModel(
      circleUUID: json['clubUUID'],
      mainPhotoPath: json['mainPhoto'],
      introPhotoPath: introPhotoList,
      circleName: json['clubName'],
      leaderName: json['leaderName'],
      leaderHp: json['leaderHp'],
      circleInsta: json['clubInsta'],
      introContent: json['clubIntro'] ?? json['clubInfo'],
      recruitmentStatus: RecruitmentStatus.fromString(
        json['recruitmentStatus'] as String,
      ),
      clubRecruitment: json['clubRecruitment'],
      circleRoom: json['clubRoomNumber'],
      circleHashtag: List<String>.from(json['clubHashtags'] ?? []),
      googleFormUrl: json['googleFormUrl'],
      clubCategoryNames: json['clubCategoryNames'] != null
          ? List<String>.from(json['clubCategoryNames'])
          : null,
    );
  }

  @override
  String toString() {
    return 'CircleDetailModel(circleUUID: $circleUUID, circleName: $circleName, leaderName: $leaderName, introContent: $introContent, recruitmentStatus: $recruitmentStatus, circleRoom: $circleRoom, circleHashtag: $circleHashtag, clubRecruitment: $clubRecruitment)';
  }
}

class CircleDetailModelError extends Error {
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

  @override
  StackTrace get stackTrace => StackTrace.fromString(toString());
}
