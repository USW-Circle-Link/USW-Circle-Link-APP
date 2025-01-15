enum FieldType { username, phoneNumber, studentNumber, major }

class ErrorUtil {
  ErrorUtil._();

  static final ErrorUtil instance = ErrorUtil._();

  String? getErrorMessage(String? code) {
    switch (code) {
      case "USR-F400": // 이름 공백
        return '이름이 형식에 맞지 않습니다!';
      case "USR-F500": // 전화번호 형식에 맞지 않음
        return '전화번호가 형식에 맞지 않습니다!';
      case "USR-F600": // 학번이 공백 혹은 8자리가 아님
        return '학번이 형식에 맞지 않습니다!';
      case "USR-F700": // 학과가 선택되지 않음
        return '단과대학/학과를 선택해주세요!';
      case "EML-F100": // 이메일 형식에 맞지 않음
        return "이메일을 입력해주세요.";
      case "USR-206": // 이미 가입된 포털 이메일
        return "이미 가입된 포털 이메일입니다!";
      case "ATTEMPT-503": // 최대 시도 횟수 초과
        return "최대 시도 횟수를 초과했습니다! 잠시후 다시 시도해주세요!";
      default:
        return null;
    }
  }

  bool isValid(String? code, FieldType fieldType) {
    switch (code) {
      case "USR-F400": // 이름 공백
        return fieldType != FieldType.username;
      case "USR-F500": // 전화번호 형식에 맞지 않음
        return fieldType != FieldType.phoneNumber;
      case "USR-F600": // 학번이 공백 혹은 8자리가 아님
        return fieldType != FieldType.studentNumber;
      case "USR-F700": // 학과가 선택되지 않음
        return fieldType != FieldType.major;
      default:
        return true;
    }
  }
}
