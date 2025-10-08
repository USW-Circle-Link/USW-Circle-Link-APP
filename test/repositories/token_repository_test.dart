import 'package:flutter_test/flutter_test.dart';
import 'package:usw_circle_link/models/token_data.dart';
import 'package:usw_circle_link/utils/result.dart';

import '../fakes/fake_repositories.dart';

void main() {
  group('TokenRepository', () {
    late FakeTokenRepository tokenRepository;

    setUp(() {
      tokenRepository = FakeTokenRepository();
    });

    test('토큰 저장 성공', () async {
      // Given: TokenRepository 생성
      const accessToken = 'test_access_token';
      const refreshToken = 'test_refresh_token';
      const clubUUIDs = ['club1', 'club2'];

      // When: saveTokens 호출
      final result = await tokenRepository.saveTokens(
        accessToken: accessToken,
        refreshToken: refreshToken,
        clubUUIDs: clubUUIDs,
      );

      // Then: Result.ok 반환 및 저장 확인
      expect(result, isA<Ok<void>>());
      expect(tokenRepository.hasToken, isTrue);
      expect(tokenRepository.storedToken?.accessToken, accessToken);
      expect(tokenRepository.storedToken?.refreshToken, refreshToken);
      expect(tokenRepository.storedToken?.clubUUIDs, clubUUIDs);
    });

    test('토큰 조회 성공', () async {
      // Given: 저장된 토큰
      const accessToken = 'test_access_token';
      const refreshToken = 'test_refresh_token';
      const clubUUIDs = ['club1', 'club2'];

      await tokenRepository.saveTokens(
        accessToken: accessToken,
        refreshToken: refreshToken,
        clubUUIDs: clubUUIDs,
      );

      // When: getTokens 호출
      final result = await tokenRepository.getTokens();

      // Then: TokenData 반환
      expect(result, isA<Ok<TokenData>>());
      final tokenData = (result as Ok<TokenData>).value;
      expect(tokenData.accessToken, accessToken);
      expect(tokenData.refreshToken, refreshToken);
      expect(tokenData.clubUUIDs, clubUUIDs);
    });

    test('저장된 토큰이 없을 때 에러 반환', () async {
      // Given: 빈 storage (아무것도 저장하지 않음)

      // When: getTokens 호출
      final result = await tokenRepository.getTokens();

      // Then: Result.error 반환
      expect(result, isA<Error<TokenData>>());
      expect(tokenRepository.hasToken, isFalse);
    });

    test('토큰 삭제 성공', () async {
      // Given: 저장된 토큰
      await tokenRepository.saveTokens(
        accessToken: 'test_access_token',
        refreshToken: 'test_refresh_token',
        clubUUIDs: ['club1'],
      );
      expect(tokenRepository.hasToken, isTrue);

      // When: clearTokens 호출
      final result = await tokenRepository.clearTokens();

      // Then: Result.ok 반환 및 삭제 확인
      expect(result, isA<Ok<void>>());
      expect(tokenRepository.hasToken, isFalse);

      // 삭제 후 조회하면 에러 반환
      final getResult = await tokenRepository.getTokens();
      expect(getResult, isA<Error<TokenData>>());
    });

    test('여러 번 저장하면 마지막 값으로 덮어쓰기', () async {
      // Given: 첫 번째 토큰 저장
      await tokenRepository.saveTokens(
        accessToken: 'first_token',
        refreshToken: 'first_refresh',
        clubUUIDs: ['club1'],
      );

      // When: 두 번째 토큰 저장
      await tokenRepository.saveTokens(
        accessToken: 'second_token',
        refreshToken: 'second_refresh',
        clubUUIDs: ['club2', 'club3'],
      );

      // Then: 마지막 값만 저장됨
      final result = await tokenRepository.getTokens();
      expect(result, isA<Ok<TokenData>>());
      final tokenData = (result as Ok<TokenData>).value;
      expect(tokenData.accessToken, 'second_token');
      expect(tokenData.refreshToken, 'second_refresh');
      expect(tokenData.clubUUIDs, ['club2', 'club3']);
    });

    test('빈 clubUUIDs 배열로 저장 가능', () async {
      // Given: 빈 clubUUIDs
      const accessToken = 'test_token';
      const refreshToken = 'test_refresh';
      const clubUUIDs = <String>[];

      // When: saveTokens 호출
      final result = await tokenRepository.saveTokens(
        accessToken: accessToken,
        refreshToken: refreshToken,
        clubUUIDs: clubUUIDs,
      );

      // Then: 성공적으로 저장
      expect(result, isA<Ok<void>>());

      final getResult = await tokenRepository.getTokens();
      expect(getResult, isA<Ok<TokenData>>());
      final tokenData = (getResult as Ok<TokenData>).value;
      expect(tokenData.clubUUIDs, isEmpty);
    });
  });
}
