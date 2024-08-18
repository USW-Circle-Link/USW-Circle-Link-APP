class Circle {
  final int clubId;
  final String mainPhotoPath;
  final String clubName;
  final String leaderName;
  final String leaderHp;
  final String clubInsta;
  final String status;

  Circle({
  required this.clubId,
  required this.mainPhotoPath,
  required this.clubName,
  required this.leaderName,
  required this.leaderHp,
  required this.clubInsta,
  required this.status,
  });
  factory Circle.fromJson(Map<String, dynamic> json) {
    return Circle(
      clubId: json['clubId'],
      mainPhotoPath: json['mainPhotoPath'],
      clubName: json['clubName'],
      leaderName: json['leaderName'],
      leaderHp: json['leaderHp'],
      clubInsta: json['clubInsta'],
      status: json['aplictStatus'],
    );
  }
}
