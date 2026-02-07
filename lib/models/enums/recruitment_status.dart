import 'package:freezed_annotation/freezed_annotation.dart';

/// 모집 상태 Enum
///
/// API 명세서 기준: OPEN, CLOSE
enum RecruitmentStatus {
  @JsonValue('OPEN')
  open,
  @JsonValue('CLOSE')
  close;

  const RecruitmentStatus();

  /// String 값으로부터 RecruitmentStatus 생성
  factory RecruitmentStatus.fromString(String value) {
    switch (value.toUpperCase()) {
      case 'OPEN':
        return RecruitmentStatus.open;
      case 'CLOSE':
        return RecruitmentStatus.close;
      default:
        throw ArgumentError('Invalid recruitment status: $value');
    }
  }

  /// String 값으로 변환
  String toApiString() {
    switch (this) {
      case RecruitmentStatus.open:
        return 'OPEN';
      case RecruitmentStatus.close:
        return 'CLOSE';
    }
  }
}
