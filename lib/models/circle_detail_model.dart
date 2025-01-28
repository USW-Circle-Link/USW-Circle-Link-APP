class CircleDetailModel {
  final int? circleId;
  final String? mainPhotoPath;
  final List<String>? introPhotoPath;
  final String circleName;
  final String leaderName;
  final String introContent;
  final String recruitmentStatus;
  final String? leaderHp;
  final String? circleInsta;
  final String? circleRoom;
  final List<String>? circleHashtag;

  CircleDetailModel({
    this.circleId,
    this.mainPhotoPath,
    this.introPhotoPath,
    required this.circleName,
    required this.leaderName,
    required this.introContent,
    required this.recruitmentStatus,
    this.circleRoom,
    this.leaderHp,
    this.circleInsta,
    this.circleHashtag,
  });

  List<String>? getNotEmptyIntroPhotoPath() {
    return introPhotoPath?.where((path) => path.isNotEmpty).toList();
  }

  factory CircleDetailModel.fromJson(Map<String, dynamic> json) {
    return CircleDetailModel(
      circleId: json['clubId'],
      mainPhotoPath: json['mainPhoto'],
      introPhotoPath: List<String>.from(json['introPhotos']),
      circleName: json['clubName'],
      leaderName: json['leaderName'],
      leaderHp: json['leaderHp'],
      circleInsta: json['clubInsta'],
      introContent: json['clubIntro'],
      recruitmentStatus: json['recruitmentStatus'],
      circleRoom: json['circleRoom'],
      circleHashtag: List<String>.from(json['clubHashtag'] ?? []),
    );
  }

  @override
  String toString() {
    return 'CircleDetailModel(circleId: $circleId, circleName: $circleName, leaderName: $leaderName, introContent: $introContent, recruitmentStatus: $recruitmentStatus, circleRoom: $circleRoom, circleHashtag: $circleHashtag)';
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
