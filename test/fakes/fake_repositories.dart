import 'package:dio/dio.dart';
import 'package:usw_circle_link/models/change_pw_model.dart';
import 'package:usw_circle_link/models/find_id_model.dart';
import 'package:usw_circle_link/models/response/find_pw_response.dart';
import 'package:usw_circle_link/models/profile_model.dart';
import 'package:usw_circle_link/models/request/sign_up_request.dart';
import 'package:usw_circle_link/models/response/email_verification_response.dart';
import 'package:usw_circle_link/models/response/send_mail_response.dart';
import 'package:usw_circle_link/models/token_data.dart';
import 'package:usw_circle_link/models/login_data.dart';
import 'package:usw_circle_link/repositories/auth_repository.dart';
import 'package:usw_circle_link/repositories/profile_repository.dart';
import 'package:usw_circle_link/repositories/token_repository.dart';
import 'package:usw_circle_link/utils/result.dart';

/// Fake AuthRepository for testing
///
/// 실제 동작하는 간단한 구현체로, Mock보다 실제 시나리오에 가깝습니다.
class FakeAuthRepository implements AuthRepository {
  @override
  String get basePath => '/users';

  @override
  Dio get dio => Dio();

  bool shouldSucceed = true;
  LoginData? lastLoginData;

  @override
  Future<Result<LoginData>> login({
    required String id,
    required String password,
    required String fcmToken,
  }) async {
    await Future.delayed(const Duration(milliseconds: 100));

    if (shouldSucceed && id.isNotEmpty && password.isNotEmpty) {
      lastLoginData = LoginData(
        accessToken: 'fake_access_token_$id',
        refreshToken: 'fake_refresh_token_$id',
      );
      return Result.ok(lastLoginData!);
    } else {
      return Result.error(Exception('Login failed'));
    }
  }

  @override
  Future<Result<bool>> logout({
    required String accessToken,
    required String refreshToken,
  }) async {
    await Future.delayed(const Duration(milliseconds: 100));

    if (shouldSucceed) {
      return Result.ok(true);
    } else {
      return Result.error(Exception('Logout failed'));
    }
  }

  @override
  Future<Result<ChangePwModel>> changePW({
    required String userPw,
    required String newPw,
    required String confirmNewPw,
  }) async {
    await Future.delayed(const Duration(milliseconds: 100));

    if (shouldSucceed && newPw == confirmNewPw) {
      return Result.ok(
        ChangePwModel(
          message: '비밀번호가 변경되었습니다',
          type: ChangePwModelType.changePW,
        ),
      );
    } else {
      return Result.error(Exception('Password change failed'));
    }
  }

  @override
  Future<Result<ChangePwModel>> resetPW({
    required String password,
    required String confirmPassword,
    required String uuid,
  }) async {
    await Future.delayed(const Duration(milliseconds: 100));

    if (shouldSucceed && password == confirmPassword) {
      return Result.ok(
        ChangePwModel(
          message: '비밀번호가 재설정되었습니다',
          type: ChangePwModelType.resetPW,
        ),
      );
    } else {
      return Result.error(Exception('Password reset failed'));
    }
  }

  // 회원가입 관련 메서드들
  @override
  Future<Result<SendMailResponse>> sendMail({required String email}) async {
    await Future.delayed(const Duration(milliseconds: 100));

    if (shouldSucceed) {
      return Result.ok(
        SendMailResponse(
          message: '인증 메일이 발송되었습니다',
          data: SendMailData(
            emailTokenUUID: 'fake-uuid',
            email: email,
          ),
        ),
      );
    } else {
      return Result.error(Exception('Send mail failed'));
    }
  }

  @override
  Future<Result<EmailVerificationResponse>> verifyEmailVerification({
    required String email,
  }) async {
    await Future.delayed(const Duration(milliseconds: 100));

    if (shouldSucceed) {
      return Result.ok(
        EmailVerificationResponse(
          message: '이메일 인증 성공',
          data: EmailVerificationData(
            emailTokenUuid: 'fake-email-token-uuid',
            signupUuid: 'fake-signup-uuid',
          ),
        ),
      );
    } else {
      return Result.error(Exception('Email verification failed'));
    }
  }

  @override
  Future<Result<bool>> verifyId({required String id}) async {
    await Future.delayed(const Duration(milliseconds: 100));
    return shouldSucceed
        ? Result.ok(true)
        : Result.error(Exception('ID verification failed'));
  }

  @override
  Future<Result<bool>> verifyEmail({required String email}) async {
    await Future.delayed(const Duration(milliseconds: 100));
    return shouldSucceed
        ? Result.ok(true)
        : Result.error(Exception('Email verification failed'));
  }

