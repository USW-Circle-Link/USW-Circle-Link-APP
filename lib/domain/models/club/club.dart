import 'package:freezed_annotation/freezed_annotation.dart';

part 'club.freezed.dart';

part 'club.g.dart';

@freezed
class Club with _$Club {
  const factory Club({
    /// Club UUID
    required String clubUUID,

    /// Club name
    required String clubName,

    /// Main photo URL
    required String mainPhoto,

    /// Department name
    required String departmentName,

    /// Club hashtags
    required List<String> clubHashtags,
  }) = _Club;

  factory Club.fromJson(Map<String, Object?> json) => _$ClubFromJson(json);
}