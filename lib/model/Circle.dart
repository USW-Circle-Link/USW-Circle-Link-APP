class Circle {
  final String userName;
  final String studentNumber; // Changed to String as per the response
  final String userHp; // Changed to String as per the response
  final String major;

  Circle({
    required this.userName,
    required this.studentNumber,
    required this.userHp,
    required this.major,
  });

  factory Circle.fromJson(Map<String, dynamic> json) {
    return Circle(
      userName: json['userName'],
      studentNumber: json['studentNumber'],
      userHp: json['userHp'],
      major: json['major'],
    );
  }
}
