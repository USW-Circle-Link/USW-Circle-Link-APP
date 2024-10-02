enum FieldType { USERNAME, PHONE_NUMBER, STUDENT_NUMBER, MAJOR }

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
      default:
        return null;
    }
  }

  bool isValid(String? code, FieldType fieldType) {
    switch (code) {
      case "USR-F400": // 이름 공백
        return fieldType != FieldType.USERNAME;
      case "USR-F500": // 전화번호 형식에 맞지 않음
        return fieldType != FieldType.PHONE_NUMBER;
      case "USR-F600": // 학번이 공백 혹은 8자리가 아님
        return fieldType != FieldType.STUDENT_NUMBER;
      case "USR-F700": // 학과가 선택되지 않음
        return fieldType != FieldType.MAJOR;
      default:
        return true;
    }
  }
}
