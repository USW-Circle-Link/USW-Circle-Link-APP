import 'package:flutter_test/flutter_test.dart';
import 'package:usw_circle_link/models/change_pw_model.dart';
import 'package:usw_circle_link/models/login_data.dart';
import 'package:usw_circle_link/utils/result.dart';

import '../fakes/fake_repositories.dart';

void main() {
  group('AuthRepository - Result 패턴', () {
    late FakeAuthRepository authRepository;

    setUp(() {
      authRepository = FakeAuthRepository();
    });

    group('login', () {
      test('login 성공 시 Result.ok 반환', () async {
        // Given: shouldSucceed = true (기본값)
        authRepository.shouldSucceed = true;

        // When: login 호출
        final result = await authRepository.login(
          id: 'testuser',
          password: 'testpass',
          fcmToken: 'test_fcm_token',
        );

        // Then: Result.ok<LoginData> 반환
        expect(result, isA<Ok<LoginData>>());
        final loginData = (result as Ok<LoginData>).value;
        expect(loginData.accessToken, contains('fake_access_token'));
        expect(loginData.refreshToken, contains('fake_refresh_token'));
      });

      test('login 실패 시 Result.error 반환', () async {
        // Given: shouldSucceed = false
        authRepository.shouldSucceed = false;

        // When: login 호출
        final result = await authRepository.login(
          id: 'baduser',
          password: 'badpass',
          fcmToken: 'test_fcm_token',
        );

        // Then: Result.error 반환
        expect(result, isA<Error<LoginData>>());
        final error = (result as Error<LoginData>).error;
        expect(error.toString(), contains('Login failed'));
      });

      test('빈 아이디로 login 시 Result.error 반환', () async {
        // Given: shouldSucceed = true이지만 빈 아이디
        authRepository.shouldSucceed = true;

        // When: 빈 아이디로 login 호출
        final result = await authRepository.login(
          id: '',
          password: 'testpass',
          fcmToken: 'test_fcm_token',
        );

        // Then: Result.error 반환
        expect(result, isA<Error<LoginData>>());
      });
    });

    group('logout', () {
      test('logout 성공 시 Result.ok 반환', () async {
        // Given: shouldSucceed = true
        authRepository.shouldSucceed = true;

        // When: logout 호출
        final result = await authRepository.logout(
          accessToken: 'test_access_token',
          refreshToken: 'test_refresh_token',
        );

        // Then: Result.ok<bool> 반환
        expect(result, isA<Ok<bool>>());
        expect((result as Ok<bool>).value, isTrue);
      });

      test('logout 실패 시 Result.error 반환', () async {
        // Given: shouldSucceed = false
        authRepository.shouldSucceed = false;

        // When: logout 호출
        final result = await authRepository.logout(
          accessToken: 'test_access_token',
          refreshToken: 'test_refresh_token',
        );

        // Then: Result.error 반환
        expect(result, isA<Error<bool>>());
      });
    });

    group('changePW', () {
      test('changePW 성공 시 Result.ok 반환', () async {
        // Given: shouldSucceed = true, 일치하는 비밀번호
        authRepository.shouldSucceed = true;

        // When: changePW 호출
        final result = await authRepository.changePW(
          userPw: 'oldPassword',
          newPw: 'newPassword',
          confirmNewPw: 'newPassword',
        );

        // Then: Result.ok<ChangePwModel> 반환
        expect(result, isA<Ok<ChangePwModel>>());
        final changePwModel = (result as Ok<ChangePwModel>).value;
        expect(changePwModel.type, ChangePwModelType.changePW);
        expect(changePwModel.message, contains('변경'));
      });

      test('changePW 실패 시 Result.error 반환', () async {
        // Given: shouldSucceed = false
        authRepository.shouldSucceed = false;

        // When: changePW 호출
        final result = await authRepository.changePW(
          userPw: 'oldPassword',
          newPw: 'newPassword',
          confirmNewPw: 'newPassword',
        );

        // Then: Result.error 반환
        expect(result, isA<Error<ChangePwModel>>());
      });

      test('비밀번호 확인 불일치 시 Result.error 반환', () async {
        // Given: shouldSucceed = true, 불일치하는 비밀번호
        authRepository.shouldSucceed = true;

        // When: 불일치하는 비밀번호로 changePW 호출
        final result = await authRepository.changePW(
          userPw: 'oldPassword',
          newPw: 'newPassword',
          confirmNewPw: 'differentPassword',
        );

        // Then: Result.error 반환
        expect(result, isA<Error<ChangePwModel>>());
      });
    });

    group('resetPW', () {
      test('resetPW 성공 시 Result.ok 반환', () async {
        // Given: shouldSucceed = true
        authRepository.shouldSucceed = true;

        // When: resetPW 호출
        final result = await authRepository.resetPW(
          password: 'newPassword',
          confirmPassword: 'newPassword',
          uuid: 'test-uuid',
        );

        // Then: Result.ok<ChangePwModel> 반환
        expect(result, isA<Ok<ChangePwModel>>());
        final changePwModel = (result as Ok<ChangePwModel>).value;
        expect(changePwModel.type, ChangePwModelType.resetPW);
      });

      test('resetPW 실패 시 Result.error 반환', () async {
        // Given: shouldSucceed = false
        authRepository.shouldSucceed = false;

        // When: resetPW 호출
        final result = await authRepository.resetPW(
          password: 'newPassword',
          confirmPassword: 'newPassword',
          uuid: 'test-uuid',
        );

        // Then: Result.error 반환
        expect(result, isA<Error<ChangePwModel>>());
      });
    });

    group('회원가입 메서드들', () {
      test('sendMail Result 패턴 적용 확인', () async {
        // Given
        authRepository.shouldSucceed = true;

        // When
        final result = await authRepository.sendMail(email: 'test@test.com');

        // Then
        expect(result, isA<Ok>());
      });

      test('verifyId Result 패턴 적용 확인', () async {
        // Given
        authRepository.shouldSucceed = true;

        // When
        final result = await authRepository.verifyId(id: 'testId');

        // Then
        expect(result, isA<Ok<bool>>());
        expect((result as Ok<bool>).value, isTrue);
      });

      test('verifyEmail Result 패턴 적용 확인', () async {
        // Given
        authRepository.shouldSucceed = true;

        // When
        final result = await authRepository.verifyEmail(email: 'test@test.com');

        // Then
        expect(result, isA<Ok<bool>>());
      });

      test('findId Result 패턴 적용 확인', () async {
        // Given
        authRepository.shouldSucceed = true;

        // When
        final result = await authRepository.findId(email: 'test@test.com');

        // Then
        expect(result, isA<Ok>());
      });

      test('sendCode Result 패턴 적용 확인', () async {
        // Given
        authRepository.shouldSucceed = true;

        // When
        final result = await authRepository.sendCode(
          account: 'testAccount',
          email: 'test@test.com',
        );

        // Then
        expect(result, isA<Ok>());
      });

      test('verifyCode Result 패턴 적용 확인', () async {
        // Given
        authRepository.shouldSucceed = true;

        // When
        final result = await authRepository.verifyCode(
          code: '123456',
          uuid: 'test-uuid',
        );

        // Then
        expect(result, isA<Ok>());
      });
    });

    group('에러 케이스 통합', () {
      test('모든 메서드가 shouldSucceed=false일 때 Result.error 반환', () async {
        // Given
        authRepository.shouldSucceed = false;

        // When & Then
        expect(
          await authRepository.login(
            id: 'test',
            password: 'test',
            fcmToken: 'token',
          ),
          isA<Error>(),
        );
        expect(
          await authRepository.logout(
            accessToken: 'token',
            refreshToken: 'token',
          ),
          isA<Error>(),
        );
        expect(
          await authRepository.changePW(
            userPw: 'old',
            newPw: 'new',
            confirmNewPw: 'new',
          ),
          isA<Error>(),
        );
        expect(
          await authRepository.sendMail(email: 'test@test.com'),
          isA<Error>(),
        );
        expect(
          await authRepository.verifyId(id: 'testId'),
          isA<Error>(),
        );
      });
    });
  });
}
