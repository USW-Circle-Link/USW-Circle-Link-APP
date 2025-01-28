enum FieldType {
  account,
  username,
  telephone,
  studentNumber,
  major,
  passwordConfirm,
  password
}

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
      case "USR-201": // 해당 이메일을 가진 회원 존재 X
      case "USR-209": // 이메일, 아이디 일치 X
        return "해당 정보로 가입된 회원이 없습니다!";
      case "EML-F200": // 이메일 인증 시 아이디 형식 오류
        return "아이디를 입력해주세요!";
      case "VC-F100": // 인증코드 공백
        return "인증코드를 입력해주세요!";
      case "AC-101": // 인증코드가 일치하지 않음
        return "인증코드가 일치하지 않습니다!";
      case "ATTEMPT-503": // 최대 시도 횟수 초과
        return "최대 시도 횟수를 초과했습니다! 잠시후 다시 시도해주세요!";
      case "CG-201": // 해당 학과 동아리가 없음
        return "동아리가 없습니다";
      case "USR-207":
        return "이미 존재하는 아이디입니다!";
      case "USR-202": // 새 비밀번호 확인 불일치
      case "USR-212": // 새 비밀번호 확인 불일치
        return "비밀번호가 일치하지 않습니다!";
      case "USR-F100": // 아이디 규칙 X
        return "아이디는 5~20자 이내 영어, 숫자만 가능합니다!";
      case "USR-214":
      case "USR-203":
      case "USR-F200": // 비밀번호 규칙 X
        return "비밀번호는 영어, 숫자, 특수문자 모두 포함하여 5~20자 이내로 작성해주세요!";
      case "USR-F300": // 비밀번호 일치 X
        return "비밀번호가 일치하지 않습니다!";
      case "USR-F400": // 이름 공백
        return "이름이 형식에 맞지 않습니다!";
      case "USR-F500": // 전화번호 형식에 맞지 않음
        return "전화번호가 형식에 맞지 않습니다!";
      case "USR-F600": // 학번이 공백 혹은 8자리가 아님
        return "학번이 형식에 맞지 않습니다!";
      case "USR-F700": // 학과가 선택되지 않음
        return "단과대학/학과를 선택해주세요!";
      default:
        return null;
    }
  }

  bool isValid(String? code, FieldType fieldType) {
    switch (code) {
      case "USR-207":
      case "USR-F100":
        return fieldType != FieldType.account;
      case "USR-F400": // 이름 공백
        return fieldType != FieldType.username;
      case "USR-F500": // 전화번호 형식에 맞지 않음
        return fieldType != FieldType.telephone;
      case "USR-F600": // 학번이 공백 혹은 8자리가 아님
        return fieldType != FieldType.studentNumber;
      case "USR-F700": // 학과가 선택되지 않음
        return fieldType != FieldType.major;
      case "USR-202": // 새 비밀번호 확인 불일치
      case "USR-212": // 새 비밀번호 확인 불일치
      case "USR-F300":
        return fieldType != FieldType.passwordConfirm;
      case "USR-214":
      case "USR-203":
      case "USR-F200":
        return fieldType != FieldType.password;

      default:
        return true;
    }
  }
}
