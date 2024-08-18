class Circle {

  final String userName;
  final String studentNumber;
  final String userHp;
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
