import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';

import '../const/analytics_const.dart';
import '../models/response/global_exception.dart';

enum FieldType {
  account,
  username,
  telephone,
  studentNumber,
  major,
  passwordConfirm,
  password,
  email,
  currentPassword,
  code
}

class ErrorUtil {
  ErrorUtil._();

  static final ErrorUtil instance = ErrorUtil._();

  String? getErrorMessage(String? code) {
    logger.d('code - $code');
    switch (code) {
      case "USR-F400": // 이름 공백
        return '이름은 특수문자 제외 2~30자 이내로 입력해주세요.';
      case "USR-F500": // 전화번호 형식에 맞지 않음
        return '전화번호를 입력해주세요. (- 제외 11자)';
      case "USR-F600": // 학번이 공백 혹은 8자리가 아님
        return '학번을 입력해주세요. (숫자8자)';
      case "USR-F700": // 학과가 선택되지 않음
        return '단과대학/학과를 선택해주세요.';
      case "EML-F100": // 이메일 형식에 맞지 않음
      case "EML-F200": // 아이디가 형식에 맞지 않음
      case "USR-201": // 해당 이메일을 가진 회원 존재 X
      case "USR-209": // 이메일, 아이디 일치 X
        return "해당 정보로 가입된 회원이 없습니다.";
      case "EML-F200": // 이메일 인증 시 아이디 형식 오류
        return "아이디를 입력해주세요!";
      case "VC-F100": // 인증코드 공백
        return "인증코드를 입력해주세요!";
      case "AC-101": // 인증코드가 일치하지 않음
      case "WT-101": // 인증코드가 일치하지 않음
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
      case "USR-F200": // 비밀번호 규칙 X
      case "USR-203": // 비밀번호 규칙 X
      case "USR-214": // 비밀번호 규칙 X
        return "비밀번호는 영어, 숫자, 특수문자 모두 포함하여\n8~20자 이내로 작성해주세요!";
      case "USR-F300": // 비밀번호 일치 X
        return "비밀번호가 일치하지 않습니다!";
      case "PFL-207": // 이미 존재하는 프로필
        return "동아리 가입 정보가 존재하는 회원입니다.\n기존 회원 가입을 이용해 주세요.";
      case "USR-216": // 비회원
        return "회원 가입 요청이 진행 중이에요.\n동아리 회장의 가입 요청 수락 후 로그인이 가능해요.";
      case "USR-F211": // 필드값 에러 ex) 아이디 혹은 비밀번호 길이
      case "USR-211": // 올바르지 않은 아이디 혹은 비밀번호
      case "USR-220": // 제3자의 로그인 요청
      case "USR-F800": // 아이디 혹은 비밀번호 공백
        return "아이디 또는 비밀번호가 일치하지 않습니다.";
      case "USR-F900": // 현재 비밀번호 공백
        return "현재 비밀번호를 입력해주세요!";
      case "USR-204": // 현재 비밀번호 불일치
        return "현재 비밀번호가 일치하지 않습니다";
      case "USR-210": // 해당 정보로 인증 중인 회원존재 X
        return "비밀번호를 변경하는 데 잠시 문제가 생겼습니다. 잠시후에 다시 시도해주세요!";
      case "USR-217": // 현재 비밀번호와 새 비밀번호가 같음
        return "현재 비밀번호와 동일한 비밀번호는 사용할 수 없습니다.";
      case "USR-206": // 이미 가입된 포털 이메일
      case "CMEM-TEMP-302":
        return "이미 사용 중인 이메일입니다.";
      case "CMEM-TEMP-303":
        return "이미 회원 가입 요청을 보냈습니다.\n동아리 회장의 가입 요청 수락까지 대기해주세요.";
      case "USR-F401":
        return "로그인 후 이용해 주시기 바랍니다!";
      case "APT-205": // 지원함
      case "APT-206": // 소속됨
      case "APT-207": // 전화번호 중복
      case "APT-208": // 학번 중복
        return "이미 지원한 동아리 또는\n소속된 동아리입니다.";
      case "ABNORMAL-ACCESS":
        return "비정상적인 접근입니다.";
      case "CINT-202":
        return "아직 지원서가 등록되지 않았어요.";
      case "EMAIL_TOKEN-005":
        return "인증이 완료되지 않았습니다. 인증을 완료해주세요.";
      case "EVT-101":
        return "👻 인증코드가 올바르지 않습니다. 👻";
      case "COM-302":
        return "중앙동아리 소속이 아니에요.";
      default:
        return null;
    }
  }

  bool isValid(String? code, FieldType fieldType) {
    return isValidOrNull(code, fieldType) ?? true;
  }

  bool? isValidOrNull(String? code, FieldType fieldType) {
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
      case "USR-204":
      case "USR-F900":
        return fieldType != FieldType.currentPassword;
      case "EML-F100":
        return fieldType != FieldType.email;
      case "VC-F100":
        return fieldType != FieldType.code;
      default:
        return null;
    }
  }

  bool isDialogError(String? code) {
    return [
      "CMEM-TEMP-303",
      "PFL-207",
    ].contains(code);
  }

  bool isNeedToRedirectLogin(String? code) {
    return [
      "CMEM-TEMP-303",
    ].contains(code);
  }

  bool isNeedToRedirectSignUpOption(String? code) {
    return [
      "PFL-207",
    ].contains(code);
  }

  FieldType? getFieldType(String? code) {
    switch (code) {
      case "USR-214":
      case "USR-203":
      case "USR-F200":
        return FieldType.password;
      case "USR-202":
      case "USR-212":
      case "USR-F300":
        return FieldType.passwordConfirm;
      case "USR-204":
      case "USR-F900":
        return FieldType.currentPassword;
      case "USR-F400":
      case "USR-F500":
      case "USR-F600":
      case "USR-F700":
        return FieldType.username;
      case "USR-F800":
      case "USR-207":
        return FieldType.account;
      default:
        return null;
    }
  }

  Future<void> logError(GlobalException exception, {String? screen}) async {
    final message =
        '[${exception.exception}](${exception.status}) message: ${exception.message} / code: ${exception.code} / screen: ${exception.screen} / errorType: ${exception.errorType}';
    await Sentry.captureException(message);
    analytics.logEvent(
      name: AnalyticsEvent.error,
      parameters: {
        AnalyticsParam.errorType: exception.runtimeType.toString(),
        AnalyticsParam.errorCode: exception.code ?? 'unknown',
        AnalyticsParam.errorMessage: exception.message ?? 'unknown',
        AnalyticsParam.screen: exception.screen ?? 'unknown',
        AnalyticsParam.timestamp: DateTime.now().toIso8601String(),
      },
    );
  }
}