  @override
  Future<Result<bool>> signUpNewMember({required SignUpRequest request}) async {
    await Future.delayed(const Duration(milliseconds: 100));
    return shouldSucceed
        ? Result.ok(true)
        : Result.error(Exception('Sign up failed'));
  }

  @override
  Future<Result<bool>> signUpExistingMember({
    required SignUpRequest request,
  }) async {
    await Future.delayed(const Duration(milliseconds: 100));
    return shouldSucceed
        ? Result.ok(true)
        : Result.error(Exception('Sign up failed'));
  }

  @override
  Future<Result<FindIdModel>> findId({required String email}) async {
    await Future.delayed(const Duration(milliseconds: 100));

    if (shouldSucceed) {
      return Result.ok(
        FindIdModel(message: '아이디 찾기 성공'),
      );
    } else {
      return Result.error(Exception('Find ID failed'));
    }
  }

  @override
  Future<Result<FindPwModel>> sendCode({
    required String account,
    required String email,
  }) async {
    await Future.delayed(const Duration(milliseconds: 100));

    if (shouldSucceed) {
      return Result.ok(
        FindPwModel(
          message: '인증 코드가 발송되었습니다',
          data: 'fake-uuid',
          type: FindPwModelType.sendCode,
        ),
      );
    } else {
      return Result.error(Exception('Send code failed'));
    }
  }

  @override
  Future<Result<FindPwModel>> verifyCode({
    required String code,
    required String uuid,
  }) async {
    await Future.delayed(const Duration(milliseconds: 100));

    if (shouldSucceed) {
      return Result.ok(
        FindPwModel(
          message: '인증 코드 확인 성공',
          data: uuid,
          type: FindPwModelType.verifyCode,
        ),
      );
    } else {
      return Result.error(Exception('Verify code failed'));
    }
  }
}

/// Fake TokenRepository for testing
class FakeTokenRepository implements TokenRepository {
  TokenData? _storedToken;

  @override
  Future<Result<TokenData>> getTokens() async {
    await Future.delayed(const Duration(milliseconds: 50));

    if (_storedToken != null) {
      return Result.ok(_storedToken!);
    }
    return Result.error(Exception('저장된 토큰이 없습니다.'));
  }

  @override
  Future<Result<void>> saveTokens({
    required String accessToken,
    required String refreshToken,
    required List<String> clubUUIDs,
  }) async {
    await Future.delayed(const Duration(milliseconds: 50));

    _storedToken = TokenData(
      accessToken: accessToken,
      refreshToken: refreshToken,
      clubUUIDs: clubUUIDs,
    );
    return Result.ok(null);
  }

  @override
  Future<Result<void>> clearTokens() async {
    await Future.delayed(const Duration(milliseconds: 50));

    _storedToken = null;
    return Result.ok(null);
  }

  // 테스트 헬퍼 메서드
  TokenData? get storedToken => _storedToken;
  bool get hasToken => _storedToken != null;
}

/// Fake ProfileRepository for testing
class FakeProfileRepository implements ProfileRepository {
  @override
  String get basePath => '/profiles';

  @override
  Dio get dio => Dio();

  bool shouldSucceed = true;
  ProfileData? _currentProfile;

  FakeProfileRepository() {
    _currentProfile = ProfileData(
      userName: 'Test User',
      studentNumber: '12345678',
      userHp: '010-1234-5678',
      major: 'Computer Science',
      password: null,
    );
  }

  @override
  Future<Result<ProfileData>> getProfile() async {
    await Future.delayed(const Duration(milliseconds: 100));

    if (shouldSucceed && _currentProfile != null) {
      return Result.ok(_currentProfile!);
    } else {
      return Result.error(Exception('Profile error'));
    }
  }

  @override
  Future<Result<bool>> updateProfile({
    required String userName,
    required String studentNumber,
    required String userHp,
    required String major,
    required String password,
  }) async {
    await Future.delayed(const Duration(milliseconds: 100));

    if (shouldSucceed) {
      _currentProfile = ProfileData(
        userName: userName,
        studentNumber: studentNumber,
        userHp: userHp,
        major: major,
        password: null,
      );
      return Result.ok(true);
    } else {
      return Result.error(Exception('Update profile failed'));
    }
  }

  @override
  Future<Result<bool>> checkDuplication({
    required String account,
  }) async {
    await Future.delayed(const Duration(milliseconds: 100));

    if (shouldSucceed) {
      return Result.ok(false);
    } else {
      return Result.error(Exception('Duplication check failed'));
    }
  }

  // 테스트 헬퍼 메서드
  ProfileData? get currentProfile => _currentProfile;

  void setProfile(ProfileData profile) {
    _currentProfile = profile;
  }
}
