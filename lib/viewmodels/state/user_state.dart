import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_state.freezed.dart';

/// 사용자 상태 모델
///
/// 가이드라인 2.1.2: ViewModel의 상태를 명확히 정의
@freezed
class UserState with _$UserState {
  const factory UserState({
    /// 인증 여부
    @Default(false) bool isAuthorized,

    /// 로딩 상태
    @Default(false) bool isLoading,

    /// 사용자 이름
    String? userName,

    /// 학번
    String? studentNumber,

    /// 전화번호
    String? userHp,

    /// 전공
    String? major,

    /// 에러 정보
    Exception? error,
  }) = _UserState;
}
