class Circle {
  final String userName;
  final String userHp;
  final String studentNumber;
  final String major;

  Circle({
    required this.userName,
    required this.userHp,
    required this.studentNumber,
    required this.major,
  });

  factory Circle.fromJson(Map<String, dynamic> json) {
    return Circle(
      userName: json['userName'],
      userHp: json['userHp'],
      studentNumber: json['studentNumber'],
      major: json['major'],
    );
  }
}
