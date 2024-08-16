class Club {
  final String clubName;
  final String mainPhotoPath;
  final String departmentName;

  Club(
      {required this.clubName,
      required this.mainPhotoPath,
      required this.departmentName});

  factory Club.fromJson(Map<String, dynamic> json) {
    return Club(
      clubName: json['clubName'],
      mainPhotoPath: json['mainPhotoPath'],
      departmentName: json['departmentName'],
    );
  }
}
