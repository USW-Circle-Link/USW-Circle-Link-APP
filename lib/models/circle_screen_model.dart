import 'package:usw_circle_link/utils/logger/logger.dart';

class ClubIntro {
  final int? clubId;
  final String? mainPhotoPath;
  final List<String>? introPhotoPath;
  final String clubName;
  final String leaderName;
  final String leaderHp;
  final String clubInsta;
  final String introContent;
  final String recruitmentStatus;

  ClubIntro({
    this.clubId,
    this.mainPhotoPath,
    this.introPhotoPath,
    required this.clubName,
    required this.leaderName,
    required this.leaderHp,
    required this.clubInsta,
    required this.introContent,
    required this.recruitmentStatus,
  });

  List<String>? getNotEmptyIntroPhotoPath() {
    return introPhotoPath?.where((path) => path.isNotEmpty).toList();
  }

  factory ClubIntro.fromJson(Map<String, dynamic> json) {
    logger.d(json);
    return ClubIntro(
      clubId: json['clubId'],
      mainPhotoPath: json['mainPhoto'],
      introPhotoPath: List<String>.from(json['introPhotos']),
      clubName: json['clubName'],
      leaderName: json['leaderName'],
      leaderHp: json['leaderHp'],
      clubInsta: json['clubInsta'],
      introContent: json['clubIntro'],
      recruitmentStatus: json['recruitmentStatus'],
    );
  }
}