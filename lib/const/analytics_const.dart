enum LoginMethod {
  autoLogin,
  login,
}

enum LogoutMethod {
  logout,
  abnormalLogout,
}

class AnalyticsEvent {
  // 계정 관련
  static const String signUp = 'sign_up';
  static const String deleteAccount = 'delete_account';
  static const String refreshToken = 'refresh_token';

  // 사용자 행동
  static const String clubClick = 'club_click';
  static const String clubApply = 'club_apply';
  static const String filterSelect = 'filter_select';
  static const String profileUpdate = 'profile_update';

  // 디버깅
  static const String error = 'error';
}

class AnalyticsParam {
  // 동아리 관련
  static const String clubUUID = 'club_uuid';
  static const String clubName = 'club_name';
  static const String filterCategories = 'filter_categories';

  // 사용자 정보
  static const String studentNumber = 'student_number';
  static const String userName = 'user_name';
  static const String major = 'major';
  static const String userHp = 'user_hp';
  static const String account = 'account';
  static const String email = 'email';

  // 회원가입 정보
  static const String signUpMethod = 'sign_up_method';

  // 에러 관련
  static const String errorType = 'error_type';
  static const String errorMessage = 'error_message';
  static const String errorCode = 'error_code';
  static const String screen = 'screen';
  static const String timestamp = 'timestamp';
}
