class Circle {
  final int clubId;
  final String mainPhotoPath;
  final String clubName;
  final String leaderName;
  final String katalkID;
  final String clubInsta;

  Circle({
    required this.clubId,
    required this.mainPhotoPath,
    required this.clubName,
    required this.leaderName,
    required this.katalkID,
    required this.clubInsta,
  });

  factory Circle.fromJson(Map<String, dynamic> json) {
    return Circle(
      clubId: json['clubId'],
      mainPhotoPath: json['mainPhotoPath'],
      clubName: json['clubName'],
      leaderName: json['leaderName'],
      katalkID: json['katalkID'],
      clubInsta: json['clubInsta'],
    );
  }
}
