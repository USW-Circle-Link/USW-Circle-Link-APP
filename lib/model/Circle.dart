class ClubIntro {
  final int clubId;
  final String mainPhotoPath;
  final String? introPhotoPath;
  final String clubName;
  final String leaderName;
  final String leaderHp;
  final String clubInsta;
  final String introContent;
  final String recruitmentStatus;

  ClubIntro({
    required this.clubId,
    required this.mainPhotoPath,
    this.introPhotoPath,
    required this.clubName,
    required this.leaderName,
    required this.leaderHp,
    required this.clubInsta,
    required this.introContent,
    required this.recruitmentStatus,
  });

  factory ClubIntro.fromJson(Map<String, dynamic> json) {
    return ClubIntro(
      clubId: json['clubId'],
      mainPhotoPath: json['mainPhotoPath'],
      introPhotoPath: json['introPhotoPath'],
      clubName: json['clubName'],
      leaderName: json['leaderName'],
      leaderHp: json['leaderHp'],
      clubInsta: json['clubInsta'],
      introContent: json['introContent'],
      recruitmentStatus: json['recruitmentStatus'],
    );
  }
}
