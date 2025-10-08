import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_data.freezed.dart';

/// 토큰 데이터 모델
@freezed
class TokenData with _$TokenData {
  const factory TokenData({
    required String accessToken,
    required String refreshToken,
    required List<String> clubUUIDs,
  }) = _TokenData;
}
