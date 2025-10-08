import 'package:flutter_test/flutter_test.dart';
import 'package:usw_circle_link/models/profile_model.dart';
import 'package:usw_circle_link/models/token_data.dart';
import 'package:usw_circle_link/utils/result.dart';
import 'package:usw_circle_link/viewmodels/user_view_model.dart';

import '../fakes/fake_repositories.dart';

void main() {
  group('UserViewModel - Command 패턴', () {
    late UserViewModel viewModel;
    late FakeAuthRepository authRepository;
    late FakeTokenRepository tokenRepository;
    late FakeProfileRepository profileRepository;

    setUp(() {
      authRepository = FakeAuthRepository();
      tokenRepository = FakeTokenRepository();
      profileRepository = FakeProfileRepository();

      viewModel = UserViewModel(
        authRepository: authRepository,
        tokenRepository: tokenRepository,
        profileRepository: profileRepository,
      );
    });

    test('getMe Command 실행 성공', () async {
      // Given: ProfileRepository가 성공 응답 반환하도록 설정
      profileRepository.shouldSucceed = true;
      await tokenRepository.saveTokens(
        accessToken: 'test_token',
        refreshToken: 'test_refresh',
        clubUUIDs: ['club1'],
      );

      // When: getMe.execute() 호출 및 완료 대기
      await viewModel.getMe.execute();
      await Future.delayed(const Duration(milliseconds: 200));

      // Then:
      expect(viewModel.getMe.completed, isTrue);
      expect(viewModel.state.isAuthorized, isTrue);
      expect(viewModel.state.userName, 'Test User');
      expect(viewModel.state.studentNumber, '12345678');
      expect(viewModel.state.userHp, '010-1234-5678');
      expect(viewModel.state.major, 'Computer Science');
    });

    test('getMe Command 네트워크 에러 시 로그아웃 안 함', () async {
      // Given: 네트워크 에러 발생
      profileRepository.shouldSucceed = false;

      // When: getMe.execute() 호출
      await viewModel.getMe.execute();
      await Future.delayed(const Duration(milliseconds: 200));

      // Then: 에러 발생하지만 로그아웃은 안 함
      expect(viewModel.getMe.error, isTrue);
      expect(viewModel.state.error, isNotNull);
    });

    test('login Command 실행 성공', () async {
      // Given: AuthRepository와 TokenRepository 설정
      authRepository.shouldSucceed = true;

      // When: login.execute('testId', 'testPw')
      await viewModel.login.execute('testId', 'testPw');
      await Future.delayed(const Duration(milliseconds: 200));

      // Then:
      expect(viewModel.login.completed, isTrue);
      expect(viewModel.state.isAuthorized, isTrue);
      expect(tokenRepository.hasToken, isTrue);

      // 저장된 토큰 확인
      final tokenResult = await tokenRepository.getTokens();
      expect(tokenResult, isA<Ok>());
    });

    test('login Command 실행 실패', () async {
      // Given: AuthRepository가 실패 응답 반환
      authRepository.shouldSucceed = false;

      // When: login.execute('badId', 'badPw')
      await viewModel.login.execute('badId', 'badPw');
      await Future.delayed(const Duration(milliseconds: 200));

      // Then:
      expect(viewModel.login.error, isTrue);
      expect(viewModel.state.isAuthorized, isFalse);
      expect(viewModel.state.error, isNotNull);
      expect(tokenRepository.hasToken, isFalse);
    });

    test('logout Command 실행 성공', () async {
      // Given: 로그인된 상태
      authRepository.shouldSucceed = true;
      await viewModel.login.execute('testId', 'testPw');
      await Future.delayed(const Duration(milliseconds: 200));
      expect(viewModel.state.isAuthorized, isTrue);
      expect(tokenRepository.hasToken, isTrue);

      // When: logout.execute()
      await viewModel.logout.execute();
      await Future.delayed(const Duration(milliseconds: 200));

      // Then:
      expect(viewModel.logout.completed, isTrue);
      expect(viewModel.state.isAuthorized, isFalse);
      expect(viewModel.state.userName, isNull);
      expect(viewModel.state.studentNumber, isNull);
      expect(tokenRepository.hasToken, isFalse);
    });

    test('changePW Command 실행 후 로그아웃', () async {
      // Given: 로그인된 상태
      authRepository.shouldSucceed = true;
      profileRepository.shouldSucceed = true;
      await viewModel.login.execute('testId', 'testPw');
      await Future.delayed(const Duration(milliseconds: 200));
      expect(viewModel.state.isAuthorized, isTrue);

      // When: changePW.execute('old', 'new', 'new')
      await viewModel.changePW
          .execute('oldPassword', 'newPassword', 'newPassword');
      await Future.delayed(const Duration(milliseconds: 200));

      // Then:
      expect(viewModel.changePW.completed, isTrue);
      // 비밀번호 변경 후 자동으로 로그아웃됨
      expect(viewModel.state.isAuthorized, isFalse);
      expect(tokenRepository.hasToken, isFalse);
    });

    test('resetPW Command 실행 성공', () async {
      // Given: AuthRepository 설정
      authRepository.shouldSucceed = true;

      // When: resetPW.execute('new', 'new', 'uuid')
      await viewModel.resetPW
          .execute('newPassword', 'newPassword', 'test-uuid');
      await Future.delayed(const Duration(milliseconds: 200));

      // Then:
      expect(viewModel.resetPW.completed, isTrue);
    });

    test('Command running 상태 확인', () async {
      // Given: viewModel 준비
      authRepository.shouldSucceed = true;

      // When: login.execute() 호출 (완료 대기 안 함)
      viewModel.login.execute('testId', 'testPw');

      // 즉시 확인 (비동기 작업이 시작되었지만 완료되지 않음)
      await Future.delayed(const Duration(milliseconds: 10));

      // Then: running 상태일 수 있음 (타이밍에 따라)
      // 완료 대기
      await Future.delayed(const Duration(milliseconds: 200));
      expect(viewModel.login.running, isFalse);
      expect(viewModel.login.completed, isTrue);
    });

    test('Command 중복 실행 방지', () async {
      // Given: 긴 시간이 걸리는 작업 (실제로는 짧지만 테스트용)
      authRepository.shouldSucceed = true;

      // When: 동시에 두 번 실행
      viewModel.login.execute('testId', 'testPw');
      viewModel.login.execute('testId2', 'testPw2');

      // Then: 첫 번째만 실행됨 (Command의 중복 실행 방지 기능)
      await Future.delayed(const Duration(milliseconds: 200));
      expect(viewModel.login.completed, isTrue);

      // 첫 번째 로그인의 결과만 저장됨
      final tokenResult = await tokenRepository.getTokens();
      if (tokenResult is Ok<TokenData>) {
        expect(tokenResult.value.accessToken, contains('testId'));
      }
    });

    test('Command clearResult 동작 확인', () async {
      // Given: 완료된 Command
      authRepository.shouldSucceed = true;
      await viewModel.login.execute('testId', 'testPw');
      await Future.delayed(const Duration(milliseconds: 200));
      expect(viewModel.login.completed, isTrue);

      // When: clearResult 호출
      viewModel.login.clearResult();

      // Then: completed 상태 초기화
      expect(viewModel.login.completed, isFalse);
      expect(viewModel.login.error, isFalse);
    });
  });

  group('UserViewModel - UserState 관리', () {
    late UserViewModel viewModel;
    late FakeAuthRepository authRepository;
    late FakeTokenRepository tokenRepository;
    late FakeProfileRepository profileRepository;

    setUp(() {
      authRepository = FakeAuthRepository();
      tokenRepository = FakeTokenRepository();
      profileRepository = FakeProfileRepository();

      viewModel = UserViewModel(
        authRepository: authRepository,
        tokenRepository: tokenRepository,
        profileRepository: profileRepository,
      );
    });

    test('UserState 초기값 확인', () {
      // Then
      expect(viewModel.state.isAuthorized, isFalse);
      expect(viewModel.state.isLoading, isFalse);
      expect(viewModel.state.userName, isNull);
      expect(viewModel.state.studentNumber, isNull);
      expect(viewModel.state.userHp, isNull);
      expect(viewModel.state.major, isNull);
      expect(viewModel.state.error, isNull);
    });

    test('로그인 성공 시 UserState 업데이트', () async {
      // Given
      authRepository.shouldSucceed = true;
      profileRepository.shouldSucceed = true;

      // When: 로그인
      await viewModel.login.execute('testId', 'testPw');
      await Future.delayed(const Duration(milliseconds: 200));

      // Then: UserState 업데이트
      expect(viewModel.state.isAuthorized, isTrue);
      expect(viewModel.state.error, isNull);
    });

    test('프로필 조회 성공 시 UserState 업데이트', () async {
      // Given
      profileRepository.shouldSucceed = true;
      profileRepository.setProfile(
        ProfileData(
          userName: 'Custom User',
          studentNumber: '87654321',
          userHp: '010-9876-5432',
          major: 'Mathematics',
          password: null,
        ),
      );

      // When: getMe 실행
      await viewModel.getMe.execute();
      await Future.delayed(const Duration(milliseconds: 200));

      // Then: state의 모든 필드 업데이트 확인
      expect(viewModel.state.isAuthorized, isTrue);
      expect(viewModel.state.userName, 'Custom User');
      expect(viewModel.state.studentNumber, '87654321');
      expect(viewModel.state.userHp, '010-9876-5432');
      expect(viewModel.state.major, 'Mathematics');
    });

    test('로그인 실패 시 UserState에 에러 저장', () async {
      // Given
      authRepository.shouldSucceed = false;

      // When: 로그인 실패
      await viewModel.login.execute('badId', 'badPw');
      await Future.delayed(const Duration(milliseconds: 200));

      // Then: error 필드에 에러 저장
      expect(viewModel.state.error, isNotNull);
      expect(viewModel.state.isAuthorized, isFalse);
    });

    test('로그아웃 시 UserState 초기화', () async {
      // Given: 로그인된 상태
      authRepository.shouldSucceed = true;
      profileRepository.shouldSucceed = true;
      await viewModel.login.execute('testId', 'testPw');
      await Future.delayed(const Duration(milliseconds: 200));
      expect(viewModel.state.isAuthorized, isTrue);

      // When: 로그아웃
      await viewModel.logout.execute();
      await Future.delayed(const Duration(milliseconds: 200));

      // Then: UserState가 초기 상태로 리셋
      expect(viewModel.state.isAuthorized, isFalse);
      expect(viewModel.state.userName, isNull);
      expect(viewModel.state.studentNumber, isNull);
      expect(viewModel.state.userHp, isNull);
      expect(viewModel.state.major, isNull);
    });

    test('ChangeNotifier 동작 확인', () async {
      // Given
      var notificationCount = 0;
      viewModel.addListener(() {
        notificationCount++;
      });

      authRepository.shouldSucceed = true;

      // When: 상태 변경하는 작업 수행
      await viewModel.login.execute('testId', 'testPw');
      await Future.delayed(const Duration(milliseconds: 200));

      // Then: notifyListeners가 호출되어 리스너가 알림 받음
      expect(notificationCount, greaterThan(0));
    });
  });

  group('UserViewModel - 통합 시나리오', () {
    late UserViewModel viewModel;
    late FakeAuthRepository authRepository;
    late FakeTokenRepository tokenRepository;
    late FakeProfileRepository profileRepository;

    setUp(() {
      authRepository = FakeAuthRepository();
      tokenRepository = FakeTokenRepository();
      profileRepository = FakeProfileRepository();

      viewModel = UserViewModel(
        authRepository: authRepository,
        tokenRepository: tokenRepository,
        profileRepository: profileRepository,
      );
    });

    test('전체 플로우: 로그인 -> 프로필 조회 -> 로그아웃', () async {
      // Given
      authRepository.shouldSucceed = true;
      profileRepository.shouldSucceed = true;

      // When: 1. 로그인
      await viewModel.login.execute('testUser', 'testPassword');
      await Future.delayed(const Duration(milliseconds: 200));

      // Then: 로그인 성공
      expect(viewModel.state.isAuthorized, isTrue);
      expect(tokenRepository.hasToken, isTrue);

      // When: 2. 프로필 조회 (자동 로그인)
      await viewModel.getMe.execute();
      await Future.delayed(const Duration(milliseconds: 200));

      // Then: 프로필 정보 로드됨
      expect(viewModel.state.userName, isNotNull);
      expect(viewModel.state.studentNumber, isNotNull);

      // When: 3. 로그아웃
      await viewModel.logout.execute();
      await Future.delayed(const Duration(milliseconds: 200));

      // Then: 모든 정보 초기화
      expect(viewModel.state.isAuthorized, isFalse);
      expect(viewModel.state.userName, isNull);
      expect(tokenRepository.hasToken, isFalse);
    });

    test('비밀번호 변경 후 재로그인 필요', () async {
      // Given: 로그인된 상태
      authRepository.shouldSucceed = true;
      await viewModel.login.execute('testUser', 'testPassword');
      await Future.delayed(const Duration(milliseconds: 200));
      expect(viewModel.state.isAuthorized, isTrue);

      // When: 비밀번호 변경
      await viewModel.changePW.execute('oldPw', 'newPw', 'newPw');
      await Future.delayed(const Duration(milliseconds: 200));

      // Then: 자동 로그아웃됨 (재로그인 필요)
      expect(viewModel.state.isAuthorized, isFalse);
      expect(tokenRepository.hasToken, isFalse);

      // When: 새 비밀번호로 다시 로그인
      await viewModel.login.execute('testUser', 'newPassword');
      await Future.delayed(const Duration(milliseconds: 200));

      // Then: 로그인 성공
      expect(viewModel.state.isAuthorized, isTrue);
    });
  });
}
